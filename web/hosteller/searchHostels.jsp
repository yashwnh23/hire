<%-- 
    Document   : searchHostels
    Created on : 5 Aug, 2018, 8:48:02 PM
    Author     : yashwanth
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./style.css">
        <title>Search Hostels</title>
        <style>
        </style>
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
 <%@include file="./header.jsp" %>
 <div class="left" style="width:80%;float: left;">
            <div class="grid2">
            <div class="grid" >
            <div class="item1" ><a href="Login.jsp" ><h1>AC Hostels</h1></a></div>
            <div class="item1" > <h1>NON-AC Hostels</h1></div>
            <div class="item1" > <h1>Mens Hostels</h1></div>
            <div><a href="Login.jsp" ><img src="./images/ac.jpeg"></a></div>
            <div><img src="./images/nonac.jpeg"></div>
            <div><img src="./images/mens.jpeg"></div>
            <div class="item1"><h1>Womens Hostels</h1></div>
            <div class="item1"></div>
            <div class="item1"></div>
            <div><img src="./images/womens.jpeg"></div>
            </div>
            </div>
            </div>
 <div class="search" style="width: 20%;float: right;margin-top: 100px; ">
                <form action="./searchResults.jsp">
                    <input type="text" placeholder="state" name="state" ><br/>
                    <input type="text" placeholder="city" name="city" ><br/>
                    <input type="text" placeholder="Area in the city" name="area" ><br/>
                    <input type="submit" value="search" >
                </form>
            </div> 
    </body>
</html>
