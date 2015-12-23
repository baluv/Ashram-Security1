<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ashram Security</title>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">

 <!--<link rel="stylesheet" href="../validations/style.css" type="text/css" media="screen" />-->
 
 <!--Fom Library Css-->


<link href="../design/js-image-slider.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../design/ga1.js">
</script>
<script type="text/javascript" src="../design/script.js"></script>
<script src="../design/swfobject_modified.js" type="text/javascript"></script>
<script src="../design/js-image-slider.js" type="text/javascript"></script>


<style type="text/css" media="screen">#FlashID {visibility:hidden}</style>
<link href="../design/tooltip1.css" rel="stylesheet" type="text/css">
<!--<script type="text/javascript">
 function validate()
{
 var numbers = /^[0-9]+$/;
   if( document.passregisterform.expire_date.value == "" )
   {
     alert( "Pass Expire In 2 Days!" );
     document.passregisterform.expire_date.focus() ;
     return false;
   }
 return( true );
}
</script> -->

<script code="naresh">
window.location.hash="no";
window.location.hash="Again-no";//again because google chrome don't insert first hash into history
window.onhashchange=function(){window.location.hash="no";}
</script>  


</head>

<body >
<c:url var="home" value="/security/sample.html" />
<form:form action="${gethomepage}" method="post"  id="header">
<!--  <form name="QSearch11" method="post" id="header" action="/security/employeelist.html">-->
    	<table class="header"  border="0" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <!-- <td class="logo_left"><img src="../security/logo_left.gif" alt=""></td>--> 
            <td class="txt_big_bold" >Security Management System</td>
            <td class="wipro_logo">
                <a href="http://www.srivasishta.com/" target="_blank">
                <img src="../security/artofliving_logo.png" alt="Wipro Applying Thought" title="Vasishta Applying Thought" border="0" ></a></td>
          </tr>
      <tr>
            <td colspan="2" class="bg_blue_new"><img src="../security/spacer.gif" alt=""></td>
          </tr>
          
         
        </tbody></table>





<div class="menuarea">
<ul class="menu" id="menu">

<li><a href="home.html">Home</a></li>

<li><a href="#">Employee</a>
<ul>
<li><a href="addemployee.html">New Employee</a></li>
<li><a href="employeedetails.html">Employee Details</a></li>
</ul>
</li>

<li><a href="#">Attendence</a>
<ul><li><a href="g4ssecurity.html">Agency Security</a></li>
<li><a href="inhousesecurity.html">Inhouse Security</a></li>
<li><a href="g4ssecuritydetails.html">AgencySecurity Details</a></li>
<li><a href="inhousesecuritydetails.html">InhouseSecurity Details</a></li></ul></li>

<li><a href="#">Reports</a><ul><li><a href="g4ssecurityreport.html">AgencySecurity Report </a></li>
<li><a href="inhousesecurityreport.html">InhouseSecurity Report</a></li></ul>
</li>
<li><a href="#">Items Register</a>
<ul>
<li><a href="lostitemregister.html">LostItem Register</a></li>
<li><a href="founditemregister.html">FoundItem Register</a></li>
<li><a href="lostitemdetails.html">LostItem Details</a></li>
<li><a href="founditemdetails.html">FoundItem Details</a></li>
</ul>
</li>
<li><a href="#">Leave</a>
<ul><li><a href="leave.html">Leave Application</a></li>
<li><a href="leavedetails.html">Leave Details</a></li></ul>
</li>
<li><a href="#">Salary</a>
<ul>
<li><a href="salarycalculation.html">Salary Calucation</a></li>
<li><a href="g4ssalarydetails.html">AgencySecurity Salary Details</a></li>
<li><a href="inhousesalarydetails.html">InhouseSecurity Salary Details</a></li>
</ul>
</li>

<li><a href="#">Vehicle Pass Register</a>
<ul>
<li><a href="pass_register.html">Vehicle Pass Types</a></li>
<li><a href="getpassregister.html">Vehicle Pass Details</a></li>
</ul>
</li>
<li><a href="#">Vehicle</a>
<ul>
<li><a href="twowheeler.html"> Vehicle</a></li>
<li><a href="vehiclereport.html">Vehicle Report</a></li>
</ul>
</li>

<li><a href="login.html">Logout</a></li>



</ul>

</div>
<!-- <div align="center">

<input type="text" name="empname"/>&nbsp;&nbsp;&nbsp;<input type="submit" value="search"/>
</div> -->

<br/><br/><br/>
<center> 
	 
  <!-- <img  style="padding:25px;" src="../view/images/ashram.jpg"  height="450" width="1200"></img>  -->
  
  <div id="sliderFrame">
        <div id="slider">
           
            <img style="padding:25px;" src="../view/images/image2.JPG" />
            <img style="padding:25px;" src="../view/images/image1.JPG" />
            <img style="padding:25px;" src="../view/images/image3.JPG" />
            
        </div>
       
    </div>
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