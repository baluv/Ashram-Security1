<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"  %>
<%@ page import="com.security.domain.Login"  %>

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
<script src="../js/addrows.js"></script>
<script type="text/javascript"
	src="../view/jqueryValidations/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript"
	src="../view/jqueryValidations/jquery.validate.js"></script>
<script src="../view/jqueryValidations/formValidation.js"
	type="text/javascript"></script>

<script src="../security/jquery-1.6.2.js"></script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>


<link href="../design/menu.css" rel="stylesheet" type="text/css">
<link href="../security/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
@import "../security/jquery.datepick.css";
</style>

<!--<link rel="stylesheet" href="../validations/style.css" type="text/css"
	media="screen" />-->

<script type="text/javascript" src="../validations/validate.js"
	charset="utf-8"></script>

<!-- datepicker -->
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
     $(document).ready(function()
     {
    	$("[id^=text2]").datepick();
    });
     $(document).ready(function()
     {
    	$("[id^=text3]").datepick();
    });
    $(document).ready(function()
     {
    	$("[id^=text4]").datepick();
    });
    $(document).ready(function()
    {
    	$("[id^=text5]").datepick();
    });
    $(document).ready(function()
    {
    	    	$("[id^=text6]").datepick();
    });
   
</script>
<!--<style type="text/css">
#h1 {
	height: 20px;
}

.font {
	size: 30px;
	color: red;
}
</style>-->

<style type="text/css">
body{
    font-family: 'Segoe UI';
    font-size: 12pt;
}

header h1{
    font-size:12pt;
    color: #fff;
    background-color: #1BA1E2;
    padding: 20px;

}
article
{
    width: 80%;
    margin:auto;
    margin-top:10px;
}


.thumbnail{

    height: 100px;
    margin: 10px;    
}

.drop-area{
  width:80px;
  height:7px;
  background-color:#E6E6E6;
  border: 1px solid #A4A4A4;
  text-align:center;
  padding:0px 0px 15px 0px;
  cursor:pointer;
}
#thumbnail img{
  width:100px;
  height:100px;
  margin:5px;
}
canvas{
  border:1px solid red;
}

</style>


<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
 
 if( document.empform.category.value == "none" )
 {
   alert( "Please provide Category" );
   document.empform.category.focus() ;
   return false;
   
 }
 
   if( document.empform.empname.value == "" )
   {
     alert( "Please provide your name!" );
     document.empform.empname.focus() ;
     return false;
   }
   if( document.empform.emp_mobileno.value=="")
   {
     alert( "Please provide your Mobile Number with numeric values!" );
     document.empform.emp_mobileno.focus() ;
     return false;
   }
   if( document.empform.emp_currentaddress.value == "")
          
   {
     alert( "Please provide Your Currentaddress" );
     document.empform.emp_currentaddress.focus() ;
     return false;
   }
   if( document.empform.emp_permanentaddress.value == "" )
   {
     alert( "Please provide your Permanentaddress" );
     document.empform.emp_permanentaddress.focus() ;
     return false;
   }
   if( document.empform.joineddate.value == "" )
   {
     alert( "Please provide your Joineddate" );
     document.empform.emp_joineddate.focus() ;
     return false;
   }
   if( document.empform.employee_designation.value == "" )
   {
     alert( "Please provide your Rank" );
     document.empform.employee_designation.focus() ;
     return false;
   }
    if(!document.empform.employee_salary.value.match(numbers))
   {
     alert( "Please enter salary with numeric values" );
     document.empform.employee_salary.focus() ;
     return false;
   }
   if(!document.empform.Roll_no.value.match(numbers))
   {
     alert( "Please enter Roll Number with numeric values" );
     document.empform.Roll_no.focus() ;
     return false;
   }
   if(!document.empform.emp_mobileno.value.match(numbers))
   {
     alert( "Please enter Mobile No with numeric values" );
     document.empform.emp_mobileno.focus() ;
     return false;
   }
   
   return( true );
}
//-->
</script>

