<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <script src="../js/addrows.js"></script>
  <script type="text/javascript"
	src="../view/jqueryValidations/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript"
	src="../view/jqueryValidations/jquery.validate.js"></script>
 <script src="../view/jqueryValidations/formValidation.js"
	type="text/javascript"></script> -->

<script src="../security/jquery-1.6.2.js"></script>

<script type="text/javascript" src="../security/jquery.datepick.js"></script>
<style type="text/css">
@import "../security/jquery.datepick.css";
</style>

<link rel="stylesheet" href="../validations/style.css" type="text/css"
	media="screen" />

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
   
</script>
<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">


<style type="text/css">
#h1 {
	height: 50px;
}

.font {
	size: 16px;
	color: red;
}
</style>

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

<body style="font-size: 14px">




<c:url var="updateEmployee" value="/security/employeeUpdated.html" />
<form:form action="${updateEmployee}" method="post" commandName="sform"
	enctype="multipart/form-data"
	onsubmit="return emailCheck(this.txtEmail.value);">
	
	<input type="hidden" name="empid" value="${empid}" />
	

	<table align="center" width="80%" border="0">
		<tr>
			<th align="center" colspan="5" class="font">${msg}</th>
		</tr>
		<tr>
			<th colspan="5"><u>ASHRAM SECURITY DEPARTMENT</u></th>
		</tr>
		<tr>
			<th colspan="5">RECRUITMENT FORM</th>
		</tr><br/>
		
	
		<tr bgcolor="#ebf9fe">
			<th colspan="5" align="left">Personal</th>
		</tr>
		<tr>
			<td><label for="username" class="block"><b>Name in Full</b></label></td>
			<td colspan="2"><input type="text" name="empname" class="textbox" size="35" value="${empname}" /></td>
			<td rowspan="5"><img src="../view/images/${empimage}"  name="ImageFile" width="115" height="128"/></td>
			
	    </tr>
		
		<tr>
			<td><b>DateOfBirth/Age</b></td>
			<td colspan="2"><input type="text" name="empdob" id="text"
				class="textbox" value="${dob}" /></td>
		</tr>
		<tr>
			<td><b>Gender</b></td>
			<td colspan="2"><c:if test="${gender=='male'}">
				<input type="radio" name="empgender" value="male" checked="checked">male<input
					type="radio" name="empgender" value="female" />female</c:if> <c:if
				test="${gender=='female'}">
				<input type="radio" name="empgender" value="male">male<input
					type="radio" name="empgender" value="female" checked="checked" />female</c:if>
			</td>
		</tr>
		<tr>
			<td><b>Father's/Guardian's Name</b></td>
			<td colspan="2"><input type="text" name="empfname"
				class="textbox" value="${fname}" /></td>
				
		</tr>
		
		<tr>
			<td><b>Father's/Guardian's Profession and address</b></td>
			<td colspan="2"><textarea name="empfproffession" class="textbox1"/><c:out
				value="${faddress}" /></textarea></td>
		</tr>
		<tr>
			<td><b>Father's/Guardian's Contact no</b></td>
			<td colspan="2"><input type="text" name="fcontactno"
				class="textbox" value="${fcontact}"/></td>
			
		</tr>
		
		<tr>
			<td><b>Hight</b></td>
			<td colspan="2"><input type="text" name="emp_hight"
				class="textbox" value="${emphight}" /></td>
			
		</tr>
		
		<tr>
			<td><b>Weight</b></td>
			<td colspan="2"><input type="text" name="emp_weight"
				class="textbox" value="${empweight}" /></td>
			
		</tr>
		
		
		<tr>
			<td><b>Roll No</b></td>
			<td colspan="2"><input type="text" name="rollno"
				class="textbox" value="${rollno}" /></td>
			
		</tr>

		<tr>
			<td><b>Current Address</b></td>
			<td colspan="4"><b>Permanent Address</b></td>
		</tr>
		<tr>
			<td><textarea name="emp_currentaddress" class="textbox1"><c:out
				value="${currentaddress}" /></textarea></td>
			<td colspan="4"><textarea name="emp_permanentaddress"
				class="textbox1"><c:out value="${permanentaddress}" /></textarea></td>
		</tr>

		<tr>
			<td><b>MobileNumber</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
				name="emp_mobileno" class="textbox" id="phone_no" size="25"
				value="${mobilenumber}" /></td>
			<td colspan="4"><b>MobileNumber</b>&nbsp;&nbsp;&nbsp;&nbsp;<input
				type="text" name="emp_alternatemobileno" class="textbox"
				id="phone_no1" value="${alternatemobile}" /></td>
		</tr>
		<tr>
			<td><b>Contact email-id</b>&nbsp;&nbsp;<input type="text"
				name="emp_email" id="txtEmail" class="textbox" value="${email}" />
				<td colspan="4"><b>Contact email-id</b>&nbsp;<input type="text" name="emp_email" id="txtEmail1" class="textbox"/></td>
		</tr>

		<tr>
			<td><b>Marital Status</b></td>
			<td colspan="4"><c:if test="${maritalstatus=='single'}">
				<input type="radio" name="emp_maritalstatus" class="bg_blue"
					onclick="javascript:radioWithText('two')" styleId="qwe"
					value="single" checked="checked" />single<input type="radio"
					name="emp_maritalstatus" class="bg_blue"
					onclick="javascript:radioWithText('two')" styleId="qwe"
					value="married" />married</c:if> <c:if test="${maritalstatus=='married'}">
				<input type="radio" name="emp_maritalstatus" class="bg_blue"
					onclick="javascript:radioWithText('two')" styleId="qwe"
					value="single" />single<input type="radio"
					name="emp_maritalstatus" class="bg_blue"
					onclick="javascript:radioWithText('one')" value="married"
					checked="checked">married</c:if></td>
		</tr>
	</table>


	<!--<c:if test="${maritalstatus=='single'}"><input type="radio" name="emp_maritalstatus" class="bg_blue" onclick="javascript:radioWithText('two')" styleId="qwe" value="single" checked="checked">single
