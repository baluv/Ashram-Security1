<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="../security/jquery-1.6.2.js"></script>

<script type="text/javascript">
    var index=1;
    var flag=5;//because i have only 5 rows initially,so the counter for 6th onwards
    $(document).ready(function()
     {
    	$("[id^=text]").datepick();
    });
     $(document).ready(function()
     {
    	$("[id^=text1]").datepick();
    });
    </script>
   <!-- Auto Complete Extender --> 
   
<script>
$(function() {
var availableRooms = ${list};	
$( "#g4s_empname" ).autocomplete({
source: availableRooms
});
});
</script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";
</style>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
   
 if( document.getSalaryForm.security.value == "none" )
 {
   alert( "Please Select Security Type!" );
   document.getSalaryForm.security.focus() ;
   return false;
 }
 
 
   if( document.getSalaryForm.emp_id.value == "" )
   {
     alert( "Please provide EmpId!" );
     document.getSalaryForm.emp_id.focus() ;
     return false;
   }
   
   if( document.getSalaryForm.date.value == "" )
   {
     alert( "Please provide Month!" );
     document.getSalaryForm.date.focus() ;
     return false;
   }
   
  
  
   return( true );
}
   </script>

</head>
<body>
<br/><br/><br/><br/>
<c:url var="getReport" value="/security/getSalary.html"></c:url>
<form:form action="${getReport}" onsubmit="return(validate());" name="getSalaryForm"  >
<table width="50%" align="center">
<tr><td><fieldset>
<table align="center" width="30%" border="0">

<tr>
			<th align="center" class="font" style="color:red">${msg}</th>
		</tr>

<legend align="center"><font size="4"><b>To Get Salary Form</b></font></legend>
<table align="center">
<tr>
<td><font size="3"><b>Select Security Type</b></font><font color="red"><sup>*</sup></font></td>
<td>
<select name="security" class="selectbox">
<option value="none">--Select--</option>
<option value="g4ssecurity">AgencySecurity</option>
<option value="inhousesecurity">InhouseSecurity</option>
</select>
</td></tr>
<tr>

<td><font size="3"><b>Employee Id</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="emp_id" class="textbox"/></td></tr>
<tr><td><font size="3"><b>Select month</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="date" id="text" class="textbox"/></td></tr>

<tr>
<td></td>
<td><input type="submit" value="getSalaryForm" style="height:25px;"/></td>
</tr>


</table>

</table>
</fieldset></td></tr></table>
</form:form>





</body>
</html>