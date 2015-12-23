<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="dataoperator_home.jsp"%>
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

 
</head>
<body>
<c:url var="saveG4SSecurity" value="/security/savedataoperatorG4SSecurity.html"></c:url>
<form:form action="${saveG4SSecurity}" method="post"  
	commandName="g4ssecurityform" >

	<table align="center">

		<tr>
			<th colspan="2"><u>Security Personal Daily Deployment,Post-Wise
			Attendance Report</u></th>
		</tr>
		<tr>
			<th colspan="2"><u>Ved Vignan Maha Vidya Peeth(G4SSecurity)</u></th>
		</tr>

		<br>
		<br>
		<tr>
			<td>Security Post</td>
			<td colspan="2"><form:select path="g4s_securitypost"
				class="bg_blue">
				<form:option value="none">--select--</form:option>
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
			</form:select></td>
			<td rowspan="10"></td>
		</tr>
		<tr>
		<td>Empid</td>
		<td><input type="text" name="emp_id" id="emp_id"  onkeyup="showState(this.value)"></td>
		<td></td>
		</tr>
		<tr>
		<td>Empname</td>
		<td><div id="country" style="color: blue"></div></td>
		</tr>
		
		<tr>
			<td>Shift</td>
			<td colspan="5"><form:select path="g4s_shift">
				<form:option value="none">--select--</form:option>
				<form:option value="Day Shift">Day Shift</form:option>
				<form:option value="Night Shift">Night Shift</form:option>
			</form:select></td>
			<td rowspan="10"></td>
		</tr>
		<tr>
			<td>Rank</td>

			<td colspan="3"><form:select path="g4s_rank" class="bg_blue">
				<form:option value="none">--select--</form:option>
				<form:option value="P/O">P/O</form:option>
				<form:option value="S/S">S/S</form:option>
				<form:option value="H/G">H/G</form:option>
				<form:option value="S/G">S/G</form:option>
			</form:select></td>
			<td rowspan="10"></td>
		</tr>
		<tr>
			<td>Date</td>
			<td colspan="4"><form:input id="text" path="g4s_date"
				class="bg_blue" /></td>
			<td rowspan="10"></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="submit"
				value="submit" /></td>
			<td rowspan="10"></td>
		</tr>
		<tr>
			<th colspan="4" class="font">${msg}</th>
		</tr>
	</table>
	<br>
	<br><br>
	
	<hr>
	<br>
	<div  align="center">Employee Shift Details On ${g4s_date}</div>
	<br>
		           
		  <table align="center" border="1">
		  <tr><th width="10%">Rank</th><th width="10%">Day Shift</th><th width="10%">Night Shift</th></tr>
		  <tr><th width="10%">P/O</th><td width="10%" align="center">${podayshiftcount}</td><td width="10%" align="center">${ponightshiftcount}</td></tr>
		  <tr><th width="10%">S/S</th><td width="10%" align="center">${ssdayshiftcount}</td><td width="10%" align="center">${ssnightshiftcount}</td></tr>
		    <tr><th width="10%">H/G</th><td width="10%" align="center">${hgdayshiftcount}</td><td width="10%" align="center">${hgnightshiftcount}</td></tr>
		     <tr><th width="10%">S/G</th><td width="10%" align="center">${sgdayshiftcount}</td><td width="10%" align="center">${sgnightshiftcount}</td></tr>
		  
		  </table>        		
						
						   
						     
		
        
</form:form>
</body>
</html>		
		
		