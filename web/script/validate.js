/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
document.getElementById("grimg").style.display = "none";        
document.getElementById("rdimg").style.display = "none";
function uniqueid(){
var uid=document.getElementById("username").value;
alert(uid);
var ourRequest = new XMLHttpRequest();
ourRequest.open('GET', 'http://localhost:8084/HireAHostel/DupliacteCheckServlet?uid='+uid);
ourRequest.onload = function() {
var ourData = ourRequest.responseText;
renderHTML(ourData);
};
ourRequest.send();
function renderHTML(data) {
if (data.trim() != "Proceed") {
// alert("USERID " + uid + " already exist");
document.getElementById("grimg").style.display = "none";        
document.getElementById("rdimg").style.display = "inline";
document.getElementById('username').value = "";
return false;} 
else {
document.getElementById("rdimg").style.display = "none";
document.getElementById("grimg").style.display = "inline";
}}}  


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
function yash(){
alert("hii");
}   
