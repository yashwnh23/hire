<%-- 
    Document   : book
    Created on : 5 Jan, 2019, 10:02:40 PM
    Author     : yashwanth
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
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
    </head>
    <body>
     <%
String user = null;
if(session.getAttribute("user") == null){
response.sendRedirect("../Login.jsp");
}else user = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
if(cookie.getName().equals("user")) userName = cookie.getValue();
if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
Connection con=DB.getConnections();
String query1 = "select floorno,roomno,noofbeds from hosteldetails where username=? ";
PreparedStatement ps=con.prepareStatement(query1);
ps.setString(1, request.getParameter("username"));
ResultSet rs=ps.executeQuery();
Boolean z=rs.next();
ArrayList floorno=new ArrayList();
ArrayList roomno=new ArrayList();
ArrayList noofbeds=new ArrayList();
while(rs.next()){
floorno.add(rs.getInt(1));
roomno.add(rs.getInt(2));
noofbeds.add(rs.getInt(3));
}%>
<table style="width: 800px; border: black solid 2px ; margin: 10px;">
    <form action="./book.jsp" method="post">
    <tr><td>Booking From:</td>
        <input type="hidden" name="username" value="<%=request.getParameter("username")%>">
    <td><input type="date" name="joining_date"></td>
    <td><input type="submit" name="join" value="joining_data"> </td></tr></form>     
     <%
for(int j=0;j<=(int)Collections.max(floorno);j++){
String query = "select max(roomno) from hosteldetails where username=? and floorno=?";
PreparedStatement st=con.prepareStatement(query);
st.setString(1, request.getParameter("username"));
st.setInt(2, j);
ResultSet noofrooms=st.executeQuery();
noofrooms.next();
     %> 
     <tr><td><h4>Floor no : <%=j%></h4></td></tr>
   <tr> <%for(int k=1;k<=(int)roomno.get(j);k++){%>
<td style="border: black solid 2px ;">
    <h5> Room no:<%=k%> </h5></td>
<td>No of beds</td>
<%}%></tr>
<tr>
<%for(int k=1;k<=(int)roomno.get(j);k++){%>
<td><img src="../management/images/<%out.print(request.getParameter("username")+j+k);%>.png" height="200px" width="200px">
    </td>
    <%}%> </tr> 

<%}%>
     </table>
     
     <table>
             
         
        </table>
        
    </body>
</html>
