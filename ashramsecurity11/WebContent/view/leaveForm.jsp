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
<title>Leave Application</title>

<script language="javascript" type="text/javascript">  
 
 </script>
 
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
   
    </script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";

.font {
 color: red;
}
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
     $(document).ready(function()
     {
     $("[id^=text2]").datepick();
    });
     $(document).ready(function()
     {
     $("[id^=text3]").datepick();
    });
    </script>
    
    <script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
   
 if( document.LeaveForm.empid.value == "" )
 {
   alert( "Please provide your Employee Id!" );
   document.LeaveForm.empid.focus() ;
   return false;
 }
 
 if( document.LeaveForm.dept.value == "" )
 {
   alert( "Please provide your Department!" );
   document.LeaveForm.dept.focus() ;
   return false;
 }
 
 if( document.LeaveForm.fromdate.value == "" )
 {
   alert( "Please provide Leave Applied From!" );
   document.LeaveForm.fromdate.focus() ;
   return false;
 }
 
 if( document.LeaveForm.todate.value == "" )
 {
   alert( "Please provide Leave Applied To!" );
   document.LeaveForm.todate.focus() ;
   return false;
 }
 
 if( document.LeaveForm.leavetype.value == "none" )
 {
   alert( "Please provide Type of Leave!" );
   document.LeaveForm.leavetype.focus() ;
   return false;
 }
 
 
   
   return( true );
}
   </script>
    
<link href="../security/main.css" rel="stylesheet" type="text/css">

 
</head>
<body>
<c:url var="saveLeave" value="/security/saveLeave.html"></c:url>
<form:form action="${saveLeave}" method="post"  
 commandName="LeaveForm" 
 onsubmit="return(validate());" name="LeaveForm">

<br/><br/>
 <table width="50%" align="center">
<tr><td><fieldset>

		<legend align="center"><font size="4"><b>Leave Application</b></font></legend>
<table align="center">
 <tr>
 <td><font size="3"><b>EmployeeID</b></font><font color="red"><sup>*</sup></font></td>
 <td><form:input path="empid" id="empid" onkeyup="showState(this.value)" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>EmployeeName</b></font></td>
 <td><div id="country" style="color: blue"></div> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>Department</b></font><font color="red"><sup>*</sup></font></td>
 <td><form:input path="dept" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>Position</b></font></td>
 <td><form:input path="position" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>LeaveAppliedFrom</b></font><font color="red"><sup>*</sup></font></td>
 <td><form:input path="fromdate" id="text" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>LeaveAppliedTo</b></font><font color="red"><sup>*</sup></font></td>
 <td><form:input path="todate" id="text1" class="textbox"/> </td>
 </tr>
 
 <td><font size="3"><b>Type of Leave</b></font><font color="red"><sup>*</sup></font></td>
 <td><form:select path="leavetype" class="selectbox">
    <form:option value="none">--Select--</form:option>
    <form:option value="Casual-Leave">Casual-Leave</form:option>
    <form:option value="Sick-Leave">Sick-Leave</form:option>
    <form:option value="Course-Leave">Course-Leave</form:option>
   
   </form:select></td>
   
  
 <tr>
 <td><font size="3"><b>Reason</b></font></td>
 <td><form:input path="reason" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>Contact Address During The Leave</b></font></td>
 <td><form:textarea path="address_duringleave" class="textbox1"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>Contact Number During The Leave</b></font><font color="red"><sup>*</sup></font></td>
 <td><form:input type='tel' pattern="[0-9]{5,15}" path="number_duringleave" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>LastLeaveTakenFrom</b></font></td>
 <td><form:input path="last_fromdate" id="text2" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>LastLeaveTakenTo</b></font></td>
 <td><form:input path="last_todate" id="text3" class="textbox"/> </td>
 </tr>
 
 <tr>
   <td><font size="3"><b>Was Ticket Given by Ashram</b></font></td>
   <td><input type="radio" name=ticket"
    value="Yes">Yes<input type="radio" name="ticket"
    value="No" />No</td>
  </tr>
 
 <tr>
 <td><font size="3"><b>Approved by Dept Head</b></font></td>
 <td><form:input path="dept_head" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>Reason for Refusal</b></font></td>
 <td><form:input path="reason_refusal" class="textbox"/> </td>
 </tr>
 
 <tr>
 <td><font size="3"><b>Ashram Human Resources</b></font></td>
 <td><form:input path="resources" class="textbox"/></td></tr>
 
 <tr>
 <td></td>
   <td><input type="submit"
    value="submit" style="height:25px;"/></td>
  </tr>
  
  <tr>
   <th class="font">${msg}</th>
  </tr>
  
    </table>          
      
         
           
  </fieldset></td></tr></table>
        
</form:form>
</body>
</html>