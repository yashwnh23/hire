<%-- 
    Document   : update_profile
    Created on : 30 Sep, 2018, 11:13:41 AM
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
<link rel="stylesheet" href="style.css">
<script>
    
    function addInput(){
  var y= document.getElementById("floor").value;
  
        alert(y);}
</script>
</head>
<%@include file="./header.jsp"%>
    <body>
        <%
//allow access only if session exists
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
%>
        <%
try{  
Connection con=DB.getConnections();
String query = "select * from users1_profile,users1 where users1.username=? and users1_profile.username=?";
String query1 = "select * from users1 where username=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, user);
ps.setString(2, user);
ResultSet i=ps.executeQuery();
if(i.next()){%>
<h2>Hostel details are already in profile</h2>
<div align="center" float="left" style="display: grid;grid-template-columns:auto auto;
width: 40%;grid-gap: 1em;">
    <div>Hostel Name</div>  <input type="text" value="<%out.println(i.getString(11));%>" name="t1">
<div>Owner Name</div>     <input type="text" value="<%out.println(i.getString(12)); %>" name="t1">
<div>Phone</div>     <input type="text" value="<%out.println(i.getLong(13)); %>" name="t1">
<div>Email</div>     <input type="text" value="<%out.println(i.getString(15)); %>" name="t1">
<div>username</div>     <input type="text" value="<%out.println(i.getString(1)); %>" name="t1">
<div>transport</div>   <div><input type="radio" name="cook" value="yes"checked>Yes
<input type="radio" name="cook" value="no">No</div>
<div>gender</div>    <div><select name="typeofhostel" width="1000px">
<option value="male">Male</option>
<option value="female">Female</option>
</select></div>
<div>wifi</div>       <div><input type="radio" name="cook" value="yes"checked>Yes
<input type="radio" name="cook" value="no">No</div>
<div>Hot Water</div>    <div><input type="radio" name="cook" value="yes"checked>Yes
<input type="radio" name="cook" value="no">No</div>
<div>self Cooking</div>  <div><input type="radio" name="cook" value="yes"checked>Yes
<input type="radio" name="cook" value="no">No</div>
<div>Food</div>    <div><input type="radio" id="food" name="food" value="south"checked>South Indian
<input  type="radio" id="food1" name="food" value="north">North Indian
<input  type="radio" id="food2" name="food" value="other">Other</div>
<div>Type</div>    <div><select name="typeofhostel" width="1000px">
<option value="ac">AC Hostels</option>
<option value="nonac">NON AC Hostels</option>
</select></div> 
<div class="btn"><a href="update_profile.jsp">Update</a></div>
</div>
<%}} catch(Exception e){}%>
       
    </body>
</html>
