<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Page</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="./script/validate.js"></script>
</head>
<body>
<div class="header">
<img src="images/logo.jpeg">
<div style="float: right">
<a href="Login.jsp">Login</a>
<a href="Login.jsp">Register</a>
</div>
<div class="grid" style="width: 37%;background: buttonshadow;margin-left: 25%;">
<div><a href="Login.jsp">Login</a></div>
<div><a href="Register.html" >Register</a></div>
<div><a href="Mregister.html" style="background-color: #09cfcc">Register a hostel</a></div>
</div>
<div class="lrform">
<form  action="search.jsp" method="post" >
<input type='text' name="hostelname" placeholder="Hostel Name" required><br/>
<input type='text' name="name" placeholder="name" required><br/>
<input type='email' name="email" placeholder="Email" required><br/>
<input type='text' id="username" name="username" placeholder="Username" onblur="return uniqueid()" required>
<img id='grimg' src="images/green-tick.gif" height="20" width="20" style="display: none;" >  
<img id='rdimg' src="images/wrong.gif" height="20" width="20" style="display: none;"> <br/>
<input  type='text' name="phone" placeholder="Phone No" required><br/>
<input type='text' name="pincode" placeholder="Pin Code" required><br/>
<input type='text' name="password" id="password" placeholder="Password" required><br/>
<div class="val">
<input type='text' id="cpassword" name="cpassword" placeholder="Confirm Password" oninput="validateFunction()" required>
<img id="rimg"><br/><h5 id="h5" style="color: green"></h5>
</div>
<input type="hidden" value="management" name="categories"> 
<input type='submit' name="mregister" value="Register"><br/>
</form>
</div>
</div>
</body>
</html>