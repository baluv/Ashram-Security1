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
.font
{
color:red;
}
</style>

<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
   
 if( document.inhousesecurityform.emp_id.value == "" )
 {
   alert( "Please provide your Employee Id!" );
   document.inhousesecurityform.emp_id.focus() ;
   return false;
 }
 
 
   if( document.inhousesecurityform.inhouse_securitypost.value == "none" )
   {
     alert( "Please provide Security Post!" );
     document.inhousesecurityform.inhouse_securitypost.focus() ;
     return false;
   }
   
   if( document.inhousesecurityform.inhouse_shift.value == "none" )
   {
     alert( "Please provide Security Shift!" );
     document.inhousesecurityform.inhouse_shift.focus() ;
     return false;
   }
   
  
   if( document.inhousesecurityform.inhouse_rank.value == "none" )
   {
     alert( "Please provide Rank!" );
     document.inhousesecurityform.inhouse_rank.focus() ;
     return false;
   }
   if( document.inhousesecurityform.inhouse_date.value == "" )
   {
     alert( "Please provide Date!" );
     document.inhousesecurityform.inhouse_date.focus() ;
     return false;
   }
   return( true );
}
   </script>

<link rel="stylesheet" href="../validations/style.css" type="text/css"
	media="screen" />

</head>
<body>
<c:url var="saveInhouseSecurity" value="/security/saveInhouseSecurity.html"></c:url>
<form:form action="${saveInhouseSecurity}" commandName="inhousesecurityform" 
onsubmit="return(validate());" name="inhousesecurityform">
<table align="center">
<br/>
<table width="75%" align="center">
<tr><td><fieldset>

			<legend align="center"><font size="4"><b>Ved Vignan Maha Vidya Peeth(Inhouse Security)Attendence</b></font></legend>
<br/>
<table align="center">
<tr><td><font size="3"><b>Security Post</b></font><font color="red"><sup>*</sup></font></td>
<td><form:select path="inhouse_securitypost" class="selectbox">
<form:option value="none">--Select--</form:option>
<form:option value="ANNAPOORNA GENTS">ANNAPOORNA GENTS</form:option>
<form:option value="ANNAPOORNA LADIES">ANNAPOORNA LADIES</form:option>
<form:option value="APARNA GATE:1">APARNA GATE:1</form:option>
<form:option value="APARNA GATE:2">APARNA GATE:2</form:option>
<form:option value="APARNA LOCKER">APARNA LOCKER</form:option>
<form:option value="BASAVA GATE">BASAVA GATE</form:option>
<form:option value="CHECKPOST">CHECKPOST</form:option>
<form:option value="DINING HALL-1">DINING HALL-1</form:option>
<form:option value="DINING HALL-2">DINING HALL-2</form:option>
<form:option value="GANGA BACK">GANGA BACK</form:option>
<form:option value="GANGA-1">GANGA-1</form:option>
<form:option value="GANGA-2">GANGA-2</form:option>
<form:option value="GURUKUL GATE">GURUKUL GATE</form:option>
<form:option value="LAUNDRY">LAUNDRY</form:option>
<form:option value="LAXMI GARDEN">LAXMI GARDEN</form:option>
<form:option value="M.VENI:1">M.VENI:1</form:option>
<form:option value="M.VENI:2">M.VENI:2</form:option>
<form:option value="MAITREYI HALL">MAITREYI HALL</form:option>
<form:option value="NARMADA">NARMADA</form:option>
<form:option value="NEW APARNA">NEW APARNA</form:option>
<form:option value="NEW RECEPTION">NEW RECEPTION</form:option>
<form:option value="OLD CHATRAVAS LADIES">OLD CHATRAVAS LADIES</form:option>
<form:option value="OLD KITCHEN">OLD KITCHEN</form:option>
<form:option value="PANCHAKARMA-1">PANCHAKARMA-1</form:option>
<form:option value="PANCHAKARMA-2">PANCHAKARMA-2</form:option>
<form:option value="PATROLLING-1">PATROLLING-1</form:option>
<form:option value="PATROLLING-2">PATROLLING-2</form:option>
<form:option value="PATROLLING-3">PATROLLING-3</form:option>
<form:option value="PATROLLING-4">PATROLLING-4</form:option>
<form:option value="PATROLLING-5">PATROLLING-5</form:option>
<form:option value="PUBLICATION">PUBLICATION</form:option>
<form:option value="R.K-2">R.K-2</form:option>
<form:option value="RAVI KUTIR">RAVI KUTIR</form:option>
<form:option value="SETU TOP">SETU TOP</form:option>
<form:option value="SEVAK KUTIR">SEVAK KUTIR</form:option>
<form:option value="SHAKTI KUTIR">SHAKTI KUTIR</form:option>
<form:option value="TRIPURA-2">TRIPURA-2</form:option>
<form:option value="TURNING POINT">TURNING POINT</form:option>
<form:option value="V.MANTAP">V.MANTAP</form:option>
<form:option value="VISHALA LOCKER">VISHALA LOCKER</form:option>
<form:option value="W.OFF-1">W.OFF-1</form:option>
<form:option value="W.OFF-2">W.OFF-2</form:option>
<form:option value="W.OFF-3">W.OFF-3</form:option>
<form:option value="W.OFF-4">W.OFF-4</form:option>
<form:option value="W.OFF-5">W.OFF-5</form:option>
<form:option value="Y.SHALA C&D">Y.SHALA C&D</form:option>
<form:option value="YAMUNA TANK">YAMUNA TANK</form:option>
</form:select></td>
</tr>
<tr>
		<td><font size="3"><b>Empid</b><font color="red"><sup>*</sup></font></td>
		<td><input type="text" name="emp_id" id="emp_id" class="selectbox" onkeyup="showState(this.value)"></td>
		
		</tr>
		<tr>
		<td><font size="3"><b>Empname</b></font></td>
		<td><div id="country" style="color: blue"></div></td>
		</tr>

