<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="dataoperator_home.jsp"%>
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

<!--<link rel="stylesheet" href="../validations/style.css" type="text/css"
	media="screen" />-->

<script type="text/javascript" src="../validations/validate.js"
	charset="utf-8"></script>
	<link href="../css/main.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">

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
	height: 20px;
}

.font {
	size: 30px;
	color: red;
}
</style>
</head>

<body style="font-size: 16px">

<div id="h1"></div>

<c:url var="saveEmployee" value="/security/savedataoperatorEmployee.html" />
<form:form action="${saveEmployee}" method="post" commandName="sform"
	enctype="multipart/form-data"
	onsubmit="return emailCheck(this.txtEmail.value);">
	<!--<form name="sform" onSubmit="return emailCheck(this.txtEmail.value);">-->
	<table align="center" width="80%" border="0">
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
			<th colspan="5" align="left">Personal</th>
		</tr>
		<tr>
			<td><label for="username" class="block">Name in full(in
			BLOCK letters):</label></td>
			<td colspan="2"><input type="text" name="empname"
				class="bg_blue" size="35" /></td>
			<td rowspan="5"></td>
		</tr>
		<tr>
			<td>DateOfBirth/Age:</td>
			<td colspan="2"><input type="text" name="empdob" id="text"
				class="bg_blue" size="35" /></td>
		</tr>
		<tr>
			<td>Gender:</td>
			<td colspan="2"><input type="radio" name="empgender"
				value="male">Male<input type="radio" name="empgender"
				value="female" />Female</td>
		</tr>
		<tr>
			<td>Father's/Guardian's Name:</td>
			<td colspan="2"><input type="text" name="empfname"
				class="bg_blue" size="35" /></td>
		</tr>
		<tr>
			<td>Father's/Guardian's Profession and address</td>
			<td colspan="2"><textarea name="empfproffession" class="bg_blue"></textarea></td>
		</tr>
		<tr>
			<td>Father's/Guardian's Contact no:</td>
			<td colspan="2"><input type="text" name="fcontactno"
				class="bg_blue" size="35" /></td>
			<!--<td> <input type="file" name="emp_photo" id="file"/><input type="submit" value="upload"/></td> -->
		</tr>

		<tr>
			<td>Current Address:</td>
			<td colspan="4">Permanent Address:</td>
		</tr>
		<tr>
			<td><textarea name="emp_currentaddress" class="bg_blue"></textarea></td>
			<td colspan="4"><textarea name="emp_permanentaddress"
				class="bg_blue"></textarea></td>
		</tr>

		<tr>
			<td>MobileNumber:&nbsp;&nbsp;&nbsp;<input type="text"
				name="emp_mobileno" class="bg_blue" id="phone_no" size="25" /></td>
			<td colspan="4">MobileNumber:&nbsp;&nbsp;&nbsp;<input
				type="text" name="emp_alternatemobileno" class="bg_blue"
				id="phone_no1" size="25" /></td>
		</tr>
		<tr>
			<td colspan="5">Contact email-id:<input type="text"
				name="emp_email" id="txtEmail" class="bg_blue" size="25" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Contact email-id:&nbsp;<input type="text" name="emp_email"
				id="txtEmail1" class="bg_blue" size="25" /></td>
		</tr>

		<tr>
			<td>Marital Status:</td>
			<td colspan="4"><input type="radio" name="emp_maritalstatus"
				class="bg_blue" onclick="javascript:radioWithText('two')"
				styleId="qwe" value="single">Single<input type="radio"
				name="emp_maritalstatus" class="bg_blue"
				onclick="javascript:radioWithText('one')" value="married">Married</td>
		</tr>
	</table>
	<div id="one" style="display: none;">
	<table width="60%" align="center">
		<tr>
			<td>if married,no of children:</td>
			<td><input type="text" name="emp_noofchildrens" class="bg_blue"
				size="25" /></td>
		<tr>
			<td>Son(no's)</td>
			<td><input type="text" name="emp_noofsons" size="25"
				class="bg_blue" /></td>
			<td colspan="3">Age:<input type="text" name="emp_sonage"
				class="bg_blue" size="25" /></td>
		</tr>
		<tr>
			<td>Daughter(no's)</td>
			<td><input type="text" name="emp_noofdaughters" class="bg_blue"
				size="25" /></td>
			<td>Age:<input type="text" name="emp_daughterage"
				class="bg_blue" size="25" /></td>
		</tr>
	</table>
	</div>
	<br>
	<div id="two" style="display: none;"></div>
	<table id="familyrelations" align="center" width="80%">
		<tr bgcolor="#ebf9fe">
			<td width="20%" class="ex">Details of Family members including<br>
			dependents(Names)</td>
			<td width="15%" class="ex">Relationship</td>
			<td width="15%" class="ex">Occupation</td>
			<td colspan="2" width="10%" class="ex">Age</td>
		</tr>
		<tr>
			<td width="20%"><input type="text" name="familymembers"
				class="bg_blue" size="25" /></td>
			<td width="15%"><input type="text" name="reltionship"
				class="bg_blue" size="25" /></td>
			<td width="15%"><input type="text" name="occupation"
				class="bg_blue" size="25" /></td>
			<td colspan="2" width="10%"><input type="text" name="age"
				class="bg_blue" size="25" /></td>
		</tr>
		<tr>
			<td width="20%"><input type="text" name="familymembers1"
				class="bg_blue" size="25" /></td>
			<td width="15%"><input type="text" name="reltionship1"
				class="bg_blue" size="25" /></td>
			<td width="15%"><input type="text" name="occupation1"
				class="bg_blue" size="25" /></td>
			<td colspan="2" width="10%"><input type="text" name="age1"
				class="bg_blue" size="25" /></td>
		</tr>
	</table>

	<br>
	<table id="languagesknown" align="center" width="80%">


		<tr bgcolor="#ebf9fe">
			<td width="20%">Languages Known:</td>
			<td width="10%">Speak</td>
			<td width="10%">Read</td>
			<td width="10%">Write</td>
			<td width="10%">Remarks<br>
			(Level)&nbsp;&nbsp;</td>
		</tr>


		<tr>
			
				<td width="20%"><SELECT name="languagesknown" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Telugu">Telugu</OPTION>
				<OPTION value="English">English</OPTION>
				<OPTION value="Hindi">Hindi</OPTION>
				<OPTION value="Tamil">Tamil</OPTION>
				<OPTION value="Kannada">Kannada</OPTION>
				<OPTION value="Malayalam">Malayalam</OPTION>
				<OPTION value="Maraati">Maraati</OPTION>
			</SELECT></td>
			<td><SELECT name="speak" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				
			</SELECT></td>
			<td><SELECT name="read" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="write" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="remarks" class="bg_blue">
			<option value="none">----select----</option>
				<OPTION value="excellent">Excellent</OPTION>
				<OPTION value="intermediate">Intermediate</OPTION>
				<OPTION value="lower">Lower</OPTION>

			</SELECT></td>
		</tr>
		<tr>
			<td width="20%"><SELECT name="languagesknown1" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Telugu">Telugu</OPTION>
				<OPTION value="English">English</OPTION>
				<OPTION value="Hindi">Hindi</OPTION>
				<OPTION value="Tamil">Tamil</OPTION>
				<OPTION value="Kannada">Kannada</OPTION>
				<OPTION value="Malayalam">Malayalam</OPTION>
				<OPTION value="Maraati">Maraati</OPTION>
			</SELECT></td>
			
			<td><SELECT name="speak1" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				
			</SELECT></td>
			<td><SELECT name="read1" class="bg_blue">
	
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="write1" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="remarks1" class="bg_blue">
			<option value="none">----select----</option>
				<OPTION value="excellent">Excellent</OPTION>
				<OPTION value="intermediate">Intermediate</OPTION>
				<OPTION value="lower">Lower</OPTION>

			</SELECT></td>
		</tr>
<tr>
			
				<td width="20%"><SELECT name="languagesknown2" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Telugu">Telugu</OPTION>
				<OPTION value="English">English</OPTION>
				<OPTION value="Hindi">Hindi</OPTION>
				<OPTION value="Tamil">Tamil</OPTION>
				<OPTION value="Kannada">Kannada</OPTION>
				<OPTION value="Malayalam">Malayalam</OPTION>
				<OPTION value="Maraati">Maraati</OPTION>
			</SELECT></td>
			<td><SELECT name="speak2" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				
			</SELECT></td>
			<td><SELECT name="read2" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="write2" class="bg_blue">
				
				<option value="none">----select----</option>
				<OPTION value="Yes">Yes</OPTION>
				<OPTION value="No">No</OPTION>
				

			</SELECT></td>
			<td><SELECT name="remarks2" class="bg_blue">
			<option value="none">----select----</option>
				<OPTION value="excellent">Excellent</OPTION>
				<OPTION value="intermediate">Intermediate</OPTION>
				<OPTION value="lower">Lower</OPTION>

			</SELECT></td>
		</tr>

	</table>
	<br>
	<table id="#ebf9fe" align="center" width="80%">
		<tr>
			<td colspan="5">Educational Qualifications:</td>
		</tr>
		<tr bgcolor="#ebf9fe">
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
		<tr>
			<td width="15%"><input type="text" name="examinationpassed"
				class="bg_blue" /></td>
			<td width="15%"><input type="text" name="nameofschool"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="duration"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="yearofpassing"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="percentage"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td width="15%"><input type="text" name="examinationpassed1"
				class="bg_blue" /></td>
			<td width="15%"><input type="text" name="nameofschool1"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="duration1"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="yearofpassing1"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="percentage1"
				class="bg_blue" /></td>
		</tr>
	</table>

	<br>
	<table id="companyexperience" width="80%" align="center">
		<tr>
			<td colspan="5">Details of Experience</td>
		</tr>
		<tr bgcolor="#ebf9fe">
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
		<tr>
			<td width="15%"><textarea name="comapanyaddress" class="bg_blue"></textarea></td>
			<td width="9%"><input type="text" name="designation"
				class="bg_blue" /></td>
			<td width="9%"><input type="text" name="salary" class="bg_blue" /></td>
			<td width="9%"><input type="text" name="fromto" class="bg_blue" /></td>
			<td width="18%"><textarea name="reason" class="bg_blue"></textarea></td>
		</tr>
		<tr>
			<td width="15%"><textarea name="comapanyaddress1"
				class="bg_blue"></textarea></td>
			<td width="9%"><input type="text" name="designation1"
				class="bg_blue" /></td>
			<td width="9%"><input type="text" name="salary1" class="bg_blue" /></td>
			<td width="9%"><input type="text" name="fromto1" class="bg_blue" /></td>
			<td width="18%"><textarea name="reason1" class="bg_blue"></textarea></td>
		</tr>
	</table>
	<br>
	<table id="activities" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="5">Extra-curricular Activities(Official positions
			held)</td>
		</tr>
		<tr>
			<td width="15%">Type of Activities</td>
			<td width="15%">At school</td>
			<td width="15%">At college</td>
			<td colspan="2" width="15%">Later</td>
		</tr>
		<tr>
			<td width="15%"><input type="text" name="activities"
				class="bg_blue" /></td>
			<td width="15%"><input type="text" name="atschool"
				class="bg_blue" /></td>
			<td width="15%"><input type="text" name="atcollege"
				class="bg_blue" /></td>
			<td colspan="2" width="15%"><input type="text" name="later"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td width="15%"><input type="text" name="activities1"
				class="bg_blue" /></td>
			<td width="15%"><input type="text" name="atschool1"
				class="bg_blue" /></td>
			<td width="15%"><input type="text" name="atcollege1"
				class="bg_blue" /></td>
			<td colspan="2" width="15%"><input type="text" name="later1"
				class="bg_blue" /></td>
		</tr>

	</table>
	<br>
	<table id="artofliving" width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="5">Connection-"Art of Living"<br>
			</td>
		</tr>
		<tr>
			<td width="15%">Course</td>
			<td width="10%">Location</td>
			<td width="10%">Teacher</td>
			<td width="10%">Date</td>
			<td width="15%">Remarks</td>
		</tr>
		<tr>
			<td width="15%"><select name="course" >
			<option value="none">----select----</option>
			<option value="YLTP">YLTP<option>
			<option value="PART-1">PART-1</option>
			<option value="PART-2">PART-2</option>
			<option value="DSN">DSN</option>
			
			</select></td>
			<td width="10%"><input type="text" name="location"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="teacher"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="date" class="bg_blue" /></td>
			<td width="15%"><textarea name="artoflivingremarks"
				class="bg_blue"></textarea></td>
		</tr>
		<tr>
			<td width="15%"><select name="course1" >
			<option value="none">----select----</option>
			<option value="YLTP">YLTP</option>
			<option value="PART-1">PART-1</option>
			<option value="PART-2">PART-2</option>
			<option value="DSN">DSN</option>
			
			</select></td>
			<td width="10%"><input type="text" name="location1"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="teacher1"
				class="bg_blue" /></td>
			<td width="10%"><input type="text" name="date1" class="bg_blue" /></td>
			<td width="15%"><textarea name="artoflivingremarks1"
				class="bg_blue"></textarea></td>
		</tr>
	</table>

	<br>
	<table width="80%" align="center">
		<tr bgcolor="#ebf9fe">
			<td colspan="5">Recommending teacher details<br>
			</td>
		</tr>
		<tr>
			<td>Name and Address</td>
			<td>Teacher Code</td>
			<td>Mobile No</td>
			<td>Email Id</td>
			<td></td>
		</tr>
		<tr>
			<td><textarea name="tname" class="bg_blue"></textarea></td>
			<td><input type="text" name="tcode" class="bg_blue" /></td>
			<td><input type="text" name="tmobilenumber" class="bg_blue" /></td>
			<td><input type="text" name="temailid" class="bg_blue" /></td>
			<td></td>
		</tr>
		<tr bgcolor="#ebf9fe">
			<td colspan="5">References<br>
			</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>Present Address</td>
			<td >Present Contact No.</td>
			<td colspan="2">Email Id</td>
		</tr>
		<tr>
			<td>1<input type="text" name="rname" class="bg_blue" /></td>
			<td><textarea name="raddress" class="bg_blue"></textarea></td>
			<td ><input type="text" name="pcontactno"
				class="bg_blue" /></td>
				<td colspan="2"><input type="text" name="refemailid" class="bg_blue"/></td>
		</tr>
		<tr>
			<td>2<input type="text" name="rname1" class="bg_blue" /></td>
			<td><textarea name="raddress1" class="bg_blue"></textarea></td>
			<td ><input type="text" name="pcontactno1"
				class="bg_blue" /></td>
				<td colspan="2"><input type="text" name="refemailid1" class="bg_blue"/></td>
				
		</tr>
	  	<tr>
			 <td colspan="5"><!-- I hereby certify that,the particulars as
			furnished by in this application form are true, correct and <br>
			complete in all respects.<br>
			I agree and accept without reservation that,at any time of the
			particulars are found to be un-true,<br>
			in-correct or in-complete;my appointment may be terminated without
			prior<br>
			notice --><br>
			Date:&nbsp;&nbsp;<input type="text" name="emp_date" id="text1" class="bg_blue"/><br><br>
			Place:&nbsp;<input type="text" name="emp_place" class="bg_blue" /></td>
			<!-- Signature of the applicant:-->
		</tr> 
		<tr>
			<td colspan="5"><br>
			</td>
		</tr>
		<tr bgcolor="#ebf9fe">
			<td colspan="5"><br>
			For office use only:<br>
			</td>
		</tr>
		<tr>
			<td>Probation/training period:</td>
			<td colspan="4"><input type="text" name="probationperiod"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td>Department/section to be posted:</td>
			<td colspan="4"><input type="text" name="deptpost"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td>Designation offered:</td>
			<td colspan="4"><input type="text" name="designation"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td>Expected Date of Joining:</td>
			<td colspan="4"><input type="text" name="joiningdate" id="text2"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td colspan="5"><br>
			Signatures</td>
		</tr>
		<tr>
			<td><br>
			Joined On:<br>
			</td>
			<td colspan="4"><input type="text" name="joineddate" id="text3"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td><br>
			Re-Joined Date:<br>
			</td>
			<td colspan="4"><input type="text" name="emp_rejoined_date" id="text4"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td><br>
			Security Incharge:<br>
			</td>
			<td colspan="4"><input type="text" name="officesupervisor"
				class="bg_blue" /></td>
		</tr>
		<tr>
			<td><br>
			Head-Training&Development,Ashram<br>
			security:<br>
			</td>
			<td colspan="4"><textarea name="security" class="bg_blue"></textarea></td>
		</tr>
		<tr>
			<td>Head-Ashram Security Department:</td>
			<td colspan="4"><textarea name="sdepartment" class="bg_blue"></textarea></td>
		</tr>
		<tr>
			<td colspan="5" align="center"><input type="submit"
				id="btnSubmit" value="submit" size="30"
				onclick="return Validate(this.phone_no.value)" /></td>
		</tr>

	</table>
</form:form>

</body>

</html>