</c:if>

<c:if test="${maritalstatus=='married'}">
<input type="radio" name="emp_maritalstatus" class="bg_blue" onclick="javascript:radioWithText('one')" value="married" checked="checked" >married

</c:if>-->

	<div id="one" style="display: none;">
	<table width="80%" align="center">
		<tr>
			<td>if married,no of children</td>
			<td><input type="text" name="emp_noofchildrens" class="bg_blue"
				size="25" value="${noofchildrens}" /></td>
		<tr>
			<td>Son(no's)</td>
			<td><input type="text" name="emp_noofsons" size="25"
				class="bg_blue" value="${noofsons}" /></td>
			<td colspan="3">Age:<input type="text" name="emp_sonage"
				class="bg_blue" size="25" value="${sonage}" /></td>
		</tr>
		<tr>
			<td>Daughter(no's)</td>
			<td><input type="text" name="emp_noofdaughters" class="bg_blue"
				size="25" value="${noofdaughters}" /></td>
			<td>Age:<input type="text" name="emp_daughterage"
				class="bg_blue" size="25" value="${daughterage}" /></td>
		</tr>
	</table>
	</div>
	<br>
	<div id="two" style="display: none;"></div>
	<table id="familyrelations" align="center" width="80%">
		<tr >
			<td width="20%" class="ex"><b>Details of Family members including<br>
			dependents(Names)</b></td>
			<td width="15%" class="ex"><b>Relationship</b></td>
			<td width="15%" class="ex"><b>Occupation</b></td>
			<td colspan="2" width="10%" class="ex"><b>Age</b></td>
		</tr>
		<c:forEach items="${list}" var="item">
			<input type="hidden" name="familyid" value="${item.id}" />
			<tr>
				<td width="20%"><input type="text" name="familymembers"
					class="textbox" value="${item.emp_fname}" /></td>
				<td width="15%"><input type="text" name="reltionship"
					class="textbox" value="${item.emp_relationship}" /></td>
				<td width="15%"><input type="text" name="occupation"
					class="textbox" value="${item.emp_foccupation}" /></td>
				<td colspan="2" width="10%"><input type="text" name="age"
					class="textbox" value="${item.emp_fage}" /></td>
			</tr>
			<!-- <tr><td width="20%"><input type="text" name="familymembers1" class="bg_blue" size="25" value="${membername}"/></td><td width="15%"><input type="text" name="reltionship1" class="bg_blue" size="25" value="${relationship}"/></td><td  width="15%"><input type="text" name="occupation1" class="bg_blue" size="25" value="${occupation}"/></td><td colspan="2"  width="10%"><input type="text" name="age1" class="bg_blue" size="25" value="${age}"/></td></tr> -->
		</c:forEach>
	</table>

	<br>
	<table id="languagesknown" align="center" width="80%">


		<tr bgcolor="#ebf9fe">
			<td width="20%"><b>Languages Known</b></td>
			<td width="10%"><b>Speak</b></td>
			<td width="10%"><b>Read</b></td>
			<td width="10%"><b>Write</b></td>
			<td width="10%"><b>Remarks<br>
			(Level)</b></td>
		</tr>

	<c:forEach items="${languagelist}" var="item">
		<input type="hidden" name="languageid" value="${item.id}" />
		<tr>
		<td width="20%"><SELECT name="languagesknown" class="selectbox">
				
				<option value="${item.emp_lang_known}">${item.emp_lang_known}</option>
				<OPTION value="Telugu">Telugu</OPTION>
				<OPTION value="English">English</OPTION>
				<OPTION value="Hindi">Hindi</OPTION>
				<OPTION value="Tamil">Tamil</OPTION>
				<OPTION value="Kannada">Kannada</OPTION>
				<OPTION value="Malayalam">Malayalam</OPTION>
				<OPTION value="Maraati">Maraati</OPTION>
			</SELECT></td>
			
			<!-- <td width="10%"><c:choose><c:when test="${item.emp_lang_speak=='speak'}">
				<input type="checkbox" name="speak" class="bg_blue" value="${item.emp_lang_speak}"
					checked="checked"/></c:when>
					<c:otherwise>
				<input type="checkbox" name="speak" class="bg_blue" value="speak" />
			</c:otherwise></c:choose>
			</td>
			<td width="10%"><c:if test="${item.emp_lang_read=='read'}">
				<input type="checkbox" name="read" class="bg_blue" value="${item.emp_lang_read}"
					checked="checked"/></c:if><c:if test="${item.emp_lang_read=='off'}">
				<input type="checkbox" name="read" class="bg_blue" value="read" />
			</c:if>
			</td>
			<td width="10%"><c:if test="${item.emp_lang_write=='write'}">
				<input type="checkbox" name="write" class="bg_blue" value="${item.emp_lang_write}"
				 checked="checked"/></c:if><c:if test="${item.emp_lang_write=='off'}">

				<input type="checkbox" name="write" class="bg_blue" value="write" />
			</c:if>
			</td> -->
			<td><SELECT name="speak" class="selectbox">
				<option value="${item.emp_lang_speak}">${item.emp_lang_speak}</option>
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				
			</SELECT></td>
			<td><SELECT name="read" class="selectbox">
				<option value="${item.emp_lang_read}">${item.emp_lang_read}</option>
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="write" class="selectbox">
				<option value="${item.emp_lang_write}">${item.emp_lang_write}</option>
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="remarks" class="selectbox">
				<option value="${item.emp_lang_level}">${item.emp_lang_level}</option>
				<option value="none">----select----</option>
				<OPTION value="Excellent">Excellent</OPTION>
				<OPTION value="Intermediate">Intermediate</OPTION>
				<OPTION value="Lower">Lower</OPTION>

			</SELECT></td>
		</tr>
	</c:forEach>	
		<!--<tr>
			<td width="20%"><input type="text" name="languagesknown1"
				class="bg_blue" /></td>
			<td width="10%"><input type="checkbox" name="speak1"
				value="speak" class="bg_blue" /></td>
			<td width="10%"><input type="checkbox" name="read1"
				value="read" class="bg_blue" /></td>
			<td width="10%"><input type="checkbox" name="write1"
				value="write" class="bg_blue" /></td>
			<td><SELECT name="remarks1" class="bg_blue">
				<OPTION value="excellent">Excellent</OPTION>
				<OPTION value="intermediate">Intermediate</OPTION>
				<OPTION value="lower">Lower</OPTION>

			</SELECT></td>
		</tr>-->
		

	</table>
	<br>
	<table id="educational" align="center" width="80%">
		<tr>
			<td colspan="5"><b>Educational Qualifications</b></td>
		</tr>
		<tr bgcolor="#ebf9fe">
			<td width="15%"><b>Examination Passed</b></td>
			<td width="15%"><b>Name of School/<br>
			College/University</b></td>
			<td width="10%"><b>Duration of <br>
			Course</b></td>
			<td width="10%"><b>Year of <br>
			Passing</b></td>
			<td width="10%"><b>class&<br>
			percentage</b></td>
		</tr>

		<c:forEach items="${educationlist}" var="item">
			<input type="hidden" name="educationid" value="${item.id}" />
			<tr>
				<td width="15%"><input type="text" name="examinationpassed"
					class="textbox" value="${item.emp_exam_passed}" /></td>
				<td width="15%"><input type="text" name="nameofschool"
					class="textbox" value="${item.emp_institute}" /></td>
				<td width="10%"><input type="text" name="duration"
					class="textbox" value="${item.emp_duration_course }" /></td>
				<td width="10%"><input type="text" name="yearofpassing"
					class="textbox" value="${item.emp_yearofpass}" /></td>
				<td width="10%"><input type="text" name="percentage"
					class="textbox" value="${item.emp_percentage}" /></td>
			</tr>
		</c:forEach>
		<!-- <tr><td width="15%"><input type="text" name="examinationpassed1" class="bg_blue"/></td><td width="15%"><input type="text" name="nameofschool1" class="bg_blue"/></td><td width="10%"><input type="text" name="duration1" class="bg_blue"/></td><td width="10%"><input type="text" name="yearofpassing1" class="bg_blue"/></td><td width="10%"><input type="text" name="percentage1" class="bg_blue"/></td></tr> -->
	</table>

	<br>
	<table id="companyexperience" width="80%" align="center">
		<tr>
			<td colspan="5"><b>Details of Experience</b></td>
		</tr>
		<tr bgcolor="#ebf9fe">
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
		<c:forEach items="${worklist}" var="item">
			<input type="hidden" name="workid" value="${item.id}" />

			<tr>
				<td width="15%"><textarea name="comapanyaddress"
					class="textbox1">${item.emp_company_name }</textarea></td>
				<td width="9%"><input type="text" name="designation"
					class="textbox" value="${item.emp_designation}" /></td>
				<td width="9%"><input type="text" name="salary" class="textbox"
					value="${item.emp_sal}" /></td>
				<td width="9%"><input type="text" name="fromto" class="textbox"
					value="${item.emp_period}" /></td>
				<td width="18%"><textarea name="reason" class="textbox1">${item.emp_leavejob}</textarea></td>
			</tr>
			<!-- <tr><td width="15%"><textarea name="comapanyaddress1" class="bg_blue"></textarea></td><td width="9%"><input type="text" name="designation1" class="bg_blue"/></td><td width="9%"><input type="text" name="salary1" class="bg_blue"/></td><td width="9%"><input type="text" name="fromto1" class="bg_blue"/></td><td width="18%"><textarea name="reason1" class="bg_blue"></textarea></td></tr> -->
		</c:forEach>
	</table>
	<br>
	<table id="activities" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="5"><b>Extra-curricular Activities(Official positions
			held)</b></td>
		</tr>
		<tr>
			<td width="15%"><b>Type of Activities</b></td>
			<td width="15%"><b>At school</b></td>
			<td width="15%"><b>At college</b></td>
			<td colspan="2" width="15%"><b>Later</b></td>
		</tr>
		<c:forEach items="${activitieslist}" var="item">
			<input type="hidden" name="activityid" value="${item.id}" />
			<tr>
				<td width="15%"><input type="text" name="activities"
					class="textbox" value="${item.activitytype}" /></td>
				<td width="15%"><input type="text" name="atschool"
					class="textbox" value="${item.emp_atschool}" /></td>
				<td width="15%"><input type="text" name="atcollege"
					class="textbox" value="${item.emp_atcollege}" /></td>
				<td colspan="2" width="15%"><input type="text" name="later"
					class="textbox" value="${item.emp_later}" /></td>
			</tr>
			<!--  <tr><td width="15%"><input type="text" name="activities1" class="bg_blue"/></td><td width="15%"><input type="text" name="atschool1" class="bg_blue"/></td><td width="15%"><input type="text" name="atcollege1" class="bg_blue"/></td><td colspan="2" width="15%"><input type="text" name="later1" class="bg_blue"/></td></tr>-->
		</c:forEach>
	</table>
	<br>
	<table id="artofliving" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="5"><b>Connection-"Art of Living"</b><br>
			</td>
		</tr>
		<tr>
			<td width="15%"><b>Course</b></td>
			<td width="10%"><b>Location</b></td>
			<td width="10%"><b>Teacher</b></td>
			<td width="10%"><b>Date</b></td>
			<td width="15%"><b>Remarks</b></td>
		</tr>
		<c:forEach items="${artoflivinglist}" var="item">
			<input type="hidden" name="artoflivingid" value="${item.id}" />
			<tr>
				<td width="15%"><select name="course" class="selectbox" >
				<option value="${item.emp_course}">${item.emp_course}</option>
			<option value="YLTP">YLTP</option>
			<option value="PART-1">PART-1</option>
			<option value="PART-2">PART-2</option>
			<option value="DSN">DSN</option>
			
			</select></td>
				<td width="10%"><input type="text" name="location"
					class="textbox" value="${item.emp_location}" /></td>
				<td width="10%"><input type="text" name="teacher"
					class="textbox" value="${item.emp_teacher}" /></td>
				<td width="10%"><input type="text" name="date" class="textbox"
					value="${item.emp_date}" /></td>
				<td width="15%"><textarea name="artoflivingremarks"
					class="textbox1">${item.emp_remarks}</textarea></td>
			</tr>
			<!-- <tr><td width="15%"><input type="text" name="course1" class="bg_blue"/></td><td width="10%"><input type="text" name="location1" class="bg_blue"/></td><td width="10%"><input type="text" name="teacher1" class="bg_blue"/></td><td width="10%"><input type="text" name="date1" class="bg_blue"/></td><td width="15%"><textarea name="artoflivingremarks1" class="bg_blue"></textarea></td></tr> -->
		</c:forEach>
	</table>

	<br>
	<table width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="10"><b>Recommending teacher details</b><br>
			</td>
		</tr>
		<tr>
			<td><b>Name and Address</b></td>
			<td><b>Teacher Code</b></td>
			<td><b>Mobile No</b></td>
			<td><b>Email Id</b></td>
			<td></td>
		</tr>
		<c:forEach items="${recommendationlist}" var="item">
			<input type="hidden" name="recommendationid" value="${item.id}" />
			<tr>
				<td><textarea name="tname" class="textbox1">${item.emp_name_address}</textarea></td>
				<td><input type="text" name="tcode" class="textbox"
					value="${item.emp_teachercode}" /></td>
				<td><input type="text" name="tmobilenumber" class="textbox"
					value="${item.emp_teacher_mobile}" /></td>
				<td><input type="text" name="temailid" class="textbox"
					value="${item.emp_teacher_email}" /></td>
				<td></td>
			</tr>
		</c:forEach>
		<tr bgcolor="#ebf9fe">
			<td colspan="10"><b>References</b><br>
			</td>
		</tr>
		<tr>
			<td><b>Name</b></td>
			<td><b>Present Address</b></td>
			<td><b>Present Contact No</b></td>
			<td colspan="2"><b>Email Id</b></td>
		</tr>
		<c:forEach items="${referencelist}" var="item">
			<input type="hidden" name="referenceid" value="${item.id}" />
			<tr>
				<td><input type="text" name="rname" class="textbox"
					value="${item.emp_ref_name}" /></td>
				<td><textarea name="raddress" class="textbox1">${item.emp_ref_address}</textarea></td>
				<td ><input type="text" name="pcontactno"
					class="bg_blue" value="${item.emp_ref_mobile}" /></td>
					<td colspan="2"><input type="text" name="remail" class="textbox"
					value="${item.emp_ref_emailid}" /></td>
					
			</tr>
		</c:forEach>
		<!-- <tr>
			<td>2<input type="text" name="rname1" class="bg_blue" /></td>
			<td><textarea name="raddress1" class="bg_blue"></textarea></td>
			<td colspan="3"><input type="text" name="pcontactno1"
				class="bg_blue" /></td>
		</tr> -->
		<!--  <tr>
			<td colspan="5">I hereby certify that,the particulars as
			furnished by in this application form are true, correct and <br>
			complete in all respects.<br>
			I agree and accept without reservation that,at any time of the
			particulars are found to be un-true,<br>
			in-correct or in-complete;my appointment may be terminated without
			prior<br>
			notice<br>
			Date:<input type="text" name="emp_date" id="text1" class="bg_blue"
				value="${empdate}" /><br>
			Place:<input type="text" name="emp_place" class="bg_blue"
				value="${empplace}" /><br>
			Signature of the applicant:</td>
		</tr> -->
		<tr>
			 <td colspan="5"><!-- I hereby certify that,the particulars as
			furnished by in this application form are true, correct and <br>
			complete in all respects.<br>
			I agree and accept without reservation that,at any time of the
			particulars are found to be un-true,<br>
			in-correct or in-complete;my appointment may be terminated without
			prior<br>
			notice --><br>
			<b>Date:</b>&nbsp;<input type="text" name="emp_date" id="text1" class="textbox" value="${empdate}" /><br><br>
			<b>Place:</b><input type="text" name="emp_place" class="textbox" value="${empplace}" /></td>
			<!-- Signature of the applicant:-->
		</tr> 
		<tr>
			<td colspan="5"><br>
			</td>
		</tr>
		<tr bgcolor="#ebf9fe">
			<td colspan="10"><br>
			<b>For office use only:</b><br>
			</td>
		</tr>
		<tr>
			<td><b>Probation/training period:</b></td>
			<td colspan="4"><input type="text" name="probationperiod"
				class="textbox" value="${probation}" /></td>
		</tr>
		<tr>
			<td><b>Department/section to be posted:</b></td>
			<td colspan="4"><input type="text" name="deptpost"
				class="textbox" value="${deptpost}" /></td>
		</tr>
		<tr>
			<td><b>Rank/Designation</b></td>
			<td colspan="4"><input type="text" name="employee_designation"
				class="textbox" value="${designation}" /></td>
				
				<td rowspan="5"><img src="../view/images/${empsidephoto}"  name="ImageFile2" width="115" height="128"/></td>
				<td rowspan="5"><img src="../view/images/${empthumbphoto}" name="ImageFile3" width="115" height="128"/></td>
				
				
			
				
		</tr>
		<tr>
			<td><b>Salary</b></td>
			<td colspan="4"><input type="text" name="employee_salary"
				class="textbox" value="${empsalary}" /></td>
		</tr>
		<tr>
			<td><b>Expected Date of Joining:</b></td>
			<td colspan="4"><input type="text" name="joiningdate" id="text2"
				class="textbox" value="${expecteddate}" /></td>
		</tr>
		<tr>
			
		</tr>
		<tr>
			<td>
			<b>Joined On:</b>
			</td>
			<td colspan="4"><input type="text" name="joineddate" id="text3"
				class="textbox" value="${joinedon}" /></td>
		</tr>
		<tr>
			<td>
			<b>Re-Joined Date:</b>
			</td>
			<td colspan="4"><input type="text" name="emp_rejoined_date" id="text4"
				class="textbox" value="${rejoineddate}"/></td>
		</tr>
		
		<tr>
			<td>
			<b>Head-Training&Development,Ashram<br>
			security:</b><br>
			</td>
			<td colspan="4"><textarea name="training" class="textbox1">${training}</textarea></td>
		</tr>
		<tr>
			<td><b>Employee Status:</b></td>
			<td colspan="4"><SELECT name="empstatus" class="selectbox">
				<option value="${empstatus}">${empstatus}</option>
				<option value="none">----select----</option>
				<OPTION value="Working">Working</OPTION>
				<OPTION value="On-Leave">On-Leave</OPTION>
				<OPTION value="On Long-leave">On Long-leave</OPTION>
				<OPTION value="Absent without intimation">Absent without intimation</OPTION>
				<OPTION value="Left">Left</OPTION>
				<OPTION value="Suspended">Suspended</OPTION>
				

			</SELECT></td>
		</tr>
		<br>
		<tr>
			<td><b>Head of Ashram Security Department</b></td>
			
			<td >
			<b>Employee Signature</b></td>
			<td>
			<b>Security Incharge Signature</b>
			</td>
		</tr>
		<tr>
			<td colspan="5" align="center"><input type="submit"
				id="btnSubmit" value="insert" size="30" style="height:25px; width:75px"
				onclick="return Validate(this.phone_no.value)" /></td>
		</tr>

	</table>
</form:form>

</body>

</html>