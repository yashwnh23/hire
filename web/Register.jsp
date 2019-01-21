<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="defaultPackage.DB"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
<link rel="stylesheet" href="style.css">
<script src="javascript.js"></script> 
<script>
document.getElementById("grimg").style.display = "none";        
document.getElementById("rdimg").style.display = "none";
function uniqueid(){
var uid=document.getElementById("email").value;
//alert(uid);
var ourRequest = new XMLHttpRequest();
ourRequest.open('GET', 'http://localhost:8084/HireAHostel/DupliacteCheckServlet?uid='+uid);
ourRequest.onload = function() {
var ourData = ourRequest.responseText;
renderHTML(ourData);
};
ourRequest.send();
function renderHTML(data) {
if (data.trim() != "Proceed") {
// alert("USERID--> " + uid + " already exist");
document.getElementById("grimg").style.display = "none";        
document.getElementById("rdimg").style.display = "inline";
document.getElementById('email').value = "";
return false;
} 
else {
document.getElementById("rdimg").style.display = "none";
document.getElementById("grimg").style.display = "inline";
}}}      
</script>
<script>
function validateFunction(){
var x = document.getElementById("cpassword").value;
var y = document.getElementById("password").value;
if(x==y){
document.getElementById('rimg').src = 'images/green-tick.gif';
document.getElementById('h5').innerHTML="password match";}
else{
document.getElementById('rimg').src = 'images/wrong.gif';
document.getElementById('h5').innerHTML="password does not match".fontcolor("red");
}}
</script>
</head>
<body>
<div class="header">
<img src="images/logo.jpeg">
<div style="float: right">
    <ul>    
        <li><a href="Login.jsp">Login</a></li>           
        <li><a href="Login.jsp">Register</a></li>
    </ul></div>
<div class="grid" style="width: 37%;background: buttonshadow;margin-left: 25%;">
<div><a href="Login.jsp">Login</a></div>
<div><a href="Register.html" style="background-color: #09cfcc">Register</a></div>
<div><a href="Mregister.html">Register a hostel</a></div>
</div>
<div class="lrform">
<form  action="RegisterServlet">
<input type='text' name="name" placeholder="Name"><br/>
<input type='text' name="sname" placeholder="Surname"><br/>
<input type='email' name="email" id="email" placeholder="Email" onblur="return uniqueid()">
<img id='grimg' src="images/green-tick.gif" height="20px" width="20px" style="display:none;">  
<img id='rdimg' src="images/wrong.gif" height="20px" width="20px" style="display:  none;"> <br/>
<input  type='text' name="phone" placeholder="Phone No" ><br/>
<input type='password' name="password" placeholder="Password" id="password" ><br/>
<div class="val"><input type="password" oninput="validateFunction()" placeholder="Confirm Password" name="cpassword" id="cpassword">
<img id="rimg">
<br/><h5 id="h5" style="color: green"></h5>
</div>
<input type="hidden" value="hosteller" name="categories"> 
<input type='submit' name="register" value="Register" ><br/>
</form>
</div>
</div>
</body>
</html>