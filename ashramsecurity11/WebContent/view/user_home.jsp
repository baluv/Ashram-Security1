<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="../security/main.css" rel="stylesheet" type="text/css">

 <!--<link rel="stylesheet" href="../validations/style.css" type="text/css" media="screen" />-->
 
 <!--Fom Library Css-->


<link href="../design/menu.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../design/ga.js">
</script>
<script type="text/javascript" src="../design/script.js"></script>
<script src="../design/swfobject_modified.js" type="text/javascript"></script>


<style type="text/css" media="screen">#FlashID {visibility:hidden}</style>
<link href="../design/tooltip.css" rel="stylesheet" type="text/css">
 
 
</head>

<body >
<c:url var="home" value="/security/home.html" />
<form:form action="${gethomepage}" method="post"  id="header">
<!--  <form name="QSearch11" method="post" id="header" action="/security/employeelist.html">-->
    	<table class="header" align="center" border="0" cellpadding="0" cellspacing="0" width="90%">
          <tbody><tr>
            <!-- <td class="logo_left"><img src="../security/logo_left.gif" alt=""></td> 
            <td class="txt_big_bold">Recruitment System</td>-->
            <td class="txt_big_bold" >SECURITY MANAGEMENT SYSTEM</td>
            <td class="wipro_logo">
                <a href="http://www.srivasishta.com/" target="_blank">
                <img src="../security/artofliving_logo.png" alt="Wipro Applying Thought" title="Wipro Applying Thought" border="0"></a></td>
          </tr>
      <tr>
            <td colspan="3" class="bg_blue_new"><img src="../security/spacer.gif" alt="" height="5" width="0"></td>
          </tr>
          
         
        </tbody></table>


<div class="menuarea">

<ul class="menu" id="menu">

<li><a href="user_home.html">Home</a></li>

<li><a href="#">Employee</a>
<ul>
<li><a href="user_employeedetails.html">Employee Details</a></li>
</ul>
</li>

<li><a href="#">Attendence</a>
<ul>
<li><a href="user_g4ssecuritydetails.html">G4SSecurity Details</a></li>
<li><a href="user_inhousesecuritydetails.html">InhouseSecurity Details</a></li>
</ul>
</li>

<li><a href="login.html">Logout</a></li>


</ul>


</div>

<!-- <div align="center">

<input type="text" name="empname"/>&nbsp;&nbsp;&nbsp;<input type="submit" value="search"/>
</div> -->

<br>
<center> 
	 
	
	</center> 
 

 
</form:form>
</body>
<script language="javascript" type="text/javascript">
	var menu2=new menu2.dd("menu2");
	menu2.init("menu2","menu2hover");
</script>

<script language="javascript" type="text/javascript">
	var menu=new menu.dd("menu");
	menu.init("menu","menuhover");
</script>
</html>