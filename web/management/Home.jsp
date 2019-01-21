<%-- 
Document   : Home
Created on : 3 Sep, 2018, 9:33:58 PM
Author     : yashwanth
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./style.css">
<title>Home</title>
</head>
<body>
<%
String user = null;
if(session.getAttribute("user") == null){
response.sendRedirect("../Login.jsp");}
else user = (String) session.getAttribute("user");
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
</body>
</html>