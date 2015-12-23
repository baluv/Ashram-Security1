<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@include file="include.jsp"%>
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
<link href="../view/media/dataTables/demo_table_jui.css" rel="stylesheet" type="text/css" /> 
        <link href="../view/media/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
        <link href="../view/media/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
        <script src="../view/scripts/jquery.js" type="text/javascript"></script>
        <script src="../view/scripts/jquery.dataTables.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        $(document).ready(function () {
            $("#employee").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
        </script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";
</style>

</head>
<body>
<br/>
<!--<c:url var="getReport" value="/security/getSalarydetails.html"></c:url>
<form:form action="${getReport}"  >

  <table align="center" width="30%" border="0">

<tr></tr>
<tr><th colspan="2">To Get Salary Details</th></tr>
<tr></tr>
<tr>
<td>Employee Id</td><td><input type="text" name="emp_id"/></td></tr>


<tr><td></td><td><input type="submit" value="getSalaryForm"/></td></tr>
</table>-->

<div align="right"><a href="gtInhouseReport.html" target="_blank" ><input type="submit" value="getPdfReport" style="height:25px; width:100px"/></a><div>
<div id="container1">
	<div id="page1">
    <div id="dt_example">
        <div id="container">
            <div id="demo_jui">
		        <table id="employee" class="display">
		           <thead>
		                <tr>
		                <th align="left">S.No</th>
		                 <th align="left">Name</th>
		                   
		                    <th align="left">Designation</th>
		                    <th align="left">No.of Days</th>
		                    <th align="left">Basic+DA</th>
		                     <th align="left">Gross</th>
		                    <th align="left">PF</th>
		                     <th align="left">ESI</th>
		                      <th align="left">UniForm</th>
		                       <th align="left">Advance</th>
		                        <th align="left">Total Deduction</th>
		                         <th align="left">Net Pay</th>
		                          <th align="left">Signature</th>
		                          
		                  
		               </tr>
		            </thead>
		            <tbody>
		          		<c:forEach items="${list}" var="item">
						  <tr style="cursor:pointer" onmouseover="this.background='#C0C0C0'" >
			                 <td><c:out value="${item.empid}"></c:out></td>
						    <td><c:out value="${item.empname}"></c:out></td>
						    <td><c:out value="${item.emp_designation}"></c:out></td>
						    <td><c:out value="${item.working_days}"></c:out></td>
						    <td><c:out value="${item.basic_salary}"></c:out></td>
						    <td><c:out value="${item.gross_salary}"></c:out></td>
						     <td><c:out value="${item.pf}"></c:out></td>
						      <td><c:out value="${item.esi}"></c:out></td>
						       <td><c:out value="${item.uniform}"></c:out></td>
						        <td><c:out value="${item.advance}"></c:out></td>
						         <td><c:out value="${item.total_deduction}"></c:out></td>
						         <td><c:out value="${item.net_pay}"></c:out></td>
						         <td><c:out value="${item.entered_by}"></c:out></td>
						
						    
						     
						 </tr>
						  </c:forEach>
		            </tbody>
		        </table>
		    </div>
        </div>
        </div>
       </div>
       </div>
        



</form:form>





</body>
</html>