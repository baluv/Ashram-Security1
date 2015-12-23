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
<title>Two-Wheeler Page</title>

<script language="javascript" type="text/javascript">  

 </script>
 
<script src="../security/jquery-1.6.2.js"></script>

<script type="text/javascript">
/*function GetSelectedItem()
{
    var e = document.getElementById("vehicletype");
    var strSel = "The Value is: " + e.options[e.selectedIndex].value + " and text is: " + e.options[e.selectedIndex].text;
    alert(strSel);
}*/

function myFunction()
{
 var e = document.getElementById("vehicletype"); 
var y=document.getElementById("fromsno").value;
var x=document.getElementById("tosno").value;
document.getElementById("quantity").value = (x-y);
var strSel =  e.options[e.selectedIndex].value;

if(strSel=="Two-Wheeler")
 {
 document.getElementById("amount").value = (x-y)*10;
 }
 if(strSel == "Four-Wheeler")
 {
 document.getElementById("amount").value = (x-y)*20;
 }
 if(strSel == "Six-Wheeler")
{
document.getElementById("amount").value = (x-y)*60;
}

}

 </script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";
</style>

<!--<link rel="stylesheet" href="../validations/style.css" type="text/css"
	media="screen" />-->

<script type="text/javascript" src="../validations/validate.js"
	charset="utf-8"></script>

<!-- datepicker -->
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
     $(document).ready(function()
     {
    	$("[id^=text3]").datepick();
    });
    $(document).ready(function()
     {
    	$("[id^=text4]").datepick();
    });
   
</script>
<style type="text/css">
#h1 {
	height: 20px;
}

.font {
	size: 30px;
	color: red;
}
</style>

<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
   
 if( document.Twowheelerform.vehicletype.value == "none" )
 {
   alert( "Please provide Vehicle Type!" );
   document.Twowheelerform.vehicletype.focus() ;
   return false;
 }
 
 
   if( document.Twowheelerform.date.value == "" )
   {
     alert( "Please provide Date!" );
     document.Twowheelerform.date.focus() ;
     return false;
   }
   
   if( document.Twowheelerform.fromsno.value == "" )
   {
     alert( "Please provide Fromsno!" );
     document.Twowheelerform.fromsno.focus() ;
     return false;
   }
   
  
   if( document.Twowheelerform.tosno.value == "" )
   {
     alert( "Please provide Tosno!" );
     document.Twowheelerform.tosno.focus() ;
     return false;
   }
   
   return( true );
}
   </script>

</head>
<body>
<c:url var="saveTwowheeler" value="/security/saveTwowheeler.html"></c:url>
<form:form action="${saveTwowheeler}" method="post"  
 commandName="Twowheelerform" onsubmit="return(validate());" name="Twowheelerform" >

<br/><br/><br/><br/><br/><br/>
 <table width="50%" align="center">
<tr><td><fieldset>

		<legend align="center"><font size="4"><b>Enter Vehicle Details</b></font></legend>
 <table align="center">
 <th><font size="3">Vehicle-Type<font color="red"><sup>*</sup></font></th>
   <td colspan="2"><form:select path="vehicletype" class="selectbox" onchange="GetSelectedItem();">
    <form:option value="none">--Select--</form:option>
    <form:option value="Two-Wheeler">Two-Wheeler</form:option>
    <form:option value="Four-Wheeler">Four-Wheeler</form:option>
    <form:option value="Six-Wheeler">Six-Wheeler</form:option>
   
   </form:select></td>   
 <tr>
 <th><font size="3">Date<font color="red"><sup>*</sup></font></th>
 <td><input type="text" name="date" id="text" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">FromSno</font><font color="red"><sup>*</sup></font></th>
 <td><form:input path="fromsno" class="textbox"/> </td>
 </tr>
 
 <tr>
 <th><font size="3">ToSno</font><font color="red"><sup>*</sup></font></th>
 <td><form:input path="tosno" id="tosno" onchange="myFunction()" class="textbox"/> </td>
 </tr>
 
 <tr>
 <th><font size="3">Quantity</font></th>
 <td><form:input path="quantity" class="textbox"/> </td>
 </tr>
 
 <tr>
 <th><font size="3">Amount</font></th>
 <td><form:input path="amount" class="textbox"/></td>
 </tr>
 <tr>
 <th><font size="3">Machine Type</font></th>
 <td><form:input path="machine" class="textbox"/></td></tr>
 
 <tr>
   <td></td>
   <td><input type="submit" value="submit"  style="height:25px; width:75px"/></td>
  </tr>
  
  <tr>
   <th class="font">${msg}</th>
  </tr>
  
    </table>          
        
</form:form>
</body>
</html>