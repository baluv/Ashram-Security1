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
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 
	if( document.founditemform.place_of_found.value == "" )
	   {
	     alert( "Please Enter Place of Found" );
	     document.founditemform.place_of_found.focus() ;
	     return false;
	   }
	
   if( document.founditemform.details_found_items.value == "" )
   {
     alert( "Please provide Details Of Found Items!" );
     document.founditemform.details_found_items.focus() ;
     return false;
   }
   
      
   if( document.founditemform.name_whofounditem.value == "" )
   {
     alert( "Please provide Name of Founded Person!" );
     document.founditemform.name_whofounditem.focus() ;
     return false;
   }
   
   if( document.founditemform.contact_no.value == "" )
   {
     alert( "Please Enter Contact Number!" );
     document.founditemform.contact_no.focus() ;
     return false;
   }
   
   return( true );
}
//-->
</script>

 
</head>
<body>
<c:url var="savefounditems" value="/security/savefoundItems.html"></c:url>
<form:form action="${savefounditems}" method="post" commandName="founditemsform" name="founditemform" onsubmit="return(validate());">
<br/><br/><br/>
<table width="50%" align="center">
<tr><td><fieldset>

		<legend align="center"><font size="4"><b>Enter Found Item Details</b></font></legend>
<table align="center">

<tr>
<td><font size="3"><b>Date&Time Of Found</b></font></td>
<td><input type="text" name="date_time_offound" id="text" class="textbox"/></td>
</tr>
<tr>
<td><font size="3"><b>place of Found</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="place_of_found" class="textbox"/></td>
</tr>
<tr>
<td><font size="3"><b>Details Of FoundItems</b></font><font color="red"><sup>*</sup></font></td>
<td><form:textarea path="details_found_items" class="textbox1"/></td>
</tr>
<tr>
<td><font size="3"><b>Approximate Value</b></font></td>
<td><form:input path="approx_value" class="textbox"/></td>
</tr>
<tr>
<td><font size="3"><b>Name Of Founded Person</b></font><font color="red"><sup>*</sup></font></td>
<td><form:input path="name_whofounditem" class="textbox"/></td>
</tr>
<tr>
<td><font size="3"><b>Contact No</b></font><font color="red"><sup>*</sup></font></td>
<td><form:input type='tel' pattern="[0-9]{5,15}"  path="contact_no" class="textbox"/></td>
</tr>
<tr>
<td><font size="3"><b>Signature Of Founded Person</b></font></td>
<td><form:input path="signature_offound_person" class="textbox"/></td>
</tr>
<tr>
<td><font size="3"><b>Receipt No</b></font></td>
<td><form:input path="receipt_no" class="textbox"/></td>
</tr>
<tr>
<td><font size="3"><b>Items Received By</b></font></td>
<td><form:input path="items_received_by" class="textbox"/></td>
</tr>
<tr>
<td><font size="3"><b>Action Taken</b></font></td>
<td><form:textarea path="action_taken" class="textbox1"/></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="save" style="height:25px;"/></td>
</tr>
<tr>
<th class="font">${msg}</th>
</tr>
</table>
</form:form>
</body>
</html>