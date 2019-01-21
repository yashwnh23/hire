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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yashwanth
 */
@WebServlet(name = "updatewal", urlPatterns = {"/updatewal"})
public class updatewal extends HttpServlet {

  
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
String x=request.getParameter("money");
String t=request.getParameter("t1");
long l=Long.parseLong(x);
HttpSession sess=request.getSession();
String y=(String)sess.getAttribute("user");
try{Connection con=DB.getConnections();
    PreparedStatement ps=con.prepareStatement("update wallet set balance =balance+? where email=?");
    ps.setLong(1,l);
    ps.setString(2,y);
    int rs=ps.executeUpdate();
    PrintWriter out=response.getWriter();
    if(rs==1){
    response.sendRedirect("./hosteller/Wallet.jsp");}
    else{
    }
}
catch(Exception e){}
    }

    
}
