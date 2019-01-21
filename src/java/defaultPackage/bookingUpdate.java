/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package defaultPackage;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
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
@WebServlet(name = "bookingUpdate", urlPatterns = {"/bookingUpdate"})
@MultipartConfig
public class bookingUpdate extends HttpServlet {
int floors;
Connection con;PreparedStatement ps;

@Override
public void init(){
con=DB.getConnections();
    try {
        ps=con.prepareStatement("insert into hosteldetails values(?,?,?,?,?,?,?)");
    } catch (SQLException ex) {
        Logger.getLogger(bookingUpdate.class.getName()).log(Level.SEVERE, null, ex);
    }
}
protected void service(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

response.setContentType("text/html;charset=UTF-8");
try (PrintWriter out = response.getWriter()) {
HttpSession sess=request.getSession();
ArrayList<Integer> rooms=new ArrayList<Integer>();
floors=Integer.parseInt(request.getParameter("floors"));
ArrayList<bed> beds=new ArrayList<bed>();
String user=(String) sess.getAttribute("user");

for(int i=0;i<=floors;i++){
    rooms.add(Integer.parseInt(request.getParameter("noofroooms"+i)));
for(int l=1;l<=rooms.get(i);l++){
Part p=request.getPart("img"+i+l);
InputStream fis=p.getInputStream();
File f=new File("/home/yashwanth/NetBeansProjects/HireAHostel/web/management/images/"+user+i+l+".png");
  FileOutputStream fos=new FileOutputStream(f);
  byte[] buffer=new byte[4096];
  int x=0;
  while((x=fis.read(buffer))!=-1){
            fos.write(buffer,0,x);
  }    
  fos.flush();
ps.setString(1, user);
ps.setInt(2, i);
ps.setInt(3, l);
ps.setInt(4, Integer.parseInt(request.getParameter("noofbeds"+i+l)));
ps.setString(5, user+i+l);
ps.setString(6,request.getParameter("washroom"+i+l));
ps.setString(7,request.getParameter("tv"+i+l));
int z=ps.executeUpdate();

}

}
 response.sendRedirect("./management/booking.jsp");  
}
catch (SQLException ex) {
        Logger.getLogger(bookingUpdate.class.getName()).log(Level.SEVERE, null, ex);
}

}
}

