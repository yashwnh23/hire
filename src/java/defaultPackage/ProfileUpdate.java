/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package defaultPackage;
import org.apache.log4j.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
/**
*
* @author yashwanth
*/
@WebServlet(name = "ProfileUpdate", urlPatterns = {"/ProfileUpdate"})
@MultipartConfig
public class ProfileUpdate extends HttpServlet {
Connection con;PreparedStatement ps;
String uname,photo,gen,wifi,tran,h_wat,sc,food,type,g;
public void init(){
try{
con =DB.getConnections();
ps=con.prepareStatement("insert into users1_profile values(?,?,?,?,?,?,?,?,?)");
}
catch(Exception e){}
}
protected void service(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
//    Logger log=Logger.getLogger(ProfileUpdate.class.getName());
HttpSession sess=request.getSession();

wifi=request.getParameter("wifi");
tran=request.getParameter("trans");
h_wat=request.getParameter("water");
sc=request.getParameter("cook");
food=request.getParameter("food");
gen=request.getParameter("gender");
type=request.getParameter("typeofhostel");
Part p=request.getPart("img");
uname = (String)sess.getAttribute("user");
response.setContentType("text/html");
try (PrintWriter out = response.getWriter();) {
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from users1_profile");
rs.next();
rs.last();
InputStream fis=p.getInputStream();
File f=new File("/home/yashwanth/NetBeansProjects/HireAHostel/web/management/images/"+sess.getAttribute("user")+"pro.png");
  FileOutputStream fos=new FileOutputStream(f);
  byte[] buffer=new byte[4096];
  int x=0;
  while((x=fis.read(buffer))!=-1){
            fos.write(buffer,0,x);
  }    
  fos.flush();
ps.setString(1, uname);
ps.setString(2, "./images/"+sess.getAttribute("user")+"pro.png");
ps.setString(3, gen);
ps.setString(4, wifi);
ps.setString(5, tran);
ps.setString(6, h_wat);
ps.setString(7, sc);
ps.setString(8, food);
ps.setString(9, type);
int i=ps.executeUpdate();
response.sendRedirect("./management/profile.jsp");
}   
catch (SQLException ex) {
ex.printStackTrace();
}
}
}
