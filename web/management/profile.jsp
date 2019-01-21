<%-- 
Document   : profile
Created on : 3 Sep, 2018, 10:20:38 PM
Author     : yashwanth
--%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="defaultPackage.DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>JSP Page</title>
<link rel="stylesheet" href="style.css"/>
<script type="text/javascript">
function addTrans(){
var l =  document.querySelector('input[name="trans"]:checked').value;  
if(l=="yes"){
//document.getElementById("tran").style.display="block"; 
document.getElementById("tran1").style.display="inline"; 
}
else{ document.getElementById("tran").style.display="none"; 
document.getElementById("tran1").style.display="none"; }
}
function validate(){   
var z =  document.querySelector('input[name="food"]:checked').value;
if(z=="other"){ 
document.getElementById("desc1").style.display="inline"; 
//document.getElementById("desc").style.display="block";
}
else{ 
document.getElementById("desc").style.display="none"; 
document.getElementById("desc1").style.display="none"; }
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
String query = "select * from users1_profile,users1 where users1.username=? and users1_profile.username=?";
String query1 = "select * from users1 where username=?";
PreparedStatement ps=con.prepareStatement(query);
ps.setString(1, user);
ps.setString(2, user);
ResultSet i=ps.executeQuery();
if(i.next()){%>
<h2>Hostel details are already in profile</h2>
<%
//Blob ima=i.getBlob(2);
  InputStream in = i.getBinaryStream(2);
  File f=new File("/home/yashwanth/NetBeansProjects/HireAHostel/web/management/pro.png");
  FileOutputStream fos=new FileOutputStream(f);
  byte[] buffer=new byte[4096];
  int x=0;
  while((x=in.read(buffer))!=-1){

            fos.write(buffer,0,x);
            
  }    
  fos.flush();

%>
<img src="./images/<%=user%>pro.png" width="100%" height="300px">
<div align="center" float="left" style="display: grid;grid-template-columns:auto auto;
width: 40%;grid-gap: 1em;">
<div>Hostel Name</div>   <%out.println(i.getString(11)); %>
<div>Owner Name</div>    <%out.println(i.getString(12)); %>
<div>Phone</div>    <%out.println(i.getLong(13)); %>
<div>Email</div>    <%out.println(i.getString(15)); %>
<div>username</div>    <%out.println(i.getString(1)); %>
<div>transport</div>   <%out.println(i.getString(5)); %>
<div>gender</div>      <%out.println(i.getString(3)); %>
<div>wifi</div>      <%out.println(i.getString(4)); %>
<div>Hot Water</div>      <%out.println(i.getString(6)); %>
<div>self Cooking</div>      <%out.println(i.getString(7)); %>
<div>Food</div>      <%out.println(i.getString(8)); %>
<div>Type</div>      <%out.println(i.getString(9)); %>
<div class="btn"><a href="update_profile.jsp">Update</a></div>
</div>
<%}
else{%>
<h2>Hostel details</h2>
<form  action="../ProfileUpdate" method="POST" enctype="multipart/form-data" style="align-content: center">
<div align="center" style="display: grid;grid-template-columns:auto auto;
width: 80%;grid-gap: 1em;">
    <div>Profile image</div><div><input type="file" accept="image/*" name="img" autofocus="true"></div>
<div>Gender:</div><div><input type="radio" name="gender" value="male" autofocus="true" checked>Male
<input type="radio" name="gender" value="female" >Female<br></div>
<div>WiFi facility:</div><div><input type="radio" name="wifi" value="yes"checked>Yes
<input type="radio" name="wifi" value="no" >No<br></div>
<div>Transportation:</div>
<div onclick="addTrans()"><input type="radio" name="trans" value="yes"checked>Yes
<input type="radio" name="trans" value="no" >No<br>
<div id="tran1" style="display: none;"><textarea name="description" id="desc">
describe transport
</textarea></div>
</div>
<div>Hot Water:</div><div><input type="radio" name="water" value="yes"checked>Yes
<input type="radio" name="water" value="no">No<br></div>
<div>Self cooking Facilities:</div>
<div><input type="radio" name="cook" value="yes"checked>Yes
<input type="radio" name="cook" value="no">No<br></div>
<div>Food styles:</div>
<div onclick="validate()" style="cursor: pointer;">
<input type="radio" id="food" name="food" value="south"checked>South Indian
<input  type="radio" id="food1" name="food" value="north">North Indian
<input  type="radio" id="food2" name="food" value="other">Other
<div id="desc1" style="display: none;">
<textarea name="description" id="desc">describe food
</textarea>
</div>
</div>
<div id="desc" style="display: none;">Enter which type of food</div>

<div>Type of Hostels:</div><div><select name="typeofhostel" width="1000px">
<option value="ac">AC Hostels</option>
<option value="nonac">NON AC Hostels</option>
</select></div>
<input type='submit' value="Update Profile" style="width: 150px;">
</div>
<%}}
catch(Exception e){}%>
</form>         
</body>
</html>
