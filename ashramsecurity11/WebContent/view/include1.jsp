<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ashram Security</title>
 <!--link href="../security/CareerSite09.css" rel="stylesheet" type="text/css">
<link href="../security/CareerSite.css" rel="stylesheet" type="text/css"-->
<script src="../security/menu_builder.js" type="text/javascript"></script>
<script src="../security/menuitems.js" type="text/javascript"></script>
<script src="../security/menuitems_sub.js" type="text/javascript"></script>
<script language="JavaScript" src="../security/nav_content.htm"></script>
<script language="JavaScript" src="../security/mm_menu.htm"></script>
<script language="JavaScript" src="../security/side_menu.htm"></script>
<script src="../security/date-picker.js"></script>

<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">

 <!--<link rel="stylesheet" href="../validations/style.css" type="text/css" media="screen" />-->
 
 <!--Fom Library Css-->


<script type="text/javascript" src="../design/ga.js">
</script>
<script type="text/javascript" src="../design/script.js"></script>
<script src="../design/swfobject_modified.js" type="text/javascript"></script>


<!--style type="text/css" media="screen">#FlashID {visibility:hidden}</style-->

 
 
</head>

<body >
<c:url var="home" value="/security/home.html" />
<form:form action="${gethomepage}" method="post"  id="header">
<!--  <form name="QSearch11" method="post" id="header" action="/security/employeelist.html">-->
    	<table class="header"  border="0" cellpadding="0" cellspacing="0">
          <tbody><tr>
            <!-- <td class="logo_left"><img src="../security/logo_left.gif" alt=""></td>--> 
            <td class="txt_big_bold" >Security Management System</td>
            <td class="wipro_logo">
                <a href="http://www.srivasishta.com/" target="_blank">
                <img src="../security/artofliving_logo.png" alt="Wipro Applying Thought" title="Vasishta Applying Thought"></a></td>
          </tr>
      <tr>
            <td colspan="2" class="bg_blue_new"><img src="../security/spacer.gif" alt=""></td>
          </tr>
          
         
        </tbody></table>





<div class="menuarea">
<ul class="menu" id="menu">

<li><a href="manager_home.html">Home</a></li>

<li><a href="#">Employee</a>
<ul><li><a href="addemployee.html">New Employee</a></li>
<li><a href="employeedetails.html">Employee Details</a></li></ul>
</li>

<li><a href="#">Attendence</a>
<ul><li><a href="g4ssecurity.html">Agency Security</a></li>
<li><a href="inhousesecurity.html">Inhouse Security</a></li>
<li><a href="g4ssecuritydetails.html">AgencySecurity Details</a></li>
<li><a href="inhousesecuritydetails.html">InhouseSecurity Details</a></li></ul></li>
<li><a href="#">Reports</a><ul><li><a href="g4ssecurityreport.html">AgencySecurity Report </a></li>
<li><a href="inhousesecurityreport.html">InhouseSecurity Report</a></li></ul>
</li>
<li><a href="#">Items Register</a><ul><li><a href="lostitemregister.html">LostItem Register</a></li>
<li><a href="founditemregister.html">FoundItem Register</a></li>
<li><a href="lostitemdetails.html">LostItem Details</a></li>
<li><a href="founditemdetails.html">FoundItem Details</a></li>
</ul>
<li><a href="#">Leave</a>
<ul><li><a href="leave.html">Leave Application</a></li>
<li><a href="leavedetails.html">Leave Details</a></li></ul>
</li>



<li><a href="#">Vehicle</a>
<ul>
<li><a href="twowheeler.html"> Vehicle</a></li>
<li><a href="vehiclereport.html">Vehicle Report</a></li>
</ul>
</li>


<li><a href="logout.html">Logout</a></li>



</ul>

</div>
<!-- <div align="center">

<input type="text" name="empname"/>&nbsp;&nbsp;&nbsp;<input type="submit" value="search"/>
</div> -->


 
  

 
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