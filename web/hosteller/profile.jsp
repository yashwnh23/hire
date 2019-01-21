<%-- 
    Document   : profile
    Created on : 5 Jan, 2019, 7:26:39 PM
    Author     : yashwanth
--%>

<%@page import="defaultPackage.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./style.css">
    </head>
    
        <%@include file="./header.jsp" %>
        <% Connection con=DB.getConnections();
        
           PreparedStatement ps=con.prepareStatement("select * from users1 where username=?");
           ps.setString(1, request.getParameter("username"));
           ResultSet rs=ps.executeQuery();
           PreparedStatement ps1=con.prepareStatement("select * from users1_profile where username=?");
           ps1.setString(1, request.getParameter("username"));
           ResultSet rs1=ps1.executeQuery();
       while(rs.next()){
           rs1.next();
       
       %>
        <img src="../management/images/<%=rs.getString(5)%>pro.png" width="100%" height="300px">
        <table>
        <tr><td><h4>Username:</td><td><%=request.getParameter("username")%></td></h4>
        <tr><td><h4>Hostel Name:</td><td><%=rs.getString(2)%></td></h4>
        <tr><td><h4>Gender:</td><td><%=rs1.getString(3)%></h4></td>
        <tr><td><h4>WIFI:</td><td><%=rs1.getString(4)%></h4></td>
        <tr><td><h4>Transport:</td><td><%=rs1.getString(5)%></h4></td>
        <tr><td><h4>Hot Water:</td><td><%=rs1.getString(6)%></h4></td>
        <tr><td><h4>Self cooking:</td><td><%=rs1.getString(7)%></h4></td>
        <tr><td><h4>Food:</td><td><%=rs1.getString(8)%></h4></td>
        <tr><td><h4>Type:</td><td><%=rs1.getString(9)%></h4></td></table>
        <form action="./book.jsp" method="post">
        <input type="hidden" name="username" value="<%=rs.getString(5)%>" />
        <%}%> 
        
        <input type="submit" value="book a bed"></form>
     
</html>
