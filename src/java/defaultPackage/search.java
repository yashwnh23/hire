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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yashwanth
 */
@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
           String state=request.getParameter("state");
           String city=request.getParameter("city");
           String area=request.getParameter("area");
           Connection con=DB.getConnections();
           PreparedStatement ps=con.prepareStatement("select * from users1 where state=? and city=? and area=? ");
           ps.setString(1, state);
           ps.setString(2, city);
           ps.setString(3, area);
           ResultSet rs=ps.executeQuery();
           out.print("<table>");
           while(rs.next()){
           out.print("<tr style='text-align=center;'><td><a href=''"+rs.getString(2)+"</td>");
           out.print("<td><img src='./management/images/"+rs.getString(5)+"pro.png' width='300px' height='300px'></td></tr></table>");
           }
           out.print("</table>");
        }
        catch(Exception e){out.println(e.getMessage());}
    }

}
