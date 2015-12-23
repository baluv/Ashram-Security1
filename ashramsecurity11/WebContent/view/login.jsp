<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Ashram Security</title>
<meta charset="UTF-8" />

	<title>Login Form</title>
	
	<!-- Stylesheets -->
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet'>
	<link rel="stylesheet" href="../css/login.css">
	<script type="text/javascript" src="../jqueryValidations/back.js"></script>

	<!-- Optimize for mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<script code="naresh">
window.location.hash="no";
window.location.hash="Again-no";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no";}
</script> 

<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
 
    if ( document.login.role.value=="none")
	 	
	{
	  alert( "please provide Role!" );
	  document.login.role.focus();
	  return false;
	}
 
    if ( document.login.username.value=="none")
	 	
	{
	  alert( "please provide username!" );
	  document.login.username.focus();
	  return false;
	}
 
 	if ( document.login.password.value=="")
 	
 	{
 	  alert( "please provide password!" );
 	  document.login.password.focus();
 	  return false;
 	}
 	
 	var role = document.getElementById('role').value;
 	var username = document.getElementById('login-username').value;
 	
 	if(role != username)
 	{
 		alert( "Your Role And Username Does not match" );
 	  	
 	  	return false;
 	 }
 	
   
    
    return( true );
}
  </script>
  
  


 
</head>
<body>
  
	
	
	
	<!-- HEADER -->
	<div id="header">
		
		<div class="page-full-width cf">
	
			<div id="login-intro" class="fl">
			
				<h1>Login to Security Management System</h1>
				<h5>Enter your credentials below</h5>
			
			</div> <!-- login-intro -->
			
			<!-- Change this image to your own company's logo -->
			<!-- The logo will automatically be resized to 39px height. -->
			<a href="#" id="company-branding" class="fr"><img src="../images/security.jpg" alt="Blue Hosting" /></a>
			
		</div> <!-- end full-width -->	

	</div> <!-- end header -->
	
	
	
	<!-- MAIN CONTENT -->
	<div id="content">
	<c:url var="checklogin" value="/security/checklogin.html"></c:url>
	<form:form action="${checklogin}" id="login-form"  onsubmit="return(validate());" name="login" >
	<br/><br/>
			<fieldset>
			<font color="red" size="3">${msg}</font>
			<p>
					<label><b>Select Role<font color="red"><sup>*</sup></font></b><select class="selectbox" name="role" id= "role" >
					<option value="none">---select---</option>
					<option value="admin">admin</option>
					<option value="manager">manager</option>
					<!--<option value="dataoperator">dataoperator</option>
					<option value="user">user</option>-->
					</select></label>
				</p>

				<p>
					<label for="login-username"><b>username<font color="red"><sup>*</sup></font></b></label>
					<input type="text" name="username" required id="login-username" class="round full-width-input" />
				</p>

				<p>
					<label for="login-password"><b>password<font color="red"><sup>*</sup></font></b></label>
					<input type="password" name="password" required id="login-password" class="round full-width-input" />
				</p>
				
			<!--	<p>I've <a href="#">forgotten my password</a>.</p> -->
				
				<input type="submit"    class="button round blue image-right ic-right-arrow">

			</fieldset>
<!--
			<br/><div class="information-box round">Just click on the "LOG IN" button to continue, no login information required.</div> -->

		</form:form>
		
	 <!-- end content -->
	<br><br><br><br><br><br><br>
	</div>
	<br>
	<!-- FOOTER -->
	<div id="footer">

		<p>&copy; Copyright 2013 <a href="http://www.srivasishta.com/" target="_blank">Sri Vasishta</a>. All rights reserved.</p>
		
	
	</div> <!-- end footer -->
</body>
</html>