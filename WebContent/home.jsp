<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<style type="text/css">
div#container
{
   width: 994px;
   position: relative;
   margin-top: 0px;
   margin-left: auto;
   margin-right: auto;
   text-align: left;
}
body
{
   text-align: center;
   margin: 0;
   background-color: #1A1A1A;
   background-image: url(images/home/bodybg.jpg);
   background-repeat: no-repeat;
   background-position: center top;
   color: #444444;
}
</style>
<style type="text/css">
p, span, div, ol, ul, li, td, button, input, textarea, form
{
   margin: 0;
   padding: 0;
}
a
{
   color: #0000FF;
   outline: none;
   text-decoration: underline;
}
a:visited
{
   color: #800080;
}
a:active
{
   color: #0000FF;
}
a:hover
{
   color: #0000FF;
   text-decoration: underline;
}
</style>
<style type="text/css">
#wb_Text1 
{
   background-color: transparent;
   border: 0px #000000 solid;
   padding: 0;
}
#wb_Text1 div
{
   text-align: center;
}
#wb_Text2 
{
   background-color: transparent;
   border: 0px #000000 solid;
   padding: 0;
}
#wb_Text2 div
{
   text-align: center;
}
#wb_Text9 
{
   background-color: transparent;
   border: 0px #000000 solid;
   padding: 0;
}
#wb_Text9 div
{
   text-align: center;
}
#NavigationBar1 ul.navbar
{
   list-style: none;
   margin: 0;
   padding: 0;
}
#NavigationBar1 ul.navbar li
{
   height: 30px;
   width: 131px;
   float: left;
   margin: 0px 15px 0px 0px;
}
#NavigationBar1 ul.navbar li a
{
   display: block;
   position: relative;
}
#NavigationBar1 ul.navbar li a img
{
   position: absolute;
   z-index: 1;
   border-width: 0px;
}
#NavigationBar1 ul.navbar li span
{
   display: block;
   height: 30px;
   width: 131px;
   position: absolute;
   z-index: 2;
}
#NavigationBar1 a .hover
{
   visibility: hidden;
}
#NavigationBar1 a:hover .hover
{
   visibility: visible;
}
#NavigationBar1 a:hover span
{
   visibility: hidden;
}
</style>
<script>
var uname;
var runame;
var pagename;
<%	
String suname = (String)session.getAttribute("uname");
String puname = request.getParameter("uname");
String realname = request.getParameter("user");
String pageload = request.getParameter("page");  // the page to be included

if(pageload == null)
{
	pageload = "CMD.jsp";
}

	if(suname != null && puname != null && suname.equals(puname))
{
%>
uname = "<%=puname%>";
runame = "<%=realname%>";
pagename = "<%=pageload%>";
pagename = pagename.substring(0, pagename.length-4);
<%}
else if(suname == null || puname == null || suname.equals(puname) != true )
{%>
 
	alert("Please login again !!");
 	window.location = "index.html";

<%}%>

function loadpage()
{
	window.document.title = "RCC : " + runame + " ( " + pagename + " )";
}

function navigator(page)
{
	document.getElementById("page").value = page;
	document.forms["pagef"].submit();
}

function logOut()
{
	document.getElementById("username").value = uname;
	document.getElementById("logoutform").submit();
}
</script>
</head>

<body onLoad="loadpage()">
<div id="container">
<div id="wb_Shape1" style="position:absolute;left:204px;top:131px;width:643px;height:416px;z-index:0;padding:0;">
<img src="images/home/img0001.gif" id="Shape1" alt="" title="" style="border-width:0;width:643px;height:416px;"></div>
<div id="wb_Text1" style="position:absolute;left:124px;top:19px;width:762px;height:38px;text-align:center;z-index:1;">
<span style="color:#EEEEEE;font-family:verdana;font-size:32px;"><strong>Remote Command & Control</strong></span></div>

<div id="wb_Text2" style="position:absolute;left:208px;top:96px;width:600px;height:18px;z-index:2;">
<span id="uname" style="color:#CCCCCC;font-family:verdana;font-size:16px;"><strong>User : <%=realname%></strong></span></div>

<div id="wb_Text9" style="position:absolute;left:136px;top:602px;width:762px;height:13px;text-align:center;z-index:3;">
<span style="color:#888888;font-family:verdana;font-size:11px;">Copyright © 2013 Swarvanu Sengupta (Santxr)</span></div>
<button id="AdvancedButton1" type="button" name="" value="" onclick="logOut()" style="position:absolute;left:768px;top:95px;width:76px;height:23px;z-index:5;"><div style="text-align:center"><span style="color:#000000;font-family:Arial;font-size:13px"><b>Logout</b></span></div></button>
<div id="NavigationBar1" style="position:absolute;left:238px;top:147px;width:584px;height:30px;z-index:6;">

<ul class="navbar">
<li><a href="#" onClick="navigator('CMD.jsp')"><img alt="" src="images/home/img0002_over.gif" class="hover"><span><img alt="" src="images/home/img0002.gif"></span></a>  </li>
<li><a href="#" onClick="navigator('Process.jsp')"><img alt="" src="images/home/img0003_over.gif" class="hover"><span><img alt="" src="images/home/img0003.gif"></span></a>  </li>
<li><a href="#" onClick="navigator('Options.jsp')"><img alt="" src="images/home/img0004_over.gif" class="hover"><span><img alt="" src="images/home/img0004.gif"></span></a>  </li>
<li><a href="#" onClick="navigator('Help.jsp')"><img alt="" src="images/home/img0005_over.gif" class="hover"><span><img alt="" src="images/home/img0005.gif"></span></a>  </li>
</ul>

</div>

<div id="wb_Shape2" style="position:absolute;left:214px;top:194px;width:622px;height:343px;background-image:url('images/home/img0006.gif');">

<jsp:include page="<%=pageload%>"></jsp:include>

</div>
</div>


<form action="home.jsp"  id="pagef">
<input type="hidden" id="uname" name="uname" value="<%=puname%>"></input>
<input type="hidden" id="user" name="user" value="<%=realname%>"></input>
<input type="hidden" id="page" name="page" value=""></input>
</form>

<form name="logoutform" method="post" action="LogoutController" id="logoutform">
<input type="hidden" name="user" id="username" value="">
</form>
</body>
</html>