<tr><td><font size="3"><b>Shift</b></font><font color="red"><sup>*</sup></font></td>
<td><form:select path="inhouse_shift" class="selectbox">
<form:option value="none">--Select--</form:option>
<form:option value="DayShift">Day Shift</form:option>
<form:option value="NightShift">Night Shift</form:option>
</form:select></td></tr>
<tr><td><font size="3"><b>Rank</b></font><font color="red"><sup>*</sup></font></td>

<td><form:select path="inhouse_rank" class="selectbox">
<form:option value="none">--Select--</form:option>
<form:option value="P/O">P/O</form:option>
<form:option value="S/S">S/S</form:option>
<form:option value="H/G">H/G</form:option>
<form:option value="S/G">S/G</form:option>
</form:select></td></tr>
<tr>
<td><font size="3"><b>Date</b></font><font color="red"><sup>*</sup></font></td>
<td><form:input id="text" path="inhouse_date" class="selectbox"/></td>
</tr>
<tr><td></td><td><input type="submit" value="submit" style="height:25px;" /></td></tr>
<tr><th class="font">${msg}</th></tr>
</table></fieldset></td></tr></table>


<br/><br/>
<table width="75%" align="center"><tr><td>
	<fieldset>
	<legend align="center"><div><b>Employee Shift Details On ${inhouse_date}</b></div></legend>
	<br>
 <table align="center" border="1">
		  <tr><th width="10%">Rank</th><th width="10%">Day Shift</th><th width="10%">Night Shift</th></tr>
		  <tr><td width="10%" align="center"><b>JCO</b></td><td width="10%" align="center">${podayshiftcount}</td><td width="10%"  align="center">${ponightshiftcount}</td></tr>
		  <tr><td width="10%" align="center"><b>Security Supervisor</b></td><td width="10%" align="center">${ssdayshiftcount}</td><td width="10%"  align="center">${ssnightshiftcount}</td></tr>
		    <tr><td width="10%" align="center"><b>Security Head</b></td><td width="10%"  align="center">${hgdayshiftcount}</td><td width="10%" align="center">${hgnightshiftcount}</td></tr>
		     <tr><td width="10%" align="center"><b>Security Guard</b></td><td width="10%"  align="center">${sgdayshiftcount}</td><td width="10%"  align="center">${sgnightshiftcount}</td></tr>
		  
		  </table>  
		  </fieldset></td></tr></table>  
</table></form:form>
</body>
</html>