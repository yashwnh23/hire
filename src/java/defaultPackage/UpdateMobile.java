/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package defaultPackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "UpdateMobile", urlPatterns = {"/update"})
public class UpdateMobile extends HttpServlet {
String userName,sessionID;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String nu=request.getParameter("phone");
       Long num=Long.parseLong(nu);
        response.setContentType("text/html;charset=UTF-8");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) {userName = cookie.getValue();}
	if(cookie.getName().equals("JSESSIONID")){ sessionID = cookie.getValue();}
}
        }
try (PrintWriter out = response.getWriter()) {
Connection con=DB.getConnections();
Timestamp time1 = new Timestamp(System.currentTimeMillis());
PreparedStatement ps=con.prepareStatement("insert into wallet values(?,?,?,?)");
ps.setString(1, userName);
ps.setFloat(2, (float) 00.00);
ps.setTimestamp(3, time1); 
ps.setLong(4, num);
int rs=ps.executeUpdate();
if(rs==1){
RequestDispatcher rd=request.getRequestDispatcher("./hosteller/Wallet.jsp");
rd.forward(request, response);
}
else{out.println("Enter mobile no");
    RequestDispatcher rd=request.getRequestDispatcher("./hosteller/Wallet.jsp");
rd.forward(request, response);}
}
catch(Exception e){e.printStackTrace();
PrintWriter out = response.getWriter();
out.println("Enter mobile no");
    RequestDispatcher rd=request.getRequestDispatcher("./hosteller/Wallet.jsp");
rd.forward(request, response);

}}}
