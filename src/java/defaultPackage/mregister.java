/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package defaultPackage;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
*
* @author yashwanth
*/
@WebServlet(name = "mregister", urlPatterns = {"/mregister"})
public class mregister extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
try {
     PrintWriter out=response.getWriter();
    Connection con=DB.getConnections();
    String hname=request.getParameter("hostelname");
    String name=request.getParameter("name");
    String username=request.getParameter("username");
    String email=request.getParameter("email");
    String phone=request.getParameter("phone");
    String password=request.getParameter("password");
    String cpassword=request.getParameter("cpassword");
    String categories=request.getParameter("categories");
    String state=request.getParameter("state");
    String city=request.getParameter("city");
    String area=request.getParameter("area");
    Long l=Long.parseLong(phone);
if((categories.equals("management"))){

Timestamp timestamp = new Timestamp(System.currentTimeMillis());
PreparedStatement ps=con.prepareStatement("insert into users1 (hostelname,name,contact,username,email,password,trn_date,state,city,area)  values (?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,hname);
ps.setString(2, name);
ps.setLong(3,Long.parseLong(phone));
ps.setString(4,username);
ps.setString(5,email);
ps.setString(6,md5algorithm.md5(password));
ps.setTimestamp(7, timestamp);
ps.setString(8, state);
ps.setString(9, city);
ps.setString(10, area);
int z=ps.executeUpdate();

if(z>0){
out.println("<h2>successfully registered</h2>");
request.getRequestDispatcher("./Login.jsp").include(request, response);
}
else{
out.println("<h2>Didnot registerd</h2>");
request.getRequestDispatcher("./Mregister.jsp").include(request, response);
}}}
catch(Exception e)
{
 PrintWriter out=response.getWriter();
 out.println("<h2>Didnot registerd please check mail</h2>");
request.getRequestDispatcher("./Mregister.jsp").include(request, response);
e.printStackTrace();
}  
}
}
