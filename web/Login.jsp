<%-- 
    Document   : Login
    Created on : 22 Jul, 2018, 3:59:11 PM
    Author     : yashwanth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
                   
<link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="header">
            <img src="images/logo.jpeg">
              <div style="float: right">
                 <a href="Login.jsp">Login</a>
                 
             <a href="Register.html">Register</a>
              </div>
            <div class="grid" style="width: 37%;background: buttonshadow;margin-left: 25%;">
                <div><a href="Login.jsp" style="background-color: #09cfcc">Login</a></div>
                <div><a href="Register.html" >Register</a></div>
                <div><a href="Mregister.html">Register a hostel</a></div>
            </div>
            <div class="lrform">
            <form  action="LoginServlet" method="POST" >
                 <input type='text' name="email" placeholder="Email or username"><br/>
                 <input type='text' name="password" placeholder="Password"><br/>
                 <select name="categories">
                     <option value="hosteller">Hosteller</option>
                     <option value="management">Member</option>
                 </select>
                     <br/>
                 <input type='submit' value="Login"><br/>
                 </form>
        </div>
            </div>
    </body>
</html>
