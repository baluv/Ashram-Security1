<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link href="../view/media/dataTables/demo_page.css" rel="stylesheet" type="text/css" />
        <link href="../view/media/dataTables/demo_table.css" rel="stylesheet" type="text/css" />
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
</head>
<body>
<br/>

<c:url var="getReport" value="/security/getInhouseSecurityReportpdf.html"></c:url>
<form:form action="${getReport}" target="_blank">
<input type="hidden" name="emp_id" value="${emp_id}"/>
<input type="hidden" name="fromDate" value="${fromDate}"/>
<input type="hidden" name="toDate" value="${toDate}"/>



  <div align="right"><a href="getInhouseSecurityReportpdf.html" target="_blank"><input type="submit" value="getPdfReport" style="height:25px; width:100px"/></a></div>
<div id="container1">
	<div id="page1">
    <div id="dt_example">
        <div id="container">
            <div id="demo_jui">
            
		        <table id="employee" class="display">
		           <thead>
		                <tr>
		                <th align="left">Sl No</th>
		                <th align="left">Employee Id</th>
		                <th align="left">Security Post</th>
		                <th align="left">Shift</th>
		                <th align="left">Rank</th>
		                <th align="left">Date</th>
		                <th align="left">Employee Name</th>
		                  
		               </tr>
		            </thead>
		            <tbody>
		          		<c:forEach items="${list}" var="item">
						  <tr style="cursor:pointer" onmouseover="this.background='#C0C0C0'" ">
			                
			                <td><c:out value="${item.id}"></c:out></td>
			                <td><c:out value="${item.emp_id}"></c:out></td>
						    <td><c:out value="${item.empname}"></c:out></td>
						    <td><c:out value="${item.inhouse_securitypost}"></c:out></td>
						    <td><c:out value="${item.inhouse_shift}"></c:out></td>
						    <td><c:out value="${item.inhouse_rank}"></c:out></td>
						    <td><c:out value="${item.inhouse_date}"></c:out></td>
						    
						   
						     
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