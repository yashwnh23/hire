<%-- 
Document   : booking
Created on : 20 Sep, 2018, 7:02:22 PM
Author     : yashwanth
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="defaultPackage.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" href="style.css">
<script>
function addRoom(){
var text='';  
var y= document.getElementById("floors").value;
for(var i=0;i<=y;i++){  
text+='<div id="room'+i+'" style="flex: 1;"><h1>Floor'+i+'</h1>';     
text+='<input type="text" id="floors'+i+'" name="noofroooms'+i+'" placeholder="number of rooms'+i+'" onInput="addbed('+i+')"  required/>'+'<br/>';
text+='<div id="bed'+i+'"></div></div>';
}
document.getElementById("room").innerHTML=text;
}
function addbed(j){
var z= document.getElementById("floors"+j).value; 
var text1="";    
for(var i=1;i<=z;i++){  
text1+='<input type="text" id="rooms'+j+i+'" name="noofbeds'+j+i+'" placeholder="number of beds of floor'+j+' room'+i+'"  required/>'+'<br/>';
text1+='<input type="file" name="img'+j+i +'" required> ';
text1+='<select name="washroom'+j+i+'" width="1000px">\n\
<option value="attached">one per room</option>\n\
<option value="common">Common</option>\n\
</select>\n\
\n\<select name="tv'+j+i+'" width="1000px">\n\
<option value="everyroom">Every room</option>\n\
<option value="oneperfloor">One per floor</option>\n\
<option value="oneperhostel">One per Hostel</option></select>';
}
document.getElementById("bed"+j).innerHTML=text1;
}
</script>
</head>
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
<%@include file="./header.jsp"%>

<%
try{
Connection con=DB.getConnections();
String query1 = "select * from hosteldetails where username=? ";
PreparedStatement ps=con.prepareStatement(query1);
ps.setString(1,user);
ResultSet i=ps.executeQuery();
ResultSetMetaData rsmd = i.getMetaData();
int columnsNumber = rsmd.getColumnCount();
i.last();
boolean z=i.first();
ArrayList floorno=new ArrayList();
ArrayList roomno=new ArrayList();
ArrayList noofbeds=new ArrayList();
ArrayList image=new ArrayList();
ArrayList washroom=new ArrayList();
ArrayList tv=new ArrayList();
int l=0;
int m=0;
String username="";
if(z){
while(z){
username=i.getString(1);
floorno.add(i.getInt(2));
roomno.add(i.getInt(3));
noofbeds.add(i.getInt(4));
image.add(i.getString(5));
washroom.add(i.getString(6));
tv.add(i.getString(7));
m++;
z=i.next();}%>
<form action="../booked" method="post">
<table style="width: 800px; border: black solid 2px ; margin: 10px;">
    <tr><td>Booking From:</td><td><input type="date" name="booking_date"></td></tr>
    <tr><td>Vacancy Date:</td><td><input type="date" name="vacancy_date"></td></tr>
<%for(int j=0;j<=(int)Collections.max(floorno);j++){
String query = "select max(roomno) from hosteldetails where username=? and floorno=?";
PreparedStatement st=con.prepareStatement(query);
st.setString(1, user);
st.setInt(2, j);
ResultSet noofrooms=st.executeQuery();
noofrooms.next();  %>

<tr><td style="border: black solid 1px; text-align: center;">Floor no:<%out.print(j);%></td></tr>
<tr >
<%for(int k=1;k<=noofrooms.getInt(1);k++){%>
<td style="border: black solid 2px ;">
<h5> Room no:<%=k%> </h5>
<h5><%for(int n=1;n<=(int)noofbeds.get(l);n++){
    String query2 = "select booking from roombooking where username=? and floorno=? and roomno=? and noofbeds=? ";
PreparedStatement ps2=con.prepareStatement(query2);
ps2.setString(1,user);
ps2.setInt(2,j);
ps2.setInt(3,k);
ps2.setInt(4,n);
ResultSet rs2=ps2.executeQuery();
if(rs2.next()){%>

<label class="container">
<input type="checkbox" name="bedno<%=j%><%=k%>" value="<%=n%>" style="border: black solid 2px ;">
<span class="checkmark1"><%=n%></span>  
</label>
<%}else{%>
<label class="container">
<input type="checkbox" name="bedno<%=j%><%=k%>" value="<%=n%>" style="border: black solid 2px ;">
<span class="checkmark"><%=n%></span>  
</label>
    <%}}
%></h5>
<img src="./images/<%out.print(username+j+k);%>.png" height="200px" width="200px">
<br><h5>Washroom:<%out.print(washroom.get(l));%></h5>
<h5>tv:<%out.print(tv.get(l));%></td></h5></td>
<%l++;}%></tr>
<% }%>

<tr><td><h3><span class="checkmark"><input type="checkbox"></span>Beds for booking</h3></td>
<td><h3><span class="checkmark1"><input type="checkbox"></span>Booked Beds</h3></td></tr>
<td><input type="submit" name="submit" value="booked"></td>
</table></form>
<%}
else{  
%>
<form action="../bookingUpdate" method="post" enctype="multipart/form-data">
<h1>No of floors:</h1>
<input type="text" id="floors" name="floors" onInput="addRoom()" placeholder="number of floors" required/>   
<div id="room" style="display: grid; grid-template-columns: repeat(3, 1fr);"></div> 
<input type="submit" name="submit" value="submit"/>
</form>
<%}}
catch(Exception e){};
%>
</body>
</html>