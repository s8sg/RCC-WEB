<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="generator" content="WYSIWYG Web Builder 8 - http://www.wysiwygwebbuilder.com">
<style type="text/css">
</style>
<style type="text/css">
p, span, div, ol, ul, li, td, button, input, textarea, form
{
   margin: 0;
   padding: 0;
}
a
{
   color: #C8D7EB;
   outline: none;
   text-decoration: underline;
}
a:visited
{
   color: #C8D7EB;
   
}
a:active
{
   color: #C8D7EB;
}
a:hover
{
   color: #376BAD;
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
   text-align: left;
}
#Button1
{
   color: #000000;
   font-family: Arial;
   font-size: 13px;
}
#Button2
{
   color: #000000;
   font-family: Arial;
   font-size: 13px;
}
#Button3
{
   color: #000000;
   font-family: Arial;
   font-size: 13px;
}
#Editbox1
{
   border: 1px #C0C0C0 solid;
   background-color: #FFFFFF;
   color :#000000;
   font-family: Arial;
   font-size: 13px;
   text-align: left;
   vertical-align: middle;
}
#Combobox1
{
   border: 1px #C0C0C0 solid;
   background-color: #FFFFFF;
   color: #000000;
   font-family: Arial;
   font-size: 13px;
}
</style>

<script>
var currentComp="comp1";
var userStatus = 0;
var queryTimer;
var uname;
<%
String uname = request.getParameter("user");
%>
uname = "<%=uname%>";
function sendQuery()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	{
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    	var response =  xmlhttp.responseText;
	    	if(userStatus == 0)
	    		{
	    			document.getElementById("screen").innerHTML = "<select id=\"selectProcess\" multiple=\"multiple\" size=\"15\" style=\"width: 586px; left:2px;\">" +response + "</select>";	
	    		}
	    	
	    }
	};
	xmlhttp.open("POST","http://117.194.83.233:8084/RCC/CheckHandler",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("&comp="+ currentComp +"&type=" + "query" + "&ans=" + "" + "&uname=" + uname);
}

function sendAddQuery()
{
	var Tbox = document.getElementById("Editbox1");
	var newpname = Tbox.value;
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	
	xmlhttp.onreadystatechange=function()
	{
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    	var response =  xmlhttp.responseText;
	    	if(response != "no")
	    	alert("Proceess [" + response + "] add request Successfully Send..."); 	
	    	else
	    	alert("Process killing failed. Try again...");
	    	queryTimer = setInterval("load()",7000);
	    }
	};
	xmlhttp.open("POST","http://117.194.83.233:8084/RCC/CheckHandler",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("&comp="+ currentComp +"&type=" + "newp" + "&ans=" + newpname + "&uname=" + uname);
	clearInterval(queryTimer);
}

function load()
{
	if(currentComp == "")
	{
		alert("No comp is selected");
	}
	else
	{
		sendQuery();
	}
}

function compSelect()
{
	var comp = document.getElementById("Combobox1").selectedIndex;
	alert(uname);
	if(comp == 0)
	{
		currentComp = 'Comp1';
	}
	else if(comp == 1)
	{
		currentComp = 'Comp2';
	}
	else
	{
		currentComp = 'Comp3';
	}
	sendQuery();
	queryTimer = setInterval("load()",7000);
}

function killProcess()
{
	var pbox = document.getElementById("selectProcess");
	var listlength = pbox.options.length;
	var processname = "";
	for(var i=0;i<listlength;i++)
	{
		if(pbox.options[i].selected)
			processname = processname + pbox.options[i].value + " ";
	}
	
	
	var xmlhttp;
	if (window.XMLHttpRequest)
	  {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	  }
	else
	  {// code for IE6, IE5
	  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	  }
	xmlhttp.onreadystatechange=function()
	{
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    	var response =  xmlhttp.responseText;
	    	if(response != "no")
	    	alert("Proceess [" + response + "] Kill request Successfully Send..."); 	
	    	else
	    	alert("Process killing failed. Try again...");
	    	queryTimer = setInterval("load()",7000);
	    }
	};
	xmlhttp.open("POST","http://117.194.83.233:8084/RCC/CheckHandler",true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("&comp="+ currentComp +"&type=" + "ans" + "&ans=" + processname+ "&uname=" + uname);
	clearInterval(queryTimer);
}

</script>

</head>
<body>
<body>
<div id="wb_Text1" style="position:absolute;left:17px;top:10px;width:87px;height:19px;z-index:2;">
<span style="color:#000000;font-family:Arial;font-size:16px;"><strong>Computer :</strong></span></div>
<input type="button" id="Button1" name="" value="Refresh"  onClick="sendQuery()" style="position:absolute;left:500px;top:9px;width:96px;height:25px;z-index:3;">
<input type="button" id="Button2" name="" value="Add Process" onClick="sendAddQuery()" style="position:absolute;left:245px;top:309px;width:96px;height:25px;z-index:4;">
<input type="button" id="Button3" name="" onClick="killProcess()" value="Kill Selected Process" style="position:absolute;left:455px;top:305px;width:149px;height:25px;z-index:5;">
<input type="text" id="Editbox1" style="position:absolute;left:15px;top:309px;width:223px;height:23px;line-height:22px;z-index:6;" name="Editbox1" value="">
<select name="Combobox1" id="Combobox1" onchange="compSelect()" style="position:absolute;left:107px;top:9px;width:175px;height:22px;z-index:7;">
<option selected value="1">Comp1(santu-pc)</option>
<option selected value="2">Comp2(santusg-pc)</option>
</select>

<div id="screen" style="position:absolute;left:14px;top:37px;width:587px;height:260px;z-index:8;padding:2;border: 2px solid #000;">
</div>

</body>
</html>