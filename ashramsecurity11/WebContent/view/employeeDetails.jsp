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
       <!-- <link href="../view/media/dataTables/demo_page.css" rel="stylesheet" type="text/css" />-->
       <!--  <link href="../view/media/dataTables/demo_table.css" rel="stylesheet" type="text/css" />-->
   <link href="../view/media/dataTables/demo_table_jui.css" rel="stylesheet" type="text/css" /> 
        <link href="../view/media/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
        <link href="../view/media/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
        <script src="../view/scripts/jquery.js" type="text/javascript"></script>
        <script src="../view/scripts/jquery.dataTables.min.js" type="text/javascript"></script>
        <link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">
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
<br>
<table align="right">

  <td><a href="getpdfreports.html" target="_blank"><input type="submit" value="pdfreport" style="height:25px; width:100px" /></a></td></table> 
  <!--  <div align="right"><a href="getpdfreports.html" target="_blank" ><input type="submit" value="getPdfReport" style="height:25px; width:100px"/></a></div>-->
<div id="container1">
	<div id="page1">
    <div id="dt_example">
        <div id="container">
            <div id="demo_jui">
		        <table id="employee" class="display">
		           <thead>
		                <tr>
		                <th align="left">Employee Id</th>
		                 <th align="left">Roll No</th>
		                    <th align="left">Employee Name</th>
		                   
		                    <th align="left">Mobile No</th>
		                    <th align="left">Employee Category</th>
		                    <th align="left">Date Of Joining</th>
		                     <th align="left">Status</th>
		                    <th align="left">Update</th>
		                     <th align="left">Print</th>
		                   
		                  
		               </tr>
		            </thead>
		            <tbody>
		          		<c:forEach items="${list}" var="item">
						  <tr style="cursor:pointer" onmouseover="this.background='#C0C0C0'" ">
			                 <td><c:out value="${item.empid}"></c:out></td>
			                  <td><c:out value="${item.rollno}"></c:out></td>
						    <td><c:out value="${item.empname}"></c:out></td>
						  <!--    <td><img
					src="${pageContext.request.contextPath}/security/download/${item.empid}.html"
					width="60" height="40"></td>-->
						    <td><c:out value="${item.emp_mobileno}"></c:out></td>
						    <td><c:out value="${item.category}"></c:out></td>
						    <td><c:out value="${item.joinedon}"></c:out></td>
						     <td><c:out value="${item.empstatus}"></c:out></td>
						    <td><a href="updateEmployee.html?empid=${item.empid}">Update</a></td>
						    <td><a href="print.html?empid=${item.empid}" target="_blank">Print</a></td>
						  
						    
						     
						 </tr>
						  </c:forEach>
		            </tbody>
		        </table>
		    </div>
        </div>
        </div>
       </div>
       </div>
        
</body>
</html>