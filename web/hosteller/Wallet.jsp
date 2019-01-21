<%-- 
Document   : Wallet
Created on : 19 Aug, 2018, 10:17:49 AM
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
<div class="wallets">
 <%@include file="./header.jsp" %>
<div class="wal">
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
try{  
Connection con=DB.getConnections();
PreparedStatement ps=con.prepareStatement("select balance,phone from wallet where email=?");
ps.setString(1,userName);
ResultSet rs=ps.executeQuery();
if(rs.next()){%>
<div style="flex: 1;order: 2;"><h3 align="right">Current balance : &Tab;
<i><%out.println(rs.getFloat(1));%></i></h3></div>
<div style="flex: 1;width: 50%;order: 1;margin: auto;" align="left "><form action="../updatewal" >
<input type="hidden" name="t1" value="<%out.println(rs.getFloat(1));%>">
<input type="text" placeholder="Money in INR" name="money" id="money" style="text-decoration: none;">    
<input type="submit" value="Add Money"></form></h1><br> 
<div class="add"><div class="addValue" onclick="addVal(100)">+ &#8377 100</div>
<div class="addValue" onclick="addVal(200)">+ &#8377 200</div>
<div class="addValue" onclick="addVal(500)">+ &#8377 500</div>
<div class="addValue" onclick="addVal(1000)">+ &#8377 1000</div>
<div class="addValue" onclick="addVal(5000)">+ &#8377 5000</div></div>
<script type="text/javascript">
function addVal(y){
var v=document.getElementById("money").value;
var x=+v + +y; 
var z=document.getElementById("money").value=x;
}
</script><%  }
else{
%>
<div class="wallet">
<h1><form action="../update">
<input type="text" placeholder="Mobile no" name="phone" style="text-decoration: none;">
<input type="submit" value="update mobile"></form></h1>
<div class="walletbal"></div>
</div><%
}          }
catch(Exception e){e.printStackTrace();} %>
</div></div> 
<div class="offerslist" style="flex: 1;margin:30px;display: block;">
    <div class="offer">
        <div class="offname"><details><p>Hiii this is your offer.Invite your friend.</p>
        <summary>Filmy 100</summary>
    </details></div>
    </div>
    <div class="offer">
        <div class="offname"><details><p>Hiii this is your offer.Invite your friend  </p>
        <summary>Filmy 100</summary>
     </details></div>
    </div>
     <div class="offer">
        <div class="offname"><details><p>Hiii this is your offer.Invite your friend  </p>
        <summary>Filmy 100</summary>
    </details>
        </div></div>
    <div class="offer">
        <div class="offname"><details><p>Hiii this is your offer.Invite your friend  </p>
        <summary>Filmy 100</summary>
    </details></div></div>
</div></div>
</body>
</html>