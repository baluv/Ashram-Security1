<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String username = (String)session.getAttribute("username");
System.out.println("username in jsp:"+username);

if (username.equals("admin"))
{
%>
<%@ include file = "include.jsp" %>
<%
}
else
{
%>
<%@ include file = "include1.jsp" %>
<%
}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>




<script language="javascript" type="text/javascript">  
 var xmlHttp  
 var xmlHttp
 function showState(str){ 
if (typeof XMLHttpRequest != "undefined"){
   xmlHttp= new XMLHttpRequest();
       }
       else if (window.ActiveXObject){
   xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
       }
if (xmlHttp==null){
    alert ("Browser does not support XMLHTTP Request")
return
} 

var url="../view/getempname.jsp";
url += "?count=" +str;
xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
 function stateChange(){   
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
 document.getElementById("country").innerHTML=xmlHttp.responseText;  
 }   
 }
 </script>
<script src="../security/jquery-1.6.2.js"></script>

<script type="text/javascript">
    var index=1;
    var flag=5;//because i have only 5 rows initially,so the counter for 6th onwards
    $(document).ready(function()
     {
    	$("[id^=text]").datepick();
    });
    </script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";

.font {
	color: red;
}
</style>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
   
 if( document.g4ssecurityform.emp_id.value == "" )
 {
   alert( "Please provide your Employee Id!" );
   document.g4ssecurityform.emp_id.focus() ;
   return false;
 }
 
 
   if( document.g4ssecurityform.g4s_securitypost.value == "none" )
   {
     alert( "Please provide Security Post!" );
     document.g4ssecurityform.g4s_securitypost.focus() ;
     return false;
   }
   
   if( document.g4ssecurityform.g4s_shift.value == "none" )
   {
     alert( "Please provide Security Shift!" );
     document.g4ssecurityform.g4s_shift.focus() ;
     return false;
   }
   
  
   if( document.g4ssecurityform.g4s_rank.value == "none" )
   {
     alert( "Please provide Rank!" );
     document.g4ssecurityform.g4s_rank.focus() ;
     return false;
   }
   if( document.g4ssecurityform.g4s_date.value == "" )
   {
     alert( "Please provide Date!" );
     document.g4ssecurityform.g4s_date.focus() ;
     return false;
   }
   return( true );
}
   </script>

<link href="../security/main.css" rel="stylesheet" type="text/css">
<link href="../design/menu.css" rel="stylesheet" type="text/css">

 
</head>
<body>
<c:url var="saveG4SSecurity" value="/security/saveG4SSecurity.html"></c:url>
<form:form action="${saveG4SSecurity}" method="post"  
	commandName="g4ssecurityform"
	onsubmit="return(validate());" name="g4ssecurityform" >
<br/>
<table width="75%" align="center">
<tr><td><fieldset>

			<legend align="center"><font size="4"><b>Security Personal Daily Deployment,Post-Wise
			Attendance Report</b></font></legend>
	<table align="center">
		<br/>
		<tr>
			<th colspan="2">Ved Vignan Maha Vidya Peeth(AgencySecurity)</th>
		</tr>		
		<tr>
		<td><font size="3"><b>Empid</b></font><font color="red"><sup>*</sup></font></td>
		<td><input type="text" name="emp_id" class="textbox" id="emp_id" onkeyup="showState(this.value)"></td>
		</tr>
		<tr>
		<td><font size="3"><b>Empname</b></font></td>
		<td><div id="country" style="color: blue"></div></td>
		</tr>
		<tr>
			<td><font size="3"><b>Security Post</b></font><font color="red"><sup>*</sup></font></td>
			<td><form:select name="g4s_securitypost" path="g4s_securitypost"
				class="selectbox">
				<form:option value="none">--Select--</form:option>
				<form:option value="GATE-1">GATE-1</form:option>
				<form:option value="GATE-2">GATE-2</form:option>
				<form:option value="GATE-3">GATE-3</form:option>
				<form:option value="GATE-4">GATE-4</form:option>
				<form:option value="GATE-5">GATE-5</form:option>
				<form:option value="GATE-5,Second S/G">GATE-5,Second S/G</form:option>
				<form:option value="RADHAKUNJ GATE-1">RADHAKUNJ GATE-1</form:option>
				<form:option value="PATROLLING">PATROLLING</form:option>
				<form:option value="PARKING-Gate-5 C.Post">PARKING-Gate-5 C.Post</form:option>
				<form:option value="Parking(Sat&Sunday)">Parking(Sat&Sunday)</form:option>
				<form:option value="School road(7.30 to 7.30hrs)">School road(7.30 to 7.30hrs)</form:option>
				<form:option value="NARMADHA HELIPAD">NARMADHA HELIPAD</form:option>
				<form:option value="NEW VISHALA">NEW VISHALA</form:option>
				<form:option value="CC TV">CC TV</form:option>
				<form:option value="Lost&Found">Lost&Found</form:option>
				<form:option value="Visiolence">Visiolence</form:option>
				<form:option value="Round">Round</form:option>
			</form:select></td>
		</tr>
		<tr>
			<td><font size="3"><b>Shift</b></font><font color="red"><sup>*</sup></font></td>
			<td><form:select path="g4s_shift" class="selectbox">
				<form:option value="none">--Select--</form:option>
				<form:option value="Day Shift">Day Shift</form:option>
				<form:option value="Night Shift">Night Shift</form:option>
			</form:select></td>
		</tr>
		<tr>
			<td><font size="3"><b>Rank</b></font><font color="red"><sup>*</sup></font></td>

			<td><form:select path="g4s_rank" class="selectbox">
				<form:option value="none">--Select--</form:option>
				<form:option value="P/O">Patroling Officer</form:option>
				<form:option value="S/S">Security Supervisor</form:option>
				<form:option value="H/G">Security Head</form:option>
				<form:option value="S/G">Security Guard</form:option>
			</form:select></td>
		</tr>
		<tr>
			<td><font size="3"><b>Date</b></font><font color="red"><sup>*</sup></font></td>
			<td><form:input id="text" path="g4s_date" class="textbox" /></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit"	value="submit"  style="height:25px;"/></td>
		</tr>
		<tr>
			<th class="font">${msg}</th>
		</tr>
	</table>
	</fieldset></td></tr></table>
	<br/><br/>
	<table width="75%" align="center"><tr><td>
	<fieldset>
	<legend align="center"><div  align="center"><b>Employee Shift Details On ${g4s_date}</b></div></legend>
	<br/>
		           
		  <table align="center" border="1">
		  <tr><th width="10%">Rank</th><th width="10%">Day Shift</th><th width="10%">Night Shift</th></tr>
		  <tr><td width="10%" align="center"><b>Patroling Officer</b></td><td width="10%" align="center">${podayshiftcount}</td><td width="10%" align="center">${ponightshiftcount}</td></tr>
		  <tr><td width="10%" align="center"><b>Security Supervisor</b></td><td width="10%" align="center">${ssdayshiftcount}</td><td width="10%" align="center">${ssnightshiftcount}</td></tr>
		    <tr><td width="10%" align="center"><b>Security Head</b></td><td width="10%" align="center">${hgdayshiftcount}</td><td width="10%" align="center">${hgnightshiftcount}</td></tr>
		     <tr><td width="10%" align="center"><b>Security Guard</b></td><td width="10%" align="center">${sgdayshiftcount}</td><td width="10%" align="center">${sgnightshiftcount}</td></tr>
		  
		  </table>  
		  </fieldset></td></tr></table>			   
						     
		
        
</form:form>
</body>
</html>		
		
		