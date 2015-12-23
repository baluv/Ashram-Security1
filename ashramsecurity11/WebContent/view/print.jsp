<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<style type="text/css">
#h1 {
	height: 50px;
}

.font {
	size: 16px;
	color: red;
}
</style>

<script>
function readURL(input) {
if (input.files && input.files[0]) {
var reader = new FileReader();

reader.onload = function (e) {
$('#img_prev')
.attr('src', e.target.result)
.width(130)
.height(180);
};

reader.readAsDataURL(input.files[0]);
}
}
</script>

</head>

<body style="font-size: 14px">


<div id="h1"></div>

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
			<th colspan="5">EMPLOYEE RECRUITMENT FORM</th>
		</tr><br>
		
	
		<tr bgcolor="#ebf9fe">
			<th colspan="5" align="left">Personal</th>
		</tr>
		<tr>
			<td><label for="username" class="block">Name in Full
			</label></td>
			<td colspan="2"><input type="text" name="empname"
				class="bg_blue" size="35" value="${empname}" /></td>
			<td rowspan="5"><img src="../view/images/${empimage}"  width="115" height="128"/></td>
		</tr>
		
				
		<tr>
			<td>DateOfBirth/Age</td>
			<td colspan="2"><input type="text" name="empdob" id="text"
				class="bg_blue" size="35" value="${dob}" /></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td colspan="2"><c:if test="${gender=='male'}">
				<input type="radio" name="empgender" value="male" checked="checked">male<input
					type="radio" name="empgender" value="female" />female</c:if> <c:if
				test="${gender=='female'}">
				<input type="radio" name="empgender" value="male">male<input
					type="radio" name="empgender" value="female" checked="checked" />female</c:if>
			</td>
		</tr>
		<tr>
			<td>Father's/Guardian's Name</td>
			<td colspan="2"><input type="text" name="empfname"
				class="bg_blue" size="35" value="${fname}" /></td>
		</tr>
		<tr>
			<td>Father's/Guardian's Profession and address</td>
			<td colspan="2"><textarea name="empfproffession" class="bg_blue"><c:out
				value="${faddress}" /></textarea></td>
		</tr>
		<tr>
			<td>Father's/Guardian's Contact no</td>
			<td colspan="2"><input type="text" name="fcontactno"
				class="bg_blue" size="35" value="${fcontact}" /></td>
			<!--<td> <input type="file" name="emp_photo" id="file"/><input type="submit" value="upload"/></td> -->
		</tr>
		
		<tr>
			<td>Hight</td>
			<td colspan="2"><input type="text" name="emphight"
				class="textbox" value="${emphight}" /></td>
			
		</tr>
		
		<tr>
			<td>Weight</td>
			<td colspan="2"><input type="text" name="empweight"
				class="textbox" value="${empweight}" /></td>
			
		</tr>
		
		<tr>
			<td>Roll No</td>
			<td colspan="2"><input type="text" name="rollno"
				class="bg_blue" size="35" value="${rollno}" /></td>
			
		</tr>

		<tr>
			<td>Current Address</td>
			<td colspan="4">Permanent Address</td>
		</tr>
		<tr>
			<td><textarea name="emp_currentaddress" class="bg_blue"><c:out
				value="${currentaddress}" /></textarea></td>
			<td colspan="4"><textarea name="emp_permanentaddress"
				class="bg_blue"><c:out value="${permanentaddress}" /></textarea></td>
		</tr>

		<tr>
			<td>MobileNumber&nbsp;&nbsp;&nbsp;<input type="text"
				name="emp_mobileno" class="bg_blue" id="phone_no" size="25"
				value="${mobilenumber}" /></td>
			<td colspan="4">MobileNumber:&nbsp;&nbsp;&nbsp;<input
				type="text" name="emp_alternatemobileno" class="bg_blue"
				id="phone_no1" size="25" value="${alternatemobile}" /></td>
		</tr>
		<tr >
			<td colspan="5">Contact email-id<input type="text"
				name="emp_email" id="txtEmail" class="bg_blue" size="25"
				value="${email}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact
			email-id&nbsp;<input type="text" name="emp_email" id="txtEmail1"
				class="bg_blue" size="25" /></td>
		</tr>

		<tr>
			<td>Marital Status</td>
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
			<td width="20%" class="ex">Details of Family members including<br>
			dependents(Names)</td>
			<td width="15%" class="ex">Relationship</td>
			<td width="15%" class="ex">Occupation</td>
			<td colspan="2" width="10%" class="ex">Age</td>
		</tr>
		<c:forEach items="${list}" var="item">
			<input type="hidden" name="familyid" value="${item.id}" />
			<tr>
				<td width="20%"><input type="text" name="familymembers"
					class="bg_blue" size="25" value="${item.emp_fname}" /></td>
				<td width="15%"><input type="text" name="reltionship"
					class="bg_blue" size="25" value="${item.emp_relationship}" /></td>
				<td width="15%"><input type="text" name="occupation"
					class="bg_blue" size="25" value="${item.emp_foccupation}" /></td>
				<td colspan="2" width="10%"><input type="text" name="age"
					class="bg_blue" size="25" value="${item.emp_fage}" /></td>
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
			(Level)</b>&nbsp;&nbsp;</td>
		</tr>

	<c:forEach items="${languagelist}" var="item">
		<input type="hidden" name="languageid" value="${item.id}" />
		<tr>
		<td width="20%"><SELECT name="languagesknown" class="bg_blue">
				
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
			<td><SELECT name="speak" class="bg_blue">
				<option value="${item.emp_lang_speak}">${item.emp_lang_speak}</option>
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				
			</SELECT></td>
			<td><SELECT name="read" class="bg_blue">
				<option value="${item.emp_lang_read}">${item.emp_lang_read}</option>
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="write" class="bg_blue">
				<option value="${item.emp_lang_write}">${item.emp_lang_write}</option>
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="remarks" class="bg_blue">
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
		<tr  bgcolor="#ebf9fe">
			<td colspan="5"><b>Educational Qualifications</b></td>
		</tr>
		<tr>
			<td width="15%">Examination Passed</td>
			<td width="15%">Name of School/<br>
			College/University</td>
			<td width="10%">Duration of <br>
			Course</td>
			<td width="10%">Year of <br>
			Passing</td>
			<td width="10%">class&<br>
			percentage</td>
		</tr>

		<c:forEach items="${educationlist}" var="item">
			<input type="hidden" name="educationid" value="${item.id}" />
			<tr>
				<td width="15%"><input type="text" name="examinationpassed"
					class="bg_blue" value="${item.emp_exam_passed}" /></td>
				<td width="15%"><input type="text" name="nameofschool"
					class="bg_blue" value="${item.emp_institute}" /></td>
				<td width="10%"><input type="text" name="duration"
					class="bg_blue" value="${item.emp_duration_course }" /></td>
				<td width="10%"><input type="text" name="yearofpassing"
					class="bg_blue" value="${item.emp_yearofpass}" /></td>
				<td width="10%"><input type="text" name="percentage"
					class="bg_blue" value="${item.emp_percentage}" /></td>
			</tr>
		</c:forEach>
		<!-- <tr><td width="15%"><input type="text" name="examinationpassed1" class="bg_blue"/></td><td width="15%"><input type="text" name="nameofschool1" class="bg_blue"/></td><td width="10%"><input type="text" name="duration1" class="bg_blue"/></td><td width="10%"><input type="text" name="yearofpassing1" class="bg_blue"/></td><td width="10%"><input type="text" name="percentage1" class="bg_blue"/></td></tr> -->
	</table>

	<br>
	<table id="companyexperience" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="5"><b>Details of Experience</b></td>
		</tr>
		<tr >
			<td width="15%">Company name&Address</td>
			<td width="10%">Designation</td>
			<td width="10%">Salary per<br>
			month</td>
			<td width="10%">Period of<br>
			employrment<br>
			From-To</td>
			<td width="15%">Reason for<br>
			leaving<br>
			the job</td>
		</tr>
		<c:forEach items="${worklist}" var="item">
			<input type="hidden" name="workid" value="${item.id}" />

			<tr>
				<td width="15%"><textarea name="comapanyaddress"
					class="bg_blue">${item.emp_company_name }</textarea></td>
				<td width="9%"><input type="text" name="designation"
					class="bg_blue" value="${item.emp_designation}" /></td>
				<td width="9%"><input type="text" name="salary" class="bg_blue"
					value="${item.emp_sal}" /></td>
				<td width="9%"><input type="text" name="fromto" class="bg_blue"
					value="${item.emp_period}" /></td>
				<td width="18%"><textarea name="reason" class="bg_blue">${item.emp_leavejob}</textarea></td>
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
			<td width="15%">Type of Activities</td>
			<td width="15%">At school</td>
			<td width="15%">At college</td>
			<td colspan="2" width="15%">Later</td>
		</tr>
		<c:forEach items="${activitieslist}" var="item">
			<input type="hidden" name="activityid" value="${item.id}" />
			<tr>
				<td width="15%"><input type="text" name="activities"
					class="bg_blue" value="${item.activitytype}" /></td>
				<td width="15%"><input type="text" name="atschool"
					class="bg_blue" value="${item.emp_atschool}" /></td>
				<td width="15%"><input type="text" name="atcollege"
					class="bg_blue" value="${item.emp_atcollege}" /></td>
				<td colspan="2" width="15%"><input type="text" name="later"
					class="bg_blue" value="${item.emp_later}" /></td>
			</tr>
			<!--  <tr><td width="15%"><input type="text" name="activities1" class="bg_blue"/></td><td width="15%"><input type="text" name="atschool1" class="bg_blue"/></td><td width="15%"><input type="text" name="atcollege1" class="bg_blue"/></td><td colspan="2" width="15%"><input type="text" name="later1" class="bg_blue"/></td></tr>-->
		</c:forEach>
	</table>
	<br>
	<table id="artofliving" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="5"><b>Connection-"Art of Living"</b>
			</td>
		</tr>
		<tr>
			<td width="15%">Course</td>
			<td width="10%">Location</td>
			<td width="10%">Teacher</td>
			<td width="10%">Date</td>
			<td width="15%">Remarks</td>
		</tr>
		<c:forEach items="${artoflivinglist}" var="item">
			<input type="hidden" name="artoflivingid" value="${item.id}" />
			<tr>
				<td width="15%"><select name="course" >
				<option value="${item.emp_course}">${item.emp_course}</option>
			<option value="YLTP">YLTP</option>
			<option value="PART-1">PART-1</option>
			<option value="PART-2">PART-2</option>
			<option value="DSN">DSN</option>
			
			</select></td>
				<td width="10%"><input type="text" name="location"
					class="bg_blue" value="${item.emp_location}" /></td>
				<td width="10%"><input type="text" name="teacher"
					class="bg_blue" value="${item.emp_teacher}" /></td>
				<td width="10%"><input type="text" name="date" class="bg_blue"
					value="${item.emp_date}" /></td>
				<td width="15%"><textarea name="artoflivingremarks"
					class="bg_blue">${item.emp_remarks}</textarea></td>
			</tr>
			<!-- <tr><td width="15%"><input type="text" name="course1" class="bg_blue"/></td><td width="10%"><input type="text" name="location1" class="bg_blue"/></td><td width="10%"><input type="text" name="teacher1" class="bg_blue"/></td><td width="10%"><input type="text" name="date1" class="bg_blue"/></td><td width="15%"><textarea name="artoflivingremarks1" class="bg_blue"></textarea></td></tr> -->
		</c:forEach>
	</table>

	<br>
	<table width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="5"><b>Recommending teacher details</b>
			</td>
		</tr>
		<tr>
			<td>Name and Address</td>
			<td>Teacher Code</td>
			<td>Mobile No</td>
			<td>Email Id</td>
			<td></td>
		</tr>
		<c:forEach items="${recommendationlist}" var="item">
			<input type="hidden" name="recommendationid" value="${item.id}" />
			<tr>
				<td><textarea name="tname" class="bg_blue">${item.emp_name_address}</textarea></td>
				<td><input type="text" name="tcode" class="bg_blue"
					value="${item.emp_teachercode}" /></td>
				<td><input type="text" name="tmobilenumber" class="bg_blue"
					value="${item.emp_teacher_mobile}" /></td>
				<td><input type="text" name="temailid" class="bg_blue"
					value="${item.emp_teacher_email}" /></td>
				<td></td>
			</tr>
		</c:forEach>
		<tr bgcolor="#ebf9fe">
			<td colspan="5"><b>References</b>
			</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>Present Address</td>
			<td>Present Contact No.</td>
			<td colspan="2">Email Id</td>
		</tr>
		<c:forEach items="${referencelist}" var="item">
			<input type="hidden" name="referenceid" value="${item.id}" />
			<tr>
				<td><input type="text" name="rname" class="bg_blue"
					value="${item.emp_ref_name}" /></td>
				<td><textarea name="raddress" class="bg_blue">${item.emp_ref_address}</textarea></td>
				<td ><input type="text" name="pcontactno"
					class="bg_blue" value="${item.emp_ref_mobile}" /></td>
					<td colspan="2"><input type="text" name="remail" class="bg_blue"
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
			Date:&nbsp;<input type="text" name="emp_date" id="text1" class="bg_blue" value="${empdate}" /><br><br>
			Place:<input type="text" name="emp_place" class="bg_blue" value="${empplace}" /></td>
			<!-- Signature of the applicant:-->
		</tr> 
		<tr>
			<td colspan="5"><br>
			</td>
		</tr>
		<tr bgcolor="#ebf9fe">
			<td colspan="5">
			<b>For office use only:</b>
			</td>
		</tr>
		<tr>
			<td>Probation/training period</td>
			<td colspan="4"><input type="text" name="probationperiod"
				class="bg_blue" value="${probation}" /></td>
		</tr>
		<tr>
			<td>Department/section to be posted</td>
			<td colspan="4"><input type="text" name="deptpost"
				class="bg_blue" value="${deptpost}" /></td>
		</tr>
		<tr>
			<td>Rank/Designation</td>
			<td colspan="4"><input type="text" name="employee_designation"
				class="bg_blue" value="${designation}" /></td>
				
				<td rowspan="5"><img src="../view/images/${empsidephoto}"  width="115" height="128"/></td>
				<td rowspan="5"><img src="../view/images/${empthumbphoto}"  width="115" height="128"/></td>
		</tr>
		<tr>
			<td>Salary</td>
			<td colspan="4"><input type="text" name="employee_salary"
				class="bg_blue" value="${empsalary}" /></td>
		</tr>
		<tr>
			<td>Expected Date of Joining</td>
			<td colspan="4"><input type="text" name="joiningdate" id="text2"
				class="bg_blue" value="${expecteddate}" /></td>
		</tr>
		
		<tr>
			<td><br>
			Joined On<br>
			</td>
			<td colspan="4"><input type="text" name="joineddate" id="text3"
				class="bg_blue" value="${joinedon}" /></td>
		</tr>
		<tr>
			<td><br>
			Re-Joined Date<br>
			</td>
			<td colspan="4"><input type="text" name="emp_rejoined_date" id="text4"
				class="bg_blue" value="${rejoineddate}"/></td>
		</tr>
		
		<tr>
			<td>
			Head-Training&Development,Ashram
			security
			</td>
			<td colspan="4"><textarea name="training" class="bg_blue">${training}</textarea></td>
		</tr>
		<tr>
			<td>Employee Status</td>
			<td colspan="4"><SELECT name="empstatus" class="bg_blue">
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
		<tr>
			<td><b>Head of Ashram Security Department</b></td>
			<td>
			<b>Security Incharge Signature</b>
			</td>
			<td >
			<b>Employee Signature</b></td>
			
		</tr>
		
		<!-- <tr>
			<td colspan="5" align="center"><input type="submit"
				id="btnSubmit" value="insert" size="30" style="height:25px; width:100px"
				onclick="return Validate(this.phone_no.value)" /></td>
		</tr> -->

	</table>
</form:form>

</body>

</html>