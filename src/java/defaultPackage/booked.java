/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package defaultPackage;

import static defaultPackage.DB.con;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
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
@WebServlet(name = "booked", urlPatterns = {"/booked"})
public class booked extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
 String ts1 = null,ts2 = null;
            Date dt = null;
 Date dt1=null;
ArrayList rooms=new ArrayList();
HttpSession sess=request.getSession();
String user=(String) sess.getAttribute("user");
String query1 = "select max(floorno) from hosteldetails where username=?";
Connection con=DB.getConnections();
PreparedStatement st1=con.prepareStatement(query1);
st1.setString(1, user);
ResultSet rs=st1.executeQuery();
rs.next();
Timestamp ts=new Timestamp(System.currentTimeMillis());
if(request.getParameter("booking_date")!=""){
ts1= request.getParameter("booking_date");
dt=Date.valueOf(ts1);}
else if(request.getParameter("vacancy_date")!=""){
ts2= request.getParameter("vacancy_date");
dt1=Date.valueOf(ts2);}
for(int k=0;k<=rs.getInt(1);k++){
String query = "select max(roomno) from hosteldetails where username=? and floorno=?";
PreparedStatement st=con.prepareStatement(query);
st.setString(1, user);
st.setInt(2, k);
ResultSet rs1=st.executeQuery();
rs1.next();
for(int l=1;l<=rs1.getInt(1);l++){
String v=request.getParameter("bedno"+k+l);
if(dt1!=null){
if(v!=null){ 
String query3="update roombooking set returning_date=?, booking=? where username=? and floorno=? and roomno=? and noofbeds=? and joining_date<?";
PreparedStatement st3=con.prepareStatement(query3);
st3.setDate(1,dt1);
st3.setString(2, "not");
st3.setString(3,user);
st3.setInt(4, k);
st3.setInt(5, l);
st3.setInt(6,Integer.parseInt(v));
st3.setDate(7, dt1);
int rs3=st3.executeUpdate();
}}
if(dt!=null){
if(v!=null){  
String query2 = "insert into roombooking (username,floorno,roomno,noofbeds,joining_date,booking) values (?,?,?,?,?,?)";
PreparedStatement st2=con.prepareStatement(query2);
st2.setString(1, user);
st2.setInt(2, k);
st2.setInt(3, l);
st2.setInt(4,Integer.parseInt(v));
st2.setDate(5, dt);
st2.setString(6, "ok");
int rs2=st2.executeUpdate();
}}}}
response.sendRedirect("./management/booking.jsp");
}  
        catch(Exception e){}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