<script>
window.onload = function(){
        
    //Check File API support
    if(window.File && window.FileList && window.FileReader)
    {
        var filesInput = document.getElementById("files");
        
        filesInput.addEventListener("change", function(event){
            
            var files = event.target.files; //FileList object
            var output = document.getElementById("result");
            
            for(var i = 0; i< files.length; i++)
            {
                var file = files[i];
                
                //Only pics
                if(!file.type.match('image'))
                  continue;
                
                var picReader = new FileReader();
                
                picReader.addEventListener("load",function(event){
                    
                    var picFile = event.target;
                    
                    var div = document.createElement("div");
                    
                    div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" +
                            "title='" + picFile.name + "'/>";
                    
                    output.insertBefore(div,null);            
                
                });
                
                 //Read the image
                picReader.readAsDataURL(file);
            }                               
           
        });
    }
    else
    {
        console.log("Your browser does not support File API");
    }
}
</script>






<script>
function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();

reader.onload = function (e) {
$('#img_prev')
.attr('src', e.target.result)
.width(100)
.height(100);
};

reader.readAsDataURL(input.files[0]);
}
}
</script>

<script>
jQuery(function($){
var fileDiv = document.getElementById("upload");
var fileInput = document.getElementById("upload-image");
console.log(fileInput);
fileInput.addEventListener("change",function(e){
  var files = this.files
  showThumbnail(files)
},false)

fileDiv.addEventListener("click",function(e){
  $(fileInput).show().focus().click().hide();
  e.preventDefault();
},false)

fileDiv.addEventListener("dragenter",function(e){
  e.stopPropagation();
  e.preventDefault();
},false);

fileDiv.addEventListener("dragover",function(e){
  e.stopPropagation();
  e.preventDefault();
},false);

fileDiv.addEventListener("drop",function(e){
  e.stopPropagation();
  e.preventDefault();

  var dt = e.dataTransfer;
  var files = dt.files;

  showThumbnail(files)
},false);

function showThumbnail(files){
  for(var i=0;i<files.length;i++){
    var file = files[i]
    var imageType = /image.*/
    if(!file.type.match(imageType)){
      console.log("Not an Image");
      continue;
    }

    var image = document.createElement("img");
    // image.classList.add("")
    var thumbnail = document.getElementById("thumbnail");
    image.file = file;
    thumbnail.appendChild(image)

    var reader = new FileReader()
    reader.onload = (function(aImg){
      return function(e){
        aImg.src = e.target.result;
      };
    }(image))
    var ret = reader.readAsDataURL(file);
    var canvas = document.createElement("canvas");
    ctx = canvas.getContext("2d");
    image.onload= function(){
      ctx.drawImage(image,100,100)
    }
  }
}
          });
</script>



</head>

<body>



