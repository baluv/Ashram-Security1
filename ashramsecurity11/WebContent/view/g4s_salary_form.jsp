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
<script language="JavaScript">
<!--
function showpay() {
 if ((document.calc.gross_salary.value == null || document.calc.gross_salary.value.length == 0) ||
     (document.calc.pf.value == null || document.calc.pf.value.length == 0)
||
     (document.calc.esi.value == null || document.calc.esi.value.length == 0))
 { document.calc.net_pay.value = "Incomplete data";
 }
 else
 {
 var princ = document.calc.gross_salary.value;
 var term  = document.calc.pf.value;
 var intr   = document.calc.esi.value;
 var uniform = document.calc.uniform.value;

 var advance=document.calc.advance.value;

 document.calc.pfmoney.value = (princ*term)/100;
 document.calc.esimoney.value = (princ*intr)/100;
 document.calc.net_pay.value = "";
 //document.calc.total_deduction.value = (((princ*term)/100)  + ((princ*intr)/100)+(uniform)+(advance));
 //document.calc.net_pay.value = princ - (((princ*term)/100)  + ((princ*intr)/100)+(uniform)+(advance));
 }

// payment = principle * monthly interest/(1 - (1/(1+MonthlyInterest)*Months))

}

// -->
</script>


<script language="JavaScript">

function calculate() 
{
 
 var princ = document.calc.gross_salary.value;
 var pfmoney  =document.calc.pfmoney.value;
 var esimoney= document.calc.esimoney.value ;
 var uniform = document.calc.uniform.value;
 var advance=document.calc.advance.value;

var result = (parseInt(pfmoney) + parseInt(esimoney) + parseInt(uniform) + parseInt(advance));

 document.calc.total_deduction.value = (parseInt(pfmoney) + parseInt(esimoney) + parseInt(uniform) + parseInt(advance));
 document.calc.net_pay.value = princ -(parseInt(pfmoney) + parseInt(esimoney) + parseInt(uniform) + parseInt(advance));
 
 
 }
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
   
 if( document.calc.pf.value == "" )
 {
   alert( "Please provide PF!" );
   document.calc.pf.focus() ;
   return false;
 }
 
 
   if( document.calc.esi.value == "" )
   {
     alert( "Please provide ESI!" );
     document.calc.esi.focus() ;
     return false;
   }
   
   if( document.calc.uniform.value == "" )
   {
     alert( "Please provide Uniform!" );
     document.calc.uniform.focus() ;
     return false;
   }
   
   if( document.calc.advance.value == "" )
   {
     alert( "Please provide Advance!" );
     document.calc.advance.focus() ;
     return false;
   }
   
   if( document.calc.entry_date.value == "" )
   {
     alert( "Please provide Entry Date!" );
     document.calc.entry_date.focus() ;
     return false;
   }
   
  
   if( document.calc.entered_by.value == "" )
   {
     alert( "Please provide Entered By!" );
     document.calc.entered_by.focus() ;
     return false;
   }
   
   return( true );
}
   </script>

</head>
<body>
<br/><br/>
<c:url var="getReport" value="/security/saveSalary.html"></c:url>
<form:form action="${getReport}"  name="calc" onsubmit="return(validate());" >

<table width="50%" align="center">
<tr><td><fieldset>
<input type="hidden" name="security_post" value="${security_post}"/>
<legend align="center"><font size="4"><b>Salary Calculation Form</b></font></legend>
<table align="center">
<tr>
<td><font size="3"><b>Employee Id</b></font></td>
<td><input type="text" name="emp_id" value="${emp_id}" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Salary of Month</b></font></td>
<td><input type="text" name="fromDate" value="${salary}" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Working Days</b></font></td>
<td><input type="text" name="working_days" value="${workingdays}" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Basic Salary</b></font></td>
<td><input type="text" name="basic_salary" value="${Basic_salary}" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Gross Salary </b></font></td>
<td><input type="text" name="gross_salary" value="${Basic_salary}" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>P.F</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="pf" onkeyup='showpay()' class="textbox"/></td>
<td><input type="text" name="pfmoney" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>E.S.I</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="esi" onkeyup='showpay()' class="textbox"/></td>
<td><input type="text" name="esimoney" class="textbox"/></td>
</tr>

<tr><td><font size="3"><b>Uniform</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="uniform" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Advance</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="advance" onkeyup='calculate()' class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Total Deduction</b></font></td>
<td><input type="text" name="total_deduction" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Net Pay</b></font></td>
<td><input type="text" name="net_pay" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Entry Date</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="entry_date" id="text" class="textbox"/></td>
<td></td>
</tr>

<tr><td><font size="3"><b>Entered By</b></font><font color="red"><sup>*</sup></font></td>
<td><input type="text" name="entered_by" class="textbox"/></td>
<td></td>
</tr>


<tr><td><input type="submit" value="calculate" style="height:25px;"/></td>
<td><input type="submit" value="submit" style="height:25px;"/></td>
<td></td>
</tr>
</table></fieldset></td></tr></table>
</form:form>





</body>
</html>