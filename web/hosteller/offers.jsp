<%-- 
    Document   : offers
    Created on : 21 Aug, 2018, 6:39:38 PM
    Author     : yashwanth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./style.css">
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

        <div><%@include file="./header.jsp" %>
            <div width="100%" class="slider">
<div class="slideshow-container">

<div class="myslides fade">

<div class="numbers">1 / 4</div>

<div class="img"><img src="../images/bg1.jpg" width="100%" height="300px"></div>

<div class="caption">Text 1</div>

</div>

<div class="myslides fade">

<div class="numbers">2 / 4</div>

<div class="img"><img src="../images/bg4.jpeg" width="100%" height="300px"></div>

<div class="caption">Text 2</div>

</div>

<div class="myslides fade">

<div class="numbers">3 / 4</div>

<div class="img"><img src="../images/bg6.jpg" width="100%" height="300px"></div>

<div class="caption">Text 3</div>

</div>

<div class="myslides fade">

<div class="numbers">4 / 4</div>

<div class="img"><img src="../images/bg5.jpeg" width="100%" height="300px"></div>

<div class="caption">Text 4</div>

</div>
<div class="caption1">offers</div>
<div class="caption2">terms & conds</div>

<div class="pn"><a class="prev" onclick="plusSlides(-1)">&#10094;</a>

<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div></div>

<br>

<div style="text-align:center">

<span class="dots" onclick="currentSlide(1)"></span> 

<span class="dots" onclick="currentSlide(2)"></span> 

<span class="dots" onclick="currentSlide(3)"></span> 

<span class="dots" onclick="currentSlide(4)"></span> 

</div>


<script type="text/javascript">

var slideIndex = 1;
showSlide1();
//showSlide(slideIndex);

function plusSlides(n){

showSlide(slideIndex += n);

}

function currentSlide(n) {

showSlide(slideIndex = n);

}
function showSlide1(){

var i;

var slides = document.getElementsByClassName("myslides");

var dots = document.getElementsByClassName("dots");

if (slideIndex > slides.length) { slideIndex = 1};

if (slideIndex < 1) { slideIndex = slides.length};

for (i=0;i<slides.length;i++) {

slides[i].style.display = "none";

};
for (i=0;i<dots.length;i++) {

dots[i].className = dots[i].className.replace(" active","");

};

slides[slideIndex-1].style.display = "block";

dots[slideIndex-1].className += " active";
slideIndex++;
setTimeout(showSlide1,8000);
}
function showSlide(n){

var i;

var slides = document.getElementsByClassName("myslides");

var dots = document.getElementsByClassName("dots");

if (n > slides.length) { slideIndex = 1};

if (n < 1) { slideIndex = slides.length};

for (i=0;i<slides.length;i++) {

slides[i].style.display = "none";

};

for (i=0;i<dots.length;i++) {

dots[i].className = dots[i].className.replace(" active","");

};

slides[slideIndex-1].style.display = "block";

dots[slideIndex-1].className += " active";

}


</script>
<div class="offerslist">
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
</div>
</div>
    </body>
</html>