<c:url var="saveEmployee" value="/security/saveEmployee.html" />
<form:form action="${saveEmployee}" method="post" commandName="sform"
	enctype="multipart/form-data"
	onsubmit="return(validate());" name="empform" >
	<!--<form name="sform" onSubmit="return emailCheck(this.txtEmail.value);">-->
	<table>
	<table  align="center" width="80%" border="0">
		<tr>
			<th align="center" colspan="5" class="font">${msg}</th>
		</tr>
		<tr>
			<th colspan="5"><u>ASHRAM SECURITY DEPARTMENT</u></th>
		</tr>
		<tr>
			<th colspan="5">RECRUITMENT FORM</th>
		</tr>
		<tr bgcolor="#ebf9fe">
			<th colspan="5" align="left">Personal Details</th>
		</tr>
		
		<tr>
			<td><b>Employee Category</b><font color="red"><sup>*</sup></font></td>
			<td colspan="2"><select name="category" class="selectbox">
			<option value="none">----Select----</option>
			<option value="Agency">Agency</option>
			<option value="In-House">In-House</option>
			
		</tr>
		
		<tr>
			<td><label for="username" class="block"><b>Name in Full</b>
			<font color="red"><sup>*</sup></font></label></td>
			<td colspan="2"><input type="text" name="empname"
				class="textbox"/></td>
			<td rowspan="5"><img id="img_prev" src="#" alt="your image" /></td>
			
		</tr>
		<tr>
			<td><b>DateOfBirth/Age</b></td>
			<td colspan="2"><input type="text" name="empdob" id="text"
				class="textbox"/></td>
				
		</tr>
		
		<tr>
			<td><b>Gender</b></td>
			<td colspan="2"><input type="radio" name="empgender"
				value="male">Male<input type="radio" name="empgender"
				value="female" />Female</td>
		</tr>
		
		
		
		<tr>
			<td><b>Father's/Guardian's Name</b></td>
			<td colspan="2"><input type="text" name="empfname"
				class="textbox"/></td>
				
		</tr>
		<tr>
			<td><b>Father's/Guardian's Profession and address</b></td>
			<td colspan="2"><textarea name="empfproffession" class="textbox1"></textarea></td>
			
		</tr>
		<tr>
			<td><b>Father's/Guardian's Contact no</b></td>
			<td colspan="2"><input type="text" name="fcontactno"
				class="textbox"/></td>
			<td><input type="file" name="ImageFile" onchange="readURL(this);" id="ImageFile"  style="height:25px; width:auto"/></td>
			<!--  <td> <input type="file" name="emp_photo" id="file"/><input type="submit" value="upload"/></td>--> 
		</tr>
		
		<tr>
			<td><b>Hight</b></td>
			<td colspan="2"><input type="text" name="emp_hight"
				class="textbox"/></td>
				
		</tr>
		
		<tr>
			<td><b>Weight</b></td>
			<td colspan="2"><input type="text" name="emp_weight"
				class="textbox"/></td>
				
		</tr>
		
		<tr>
			<td><b>Roll Number</b><font color="red"><sup>*</sup></font></td>
			<td colspan="2"><input type="text" name="Roll_no"
				class="textbox"/></td>
				
		</tr>



		<tr>
			<td><b>Current Address</b><font color="red"><sup>*</sup></font></td>
			<td colspan="2"><b>Permanent Address</b><font color="red"><sup>*</sup></font></td>
			<td></td>
			
		</tr>
		<tr>
			<td><textarea name="emp_currentaddress" class="textbox1"></textarea></td>
			<td colspan="2"><textarea name="emp_permanentaddress"
				class="textbox1"></textarea></td>
				 
		</tr>

		<tr>
			<td><b>MobileNumber</b><font color="red"><sup>*</sup></font><input type='tel' pattern="[0-9]{5,15}"
				name="emp_mobileno" class="textbox" id="phone_no"/></td>
			<td colspan="4"><b>MobileNumber</b>&nbsp;<input type="text" name="emp_alternatemobileno" class="textbox"
				id="phone_no1"/></td>
		</tr>
		<tr>
			<td><b>Contact email-id</b><input type="text"
				name="emp_email" id="txtEmail" class="textbox"/></td>
			<td colspan="4"><b>Contact email-id</b>&nbsp;<input type="text" name="emp_email"
				id="txtEmail1" class="textbox"/></td>
		</tr>

		<tr>
			<td><b>Marital Status</b></td>
			<td colspan="4"><input type="radio" name="emp_maritalstatus"
				class="bg_blue" onclick="javascript:radioWithText('two')"
				styleId="qwe" value="single"><b>Single</b><input type="radio"
				name="emp_maritalstatus" class="bg_blue"
				onclick="javascript:radioWithText('one')" value="married"><b>Married</b></td>
		</tr>
	</table>
	<div id="one" style="display: none;">
	<table width="60%" align="center">
		<tr>
			<td>if married,no of children</td>
			<td><input type="text" name="emp_noofchildrens" class="bg_blue"
				size="25" /></td>
		<tr>
			<td>Son(no's)</td>
			<td><input type="text" name="emp_noofsons" size="25"
				class="bg_blue" /></td>
			<td colspan="3">Age<input type="text" name="emp_sonage"
				class="bg_blue" size="25" /></td>
		</tr>
		<tr>
			<td>Daughter(no's)</td>
			<td><input type="text" name="emp_noofdaughters" class="bg_blue"
				size="25" /></td>
			<td>Age<input type="text" name="emp_daughterage"
				class="bg_blue" size="25" /></td>
		</tr>
	</table>
	</div>
	<br>
	<div id="two" style="display: none;"></div>
	<table id="familyrelations" align="center" width="80%">
		<tr >
			<td  class="ex"><b>Details of Family members including<br>
			dependents(Names)</b></td>
			<td width="15%" class="ex"><b>Relationship</b></td>
			<td width="15%" class="ex"><b>Occupation</b></td>
			<td colspan="2" width="10%" class="ex"><b>Age</b></td>
		</tr>
		<tr>
			<td width="20%"><input type="text" name="familymembers"
				class="textbox"/></td>
			<td width="15%"><input type="text" name="reltionship"
				class="textbox"/></td>
			<td width="15%"><input type="text" name="occupation"
				class="textbox"/></td>
			<td colspan="2" width="10%"><input type="text" name="age"
				class="textbox"/></td>
		</tr>
		<tr>
			<td width="20%"><input type="text" name="familymembers1"
				class="textbox"/></td>
			<td width="15%"><input type="text" name="reltionship1"
				class="textbox"/></td>
			<td width="15%"><input type="text" name="occupation1"
				class="textbox"/></td>
			<td colspan="2" width="10%"><input type="text" name="age1"
				class="textbox"/></td>
		</tr>
	</table>

	<br>
	<table id="languagesknown" align="center" width="80%">


		<tr bgcolor="#ebf9fe">
			<th width="20%" align="left">Languages Known</th>
			<th width="10%" align="left">Speak</th>
			<th width="10%" align="left">Read</th>
			<th width="10%" align="left">Write</th>
			<th width="10%" align="left">Remarks<br>
			(Level)&nbsp;&nbsp;</th>
		</tr>


		<tr>
			
				<td width="20%"><SELECT name="languagesknown" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Telugu">Telugu</OPTION>
				<OPTION value="English">English</OPTION>
				<OPTION value="Hindi">Hindi</OPTION>
				<OPTION value="Tamil">Tamil</OPTION>
				<OPTION value="Kannada">Kannada</OPTION>
				<OPTION value="Malayalam">Malayalam</OPTION>
				<OPTION value="Maraati">Maraati</OPTION>
			</SELECT></td>
			<td><SELECT name="speak" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				
			</SELECT></td>
			<td><SELECT name="read" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="write" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="remarks" class="selectbox">
			<option value="none">----Select----</option>
				<OPTION value="excellent">Excellent</OPTION>
				<OPTION value="intermediate">Intermediate</OPTION>
				<OPTION value="lower">Lower</OPTION>

			</SELECT></td>
		</tr>
		<tr>
			<td width="20%"><SELECT name="languagesknown1" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Telugu">Telugu</OPTION>
				<OPTION value="English">English</OPTION>
				<OPTION value="Hindi">Hindi</OPTION>
				<OPTION value="Tamil">Tamil</OPTION>
				<OPTION value="Kannada">Kannada</OPTION>
				<OPTION value="Malayalam">Malayalam</OPTION>
				<OPTION value="Maraati">Maraati</OPTION>
			</SELECT></td>
			
			<td><SELECT name="speak1" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				
			</SELECT></td>
			<td><SELECT name="read1" class="selectbox">
	
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="write1" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="remarks1" class="selectbox">
			<option value="none">----Select----</option>
				<OPTION value="excellent">Excellent</OPTION>
				<OPTION value="intermediate">Intermediate</OPTION>
				<OPTION value="lower">Lower</OPTION>

			</SELECT></td>
		</tr>
<tr>
			
				<td width="20%"><SELECT name="languagesknown2" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Telugu">Telugu</OPTION>
				<OPTION value="English">English</OPTION>
				<OPTION value="Hindi">Hindi</OPTION>
				<OPTION value="Tamil">Tamil</OPTION>
				<OPTION value="Kannada">Kannada</OPTION>
				<OPTION value="Malayalam">Malayalam</OPTION>
				<OPTION value="Maraati">Maraati</OPTION>
			</SELECT></td>
			<td><SELECT name="speak2" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				
			</SELECT></td>
			<td><SELECT name="read2" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="write2" class="selectbox">
				
				<option value="none">----Select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="remarks2" class="selectbox">
			<option value="none">----Select----</option>
				<OPTION value="excellent">Excellent</OPTION>
				<OPTION value="intermediate">Intermediate</OPTION>
				<OPTION value="lower">Lower</OPTION>

			</SELECT></td>
		</tr>

	</table>
	<br>
	<table id="#ebf9fe" align="center" width="80%">
		<tr bgcolor="#ebf9fe">
			<th colspan="5" align="left">Educational Qualifications</th>
		</tr>
		<tr >
			<td><b>Examination Passed</b></td>
			<td><b>Name of School/<br>
			College/University</b></td>
			<td><b>Duration of <br>
			Course</b></td>
			<td><b>Year of <br>
			Passing</b></td>
			<td><b>class&<br>
			percentage</b></td>
		</tr>
		<tr>
			<td width="15%"><input type="text" name="examinationpassed"
				class="textbox" /></td>
			<td width="15%"><input type="text" name="nameofschool"
				class="textbox" /></td>
			<td width="10%"><input type="text" name="duration"
				class="textbox" /></td>
			<td width="10%"><input type="text" name="yearofpassing"
				class="textbox" /></td>
			<td width="10%"><input type="text" name="percentage"
				class="textbox" /></td>
		</tr>
		<tr>
			<td width="15%"><input type="text" name="examinationpassed1"
				class="textbox" /></td>
			<td width="15%"><input type="text" name="nameofschool1"
				class="textbox" /></td>
			<td width="10%"><input type="text" name="duration1"
				class="textbox" /></td>
			<td width="10%"><input type="text" name="yearofpassing1"
				class="textbox" /></td>
			<td width="10%"><input type="text" name="percentage1"
				class="textbox" /></td>
		</tr>
	</table>

	<br>
	<table id="companyexperience" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<th colspan="5" align="left">Details of Experience</th>
		</tr>
		<tr >
			<td width="15%"><b>Company name&Address</b></td>
			<td width="10%"><b>Designation</b></td>
			<td width="10%"><b>Salary per<br>
			month</b></td>
			<td width="10%"><b>Period of<br>
			employrment<br>
			From-To</b></td>
			<td width="15%"><b>Reason for<br>
			leaving<br>
			the job</b></td>
		</tr>
		<tr>
			<td width="15%"><textarea name="comapanyaddress" class="textbox1"></textarea></td>
			<td width="9%"><input type="text" name="designation" class="textbox" /></td>
			<td width="9%"><input type="text" name="salary" class="textbox" /></td>
			<td width="9%"><input type="text" name="fromto" class="textbox" /></td>
			<td width="18%"><textarea name="reason" class="textbox1"></textarea></td>
		</tr>
		<tr>
			<td width="15%"><textarea name="comapanyaddress1" class="textbox1"></textarea></td>
			<td width="9%"><input type="text" name="designation1" class="textbox" /></td>
			<td width="9%"><input type="text" name="salary1" class="textbox" /></td>
			<td width="9%"><input type="text" name="fromto1" class="textbox" /></td>
			<td width="18%"><textarea name="reason1" class="textbox1"></textarea></td>
		</tr>
	</table>
	<br>
	<table id="activities" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<th colspan="5" align="left">Extra-curricular Activities(Official positions
			held)</th>
		</tr>
		<tr>
			<td width="15%"><b>Type of Activities</b></td>
			<td width="15%"><b>At school</b></td>
			<td width="15%"><b>At college</b></td>
			<td colspan="2" width="15%"><b>Later</b></td>
		</tr>
		<tr>
			<td width="15%"><input type="text" name="activities" class="textbox" /></td>
			 <td width="20%">
			 <select name="atschool" class="selectbox">
			<option value="none">----Select----</option>
			<OPTION value="YES">YES</OPTION>
			<OPTION value="NO">NO</OPTION>
</SELECT>
</td>
			<td width="20%">
<SELECT name="atcollege" class="selectbox">
<option value="none">----Select----</option>
<OPTION value="YES">YES</OPTION>
<OPTION value="NO">NO</OPTION>
</SELECT>
</td>
			<td width="20%">
<SELECT name="later" class="selectbox">
<option value="none">----Select----</option>
<OPTION value="YES">YES</OPTION>
<OPTION value="NO">NO</OPTION>
</SELECT>
</td>
		</tr>
		<tr>
			<td width="15%"><input type="text" name="activities1" class="textbox" /></td>
			<td width="20%">
<SELECT name="atschool1" class="selectbox">
<option value="none">----Select----</option>
<OPTION value="YES">YES</OPTION>
<OPTION value="NO">NO</OPTION>
</SELECT>
</td>
			<td width="20%">
<SELECT name="atcollege1" class="selectbox">
<option value="none">----Select----</option>
<OPTION value="YES">YES</OPTION>
<OPTION value="NO">NO</OPTION>
</SELECT>
</td>
			<td width="20%">
<SELECT name="later1" class="selectbox">
<option value="none">----Select----</option>
<OPTION value="YES">YES</OPTION>
<OPTION value="NO">NO</OPTION>
</SELECT>
</td>
		</tr>

	</table>
	<br>
	<table id="artofliving" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<th colspan="5" align="left">Connection-"Art of Living"<br>
			</th>
		</tr>
		<tr>
			<td width="15%"><b>Course</b></td>
			<td width="10%"><b>Location</b></td>
			<td width="10%"><b>Teacher</b></td>
			<td width="10%"><b>Date</b></td>
			<td width="15%"><b>Remarks</b></td>
		</tr>
		<tr>
			<td width="15%"><select name="course" class="selectbox">
			<option value="none">----Select----</option>
			<option value="YLTP">YLTP<option>
			<option value="PART-1">PART-1</option>
			<option value="PART-2">PART-2</option>
			<option value="DSN">DSN</option>
			
			</select></td>
			<td width="10%"><input type="text" name="location" class="textbox" /></td>
			<td width="10%"><input type="text" name="teacher" class="textbox" /></td>
			<td width="10%"><input type="text" name="date" class="textbox" id="text5"/></td>
			<td width="15%"><textarea name="artoflivingremarks" class="textbox1"></textarea></td>
		</tr>
		<tr>
			<td width="15%"><select name="course1" class="selectbox">
			<option value="none">----Select----</option>
			<option value="YLTP">YLTP</option>
			<option value="PART-1">PART-1</option>
			<option value="PART-2">PART-2</option>
			<option value="DSN">DSN</option>
			
			</select></td>
			<td width="10%"><input type="text" name="location1" class="textbox" /></td>
			<td width="10%"><input type="text" name="teacher1" class="textbox" /></td>
			<td width="10%"><input type="text" name="date1" class="textbox" id="text6"/></td>
			<td width="15%"><textarea name="artoflivingremarks1" class="textbox1"></textarea></td>
		</tr>
	</table>

	<br>
	<table width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<th colspan="10" align="left">Recommending teacher details<br>
			</th>
		</tr>
		<tr>
			<td><b>Name and Address</b></td>
			<td><b>Teacher Code</b></td>
			<td><b>Mobile No</b></td>
			<td><b>Email Id</b></td>
			<td></td>
		</tr>
		<tr>
			<td><textarea name="tname" class="textbox1"></textarea></td>
			<td><input type="text" name="tcode" class="textbox" /></td>
			<td><input type="text" name="tmobilenumber" class="textbox" /></td>
			<td><input type="text" name="temailid" class="textbox" /></td>
			<td></td>
		</tr>
		<tr bgcolor="#ebf9fe">
			<th colspan="10" align="left">References<br>
			</th>
		</tr>
		<tr>
			<td><b>Name</b></td>
			<td><b>Present Address</b></td>
			<td><b>Present Contact No</b></td>
			<td colspan="2"><b>Email Id</b></td>
		</tr>
		<tr>
			<td>1&nbsp;<input type="text" name="rname" class="textbox" /></td>
			<td><textarea name="raddress" class="textbox1"></textarea></td>
			<td ><input type="text" name="pcontactno" class="textbox" /></td>
				<td colspan="2"><input type="text" name="refemailid" class="textbox"/></td>
		</tr>
		<tr>
			<td>2&nbsp;<input type="text" name="rname1" class="textbox" /></td>
			<td><textarea name="raddress1" class="textbox1"></textarea></td>
			<td ><input type="text" name="pcontactno1" class="textbox" /></td>
				<td colspan="2"><input type="text" name="refemailid1" class="textbox"/></td>
				
		</tr>
	  	<tr>
			 <td colspan="5"><br>
			Date&nbsp;&nbsp;<input type="text" name="emp_date" id="text1" class="textbox"/><br><br>
			Place&nbsp;<input type="text" name="emp_place" class="textbox" /></td>
			<!-- Signature of the applicant:-->
		</tr> 
		<tr>
			<td colspan="5"><br>
			</td>
		</tr>
		<tr bgcolor="#ebf9fe">
			<th colspan="10" align="left"><br>
			For office use only<br>
			</th>
		</tr>
		<tr>
			<td><b>Probation/training period</b></td>
			<td colspan="4"><input type="text" name="probationperiod" class="textbox" /></td>
			
			
		</tr>
		<tr>
			<td><b>Department/section to be posted</b></td>
			<td colspan="4"><input type="text" name="deptpost" class="textbox" /></td>
			
			
				
		</tr>
		<tr>
			<td><b>Security Post</b></td>
			<td colspan="2"><select name="employee_designation" class="selectbox">
			<option value="none">----Select----</option>
			<option value="Security Guard">Security Guard</option>
			<option value="Head Guard">Head Guard</option>
			<option value="Security Supervisor">Security Supervisor</option>
			
			<td  rowspan="9" > 
				<article>
					
        			<label for="files" ></label>
        			
        			<input id="files" type="file" name="ImageFile2"  />
        			
        			
        			<!--<input id="file" type="file" name="ImageFile3"  /> -->
        			<output id="result" />
        			
   	 			</article>
   	 			
   	 			
   	 		
			</td>
			
			
			<td rowspan="9">
			<input  type="file" style="display:none" id="upload-image" name="ImageFile3" ></input>
					<div id="upload" class="drop-area">Browse_</div>
						<div id="thumbnail"></div>
			
			</td>
			
   	 		
		</tr>
		
		<tr>
			<td><b>Salary</b><font color="red"><sup>*</sup></font></td>
			<td colspan="4"><input type="text" name="employee_salary" class="textbox" /></td>
			
			
			
			
				
				
		</tr>
		<tr>
			<td><b>Expected Date of Joining</b></td>
			<td ><input type="text" name="joiningdate" id="text2" class="textbox" /></td>
			
			
   	 		
   	 		
			
				
		</tr>
		<tr>
			
		</tr>
		<tr>
			<td>
			<b>Joined On</b><font color="red"><sup>*</sup></font>
			</td>
			<td colspan="4"><input type="text" name="joineddate" id="text3" class="textbox" /></td>
			
		</tr>
		<tr>
			<td>
			<b>Re-Joined Date</b>
			</td>
			<td colspan="4"><input type="text" name="emp_rejoined_date" id="text4" class="textbox" /></td>
				
				
				
   	 		
		</tr>
				
		<tr>
			<td>
			<b>Head-Training&Development,Ashram
			security</b>
			</td>
			<td colspan="4"><textarea name="security" class="textbox1"></textarea></td>
			
		</tr>
	<tr><td></td></tr>
		<tr>
			<td><b>Head of Ashram Security Department</b></td>
			<td >
			<b>Employee Signature</b></td>
			<td>
			<b>Security Incharge Signature</b>
			</td>
		</tr>
		
		
		
		<tr>
			<td colspan="3" align="center"><input type="submit"
				id="btnSubmit" value="submit" size="30" style="height:25px; width:75Npx;"
				onclick="return Validate(this.phone_no.value)" /></td>
		</tr>

	</table>
	
	</table>
		
</form:form>

</body>

</html>