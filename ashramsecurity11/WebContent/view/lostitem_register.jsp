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
     $(document).ready(function()
     {
    	$("[id^=text2]").datepick();
    });
    </script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";


.font {
	color: red;
}
</style>
<link href="../security/main.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 
   if( document.lostitemform.name_address.value == "" )
   {
     alert( "Please provide your name and address!" );
     document.lostitemform.name_address.focus() ;
     return false;
   }
   if( document.lostitemform.date.value == "" )
   {
     alert( "Please provide Date!" );
     document.lostitemform.date.focus() ;
     return false;
   }
  
   if( document.lostitemform.date_timeoflost.value == "" )
   {
     alert( "Please provide Date Of ItemLost" );
     document.lostitemform.date_timeoflost.focus() ;
     return false;
   }
   if( document.lostitemform.itemslost.value == "" )
   {
     alert( "Please provide lost Items" );
      document.lostitemform.itemslost.focus() ;
     return false;
   }
   
   if( document.lostitemform.contact_no.value == 0 )
   {
     alert( "Please provide contact Number" );
      document.lostitemform.contact_no.focus() ;
     return false;
   }
   
   return( true );
}
//-->
</script>


 
</head>
<body>
<c:url var="saveLostitems" value="/security/saveLostItems.html"></c:url>
<form:form action="${saveLostitems}" method="post" commandName="lostitemsform" 
name="lostitemform" onsubmit="return(validate());">

<table align="center" width="30%" border="0">
<br/><br/><br/>

<table width="50%" align="center">
<tr><td><fieldset>

		<legend align="center"><font size="4"><b>Enter Lost Item Details</b></font></legend>
<table align="center">
<tr>
		<td><font size="3"><b>Name&Address</b></font><font color="red"><sup>*</sup></font></td>
		<td><form:textarea path="name_address" class="textbox1"/></td>
		</tr>
		<tr>
		<td><font size="3"><b>Date</b></font><font color="red"><sup>*</sup></font></td>
		<td><form:input path="date" id="text" class="textbox"/></td>
		</tr>
		
		<tr>
			<td><font size="3"><b>Contact Number</b></font><font color="red"><sup>*</sup></font></td>
			<td><form:input type='tel' pattern="[0-9]{5,15}" path="contact_no" class="textbox"/></td>
			
		</tr>
		<tr>
			<td><font size="3"><b>Date and Time of Lost</b></font><font color="red"><sup>*</sup></font></td>
			<td><form:input path="date_timeoflost" id="text1" class="textbox"/></td>
			
		</tr>
		<tr>
			<td><font size="3"><b>Reporting Date and Time</b></font></td>
			<td><form:input  path="reporting_date_time" id="text2" class="textbox"/></td>
		
		</tr>
		<tr>
			<td><font size="3"><b>Items Lost</b></font><font color="red"><sup>*</sup></font></td>
			<td><form:textarea path="itemslost" class="textbox1"/></td>
		</tr>
		<tr>
			<td><font size="3"><b>Place Of Lost</b></font></td>
			<td><form:input  path="placeoflost" class="textbox"/></td>
		</tr>
		<tr>
			<td><font size="3"><b>Approximate Value</b></font></td>
			<td><form:input  path="approx_value" class="textbox"/></td>
		</tr>
		<tr>
			<td><font size="3"><b>Receipt Number</b></font></td>
			<td><form:input  path="receipt_no" class="textbox"/></td>
		</tr>
		<tr>
			<td><font size="3"><b>Remark/Details of Action taken</b></font></td>
			<td><form:textarea  path="remarks" class="textbox1"/></td>
		</tr>
		<tr><td></td>
			<td><input type="submit"	value="submit" style="height:25px;"/></td>
			
		</tr>
		<tr>
			<th colspan="4" class="font">${msg}</th>
		</tr>
		</table>
		</fieldset></td></tr></table>
</form:form>
</body>

</html>		
		
		