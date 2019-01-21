<%-- 
    Document   : searchResults
    Created on : 5 Jan, 2019, 6:02:41 PM
    Author     : yashwanth
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="defaultPackage.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./style.css">
    </head>
    <body>
        <%@include file="./header.jsp" %>
        <table>
        <% String state=request.getParameter("state");
           String city=request.getParameter("city");
           String area=request.getParameter("area");
           Connection con=DB.getConnections();
           PreparedStatement ps=con.prepareStatement("select * from users1 where state=? and city=? and area=? ");
           ps.setString(1, state);
           ps.setString(2, city);
           ps.setString(3, area);
           ResultSet rs=ps.executeQuery();
           while(rs.next()){
        %>
        <tr>
        <form action="./profile.jsp" method="post">    
        <input type="hidden" name="username" value="<%=rs.getString(5)%>" />    
        <td><input name="submit" type="submit" value="<%=rs.getString(5)%>"/></td>
        </tr><tr>
        <td>
        <img src="../management/images/<%=rs.getString(5)%>pro.png" width="100%" height="300px">
        </td></tr></form>
        <%}%>
        </table>
    </body>
</html>
