<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String username = (String)session.getAttribute("username");


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
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="../security/jquery-1.6.2.js"></script>



<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";
</style>

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

<script>
$(function() {
var availableRooms = ${list};	
$( "#inhouse_empname" ).autocomplete({
source: availableRooms
});
});
</script>

<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
   
 if( document.getInhouseSecurityReport.emp_id.value == "" )
 {
   alert( "Please Select Employee Id!" );
   document.getInhouseSecurityReport.emp_id.focus() ;
   return false;
 }
 
 
   if( document.getInhouseSecurityReport.fromDate.value == "" )
   {
     alert( "Please provide From Date!" );
     document.getInhouseSecurityReport.fromDate.focus() ;
     return false;
   }
   
   if( document.getInhouseSecurityReport.toDate.value == "" )
   {
     alert( "Please provide To Date!" );
     document.getInhouseSecurityReport.toDate.focus() ;
     return false;
   }
   
  
  
   return( true );
}
   </script>

</head>
<body>
<br/><br/><br/><br/><br/><br/>
<c:url var="getReport" value="/security/getInhouseSecurityReport.html"></c:url>
<form:form action="${getReport}"  commandName="inhouseform" 
onsubmit="return(validate());" name="getInhouseSecurityReport">
<table width="50%" align="center">
<tr><td><fieldset>

		<legend align="center"><font size="4"><b>To Get InhouseSecurity Report</b></font></legend>
<table align="center">
<tr>
<td><font size="3"><b>Employee Id</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="emp_id" class="textbox"/></td></tr>

<tr><td><font size="3"><b>From Date</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="fromDate" id="text" class="textbox"/></td></tr>

<tr><td><font size="3"><b>To Date</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="toDate" id="text1" class="textbox"/></td></tr>

<tr><td></td>
<td><input type="submit" value="getReport" style="height:25px;"/></td></tr>

</table></fieldset></td></tr></table>
</form:form>

</body>
</html>