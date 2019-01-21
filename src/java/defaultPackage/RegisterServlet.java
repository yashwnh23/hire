 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package defaultPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
           {
         try {
             PrintWriter out=response.getWriter();
            Connection con=DB.getConnections();
            String name=request.getParameter("name");
            String sname=request.getParameter("sname");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String password=request.getParameter("password");
            String cpassword=request.getParameter("cpassword");
            String categories=request.getParameter("categories");
            Long l=Long.parseLong(phone);
if((categories.equals("hosteller"))){
     
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    PreparedStatement ps=con.prepareStatement("insert into users (name,surname,email,contact,password,trn_date) values(?,?,?,?,?,?)");
    ps.setString(1, name);
    ps.setString(2, sname);
    ps.setString(3,email);
    ps.setLong(4, l);
    ps.setString(5,md5algorithm.md5(password));
    ps.setTimestamp(6, timestamp);
    int z=ps.executeUpdate();
    
    if(z>0){
        out.println("<h2>successfully registered</h2>");
        request.getRequestDispatcher("./Login.jsp").include(request, response);
    }
    else{
        out.println("<h2>Didnot registerd please check mail</h2>");
        request.getRequestDispatcher("./Register.jsp").include(request, response);
    }}}
catch(Exception e)
        {
         PrintWriter out=response.getWriter();
         out.println("<h2>Didnot registerd please check mail</h2>");
        request.getRequestDispatcher("./Register.jsp").include(request, response);
        }    }

    
}
