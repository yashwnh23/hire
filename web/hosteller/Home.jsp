<%-- 
    Document   : Home
    Created on : 24 Jul, 2018, 8:57:48 PM
    Author     : yashwanth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@include file="./header.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./style.css">
        <title>Home</title>
      
      
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
<div class="welcome">
         <marquee  behavior="alternate">
             Welcome <%=userName%> to Our Website.We show you best results for your search.
             Registration closes in  <div id="demo" style="display:inline;"></div> minutes!
<script>
var countDownDate = new Date();
countDownDate.setMinutes(countDownDate.getMinutes()+1);
var i=countDownDate.getTime(); 
var x = setInterval(function() {
    var now = new Date().getTime();
    
     var distance = i - now;

  // Time calculations for days, hours, minutes and seconds
  vaays = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  document.getElementById("demo").innerHTML = minutes + "m " + seconds + "s ";
  if(distance<0){
      window.location="http://localhost:8084/HireAHostel/hosteller/searchHostels.jsp";
  }
}, 1000);
</script>

         </marquee>   
        </div>
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
          <div class="grid">
           
              <div class="item1" ><a href="Login.jsp" ><h1>AC Hostels</h1></a></div>
            <div class="item1" > <h1>NON-AC Hostels</h1></div>
            <div class="item1" > <h1>Mens Hostels</h1></div>
            <div><a href="Login.jsp" ><img src="./images/ac.jpeg"></a></div>
            <div><img src="./images/nonac.jpeg"></div>
            <div><img src="./images/mens.jpeg"></div>
            <div class="item1"> <h1>Womens Hostels</h1></div>
           <div class="item1"> </div>
           <div class="item1"></div>
           <div><img src="./images/womens.jpeg"></div>
        </div>
</div>    

    </body>
</html>
