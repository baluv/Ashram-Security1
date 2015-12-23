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
 
   if( document.vehiclereport.vehicletype.value == "none" )
   {
     alert( "Please provide Vehicle Type!" );
     document.vehiclereport.vehicletype.focus() ;
     return false;
   }
   
   if( document.vehiclereport.fromdate.value == "" )
   {
     alert( "Please provide From Date!" );
     document.vehiclereport.fromdate.focus() ;
     return false;
   }
   
   if( document.vehiclereport.todate.value == "" )
   {
     alert( "Please provide To Date!" );
     document.vehiclereport.todate.focus() ;
     return false;
   }
   
   return( true );
}
//-->
</script>


</head>
<body>
<c:url var="getvehicle" value="/security/vehiclereport1.html"></c:url>
<form:form action="${getvehicle}"  commandName="vehiclereport" 
onsubmit="return(validate());" name="vehiclereport">
<br/><br/><br/><br/><br/><br/>

<table width="50%" align="center">
<tr><td><fieldset>

		<legend align="center"><font size="4"><b>To Get Vehicle Report</b></font></legend>
<table align="center">
<tr>
<th><font size="3">Vehicle Type</font><font color="red"><sup>*</sup></font></th>
<td><select name="vehicletype" class="selectbox">
    <option value="none">--Select--</option>
    <option value="All">All</option>
    <option value="Two-Wheeler">Two-Wheeler</option>
    <option value="Four-Wheeler">Four-Wheeler</option>
    <option value="Six-Wheeler">Six-Wheeler</option>
   
   </select></td></tr>

<tr>
<th><font size="3">From Date</font><font color="red"><sup>*</sup></font></th>
<td><input type="text" name="fromdate" id="text" class="textbox"/></td>
</tr>

<tr>
<th><font size="3">To Date</font><font color="red"><sup>*</sup></font></th>
<td><input type="text" name="todate" id="text1" class="textbox"/></td>
</tr>

<tr>
<td></td>
<td><input type="submit" value="getReport" style="height:25px;"/></td>
</tr>
</table>
</form:form>

</body>
</html>