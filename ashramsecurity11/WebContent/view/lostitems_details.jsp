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

<br/><br/>
<div id="container1">
	<div id="page1">
    <div id="dt_example">
        <div id="container">
            <div id="demo_jui">
           
		        <table align="center" id="employee" class="display" border="0">
		           <thead>
		                <tr>
		                    <th align="left">S.No</th>
		                    <th align="left">Date</th>
		                    <th align="left">Name&Address</th>
		                    <th align="left">Contact No</th>
		                    <th align="left">Date&Time Of Lost</th>
		                    <th align="left">Reporting Date&Time</th>
		                    <th align="left">Items Lost</th>
		                    <th align="left">Place Of Lost</th>
		                </tr>
		            </thead>
		            <tbody>
		          		<c:forEach items="${list}" var="item">
						  <tr style="cursor:pointer" onmouseover="this.background='#C0C0C0'" ">
			                 <td><c:out value="${item.sno}"></c:out></td>
						     <td><c:out value="${item.date}"></c:out></td>
						
						     <td><c:out value="${item.name_address}"></c:out></td>
						     <td><c:out value="${item.contact_no}"></c:out></td>
						     <td><c:out value="${item.date_timeoflost}"></c:out></td>
						     <td><c:out value="${item.reporting_date_time}"></c:out></td>
						     <td><c:out value="${item.itemslost}"></c:out></td>
						     <td><c:out value="${item.placeoflost}"></c:out></td>
						    
						    
						     
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