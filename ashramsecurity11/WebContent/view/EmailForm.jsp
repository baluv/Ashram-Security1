<%@include file="include.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	 "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Email with Spring MVC</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">
</head>
<body>
<br><br>
	
		<h1 align="center">Sending e-mail</h1>
		<center><c:url var="savepassregister" value="/security/sendemail.html"></c:url>
		<form:form action="${savepassregister}" method="post"  commandName="passes" >
		<input type="hidden" name="id" value="${id}" />
		<center>
			<table border="0" width="50%" >
			<tr>
			<th align="center" colspan="5" class="font"><font color="red">${msg}</font></th>
		</tr>
				<tr>
					<td><b>To</b></td>
					<td colspan="2"><input type="text" name="recipient"
				class="bg_blue" size="50" value="${email}" /></td>
					
					
				</tr> 
				<tr>
					<td><b>Subject</b></td>
					<td><input type="text" name="subject" size="50" value="Gentle Reminder: Renewal of Vehicle Pass"  /></td>
				</tr> 
				<tr>
					<td><b>Message</b></td>
					<td><textarea cols="50" rows="10" name="message">
					Your Vehicle Pass Validity Expire at the end of this month
					Request you to renew the pass at the earliest
					</textarea></td>
				</tr> 
				<br>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Send E-mail" style="height:25px; width:100px"/>
					</td>
				</tr>
			</table>
			</center>
		</form:form>
	</center>
</body>
</html>