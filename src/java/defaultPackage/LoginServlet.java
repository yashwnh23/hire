/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package defaultPackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class LoginServlet extends HttpServlet {
protected void service(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
try  {
PrintWriter out=response.getWriter();
String s=request.getParameter("email");
String p=request.getParameter("password");
String h=request.getParameter("categories");
String st=md5algorithm.md5(p);
Connection con=DB.getConnections();
if(h.equals("hosteller")){
String query = "select * from users where email=? and password=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, s);
ps.setString(2, st);
ResultSet rs=ps.executeQuery();
if(rs.next()){
Timestamp time1 = new Timestamp(System.currentTimeMillis());
PreparedStatement ps1=con.prepareStatement("insert into user_session (email,session_start) values (?,?)");
ps1.setString(1,s);
ps1.setTimestamp(2,time1);
int f=ps1.executeUpdate();
if(f==1){
out.print(f);
HttpSession sess=request.getSession();
sess.setAttribute("user", s);
Cookie userName = new Cookie("user", s);
response.addCookie(userName);
response.sendRedirect("./hosteller/Home.jsp");}
else{request.getRequestDispatcher("/Login.jsp").include(request, response);}
}}
else if(h.equals("management")){
String query = "select * from users1 where username=? and password=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, s);
ps.setString(2, st);
ResultSet rs=ps.executeQuery();
if(rs.next()){
Timestamp time1 = new Timestamp(System.currentTimeMillis());
PreparedStatement ps1=con.prepareStatement("insert into user_session (email,session_start) values (?,?)");
ps1.setString(1,s);
ps1.setTimestamp(2,time1);
int f=ps1.executeUpdate();
if(f==1){
out.print(f);
HttpSession sess=request.getSession();
sess.setAttribute("user", s);	
Cookie userName = new Cookie("user", s);
response.addCookie(userName);
response.sendRedirect("./management/Home.jsp");}
else{request.getRequestDispatcher("/Login.jsp").include(request, response);
}} 
else{request.getRequestDispatcher("/Login.jsp").include(request, response);
}}}
catch(Exception e){
System.out.println(e.getMessage());
e.printStackTrace();
}}}