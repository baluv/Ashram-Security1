<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="user_home.jsp" %>
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
<br><br><br><br>
<div id="container1">
	<div id="page1">
    <div id="dt_example">
        <div id="container">
            <div id="demo_jui">
		        <table id="employee" class="display">
		           <thead>
		                <tr>
		                <th align="left">Employee Id</th>
		                    <th align="left">Employee Name</th>
		                   
		                    <th align="left">Mobile No</th>
		                    <th align="left">Email</th>
		                    <th align="left">Date Of Joining</th>
		                     <th align="left">Status</th>
		                   
		                  
		               </tr>
		            </thead>
		            <tbody>
		          		<c:forEach items="${list}" var="item">
						  <tr style="cursor:pointer" onmouseover="this.background='#C0C0C0'" ">
			                 <td><c:out value="${item.empid}"></c:out></td>
						    <td><c:out value="${item.empname}"></c:out></td>
						  <!--    <td><img
					src="${pageContext.request.contextPath}/security/download/${item.empid}.html"
					width="60" height="40"></td>-->
						    <td><c:out value="${item.emp_mobileno}"></c:out></td>
						    <td><c:out value="${item.emp_email}"></c:out></td>
						    <td><c:out value="${item.joinedon}"></c:out></td>
						     <td><c:out value="${item.empstatus}"></c:out></td>
						    
						    
						     
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