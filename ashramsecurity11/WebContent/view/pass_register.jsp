<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="include.jsp"%>
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
<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 var numbers = /^[0-9]+$/;
 
    if ( document.passregister.type_of_wheeler.value=="none")
	 	
	{
	  alert( "please provide Type of Wheeler!" );
	  document.passregister.type_of_wheeler.focus();
	  return false;
	}
 
    if ( document.passregister.type_of_passes.value=="none")
	 	
	{
	  alert( "please provide Type of Passes!" );
	  document.passregister.type_of_passes.focus();
	  return false;
	}
 
 	if ( document.passregister.pass_no.value=="")
 	
 	{
 	  alert( "please provide ur pass number!" );
 	  document.passregister.pass_no.focus();
 	  return false;
 	}
 	
   if ( document.passregister.name.value == "" )
   {
     alert( "Please provide your name!" );
     document.passregister.name.focus() ;
     return false;
   }
    if( document.passregister.mobile_no.value == "")
   {
     alert( "Please provide your Mobile Number !" );
     document.passregister.mobile_no.focus() ;
     return false;
   }
   
    if( document.passregister.expire_date.value == "" )
   {
     alert( "Please provide your pass Expire date!" );
     document.passregister.expire_date.focus() ;
     return false;
   }
    if(!document.passregister.mobile_no.value.match(numbers))
    {
      alert( "Please provide your Mobile Number with numeric values !" );
      document.passregister.mobile_no.focus() ;
      return false;
    }
    
    if ( document.passregister.email_id.value=="")
     	
 	{
 	alert( "please provide Email Id!" );
 	document.passregister.email_id.focus();
 	return false;
 	}
    
if ( document.passregister.email_id.value=="")
     	
 	{
 	alert( "please provide Enter Proper Email Id!" );
 	document.passregister.email_id.focus();
 	return false;
 	}
    
    return( true );
}
  </script>
</head>

<body>

<script>
 // Countries
var country_arr = new Array("2-Wheeler", "4-wheeler");

// States
var s_a = new Array();
s_a[0] = "";
s_a[1] = "Ashram Owned Vehicles|Resident Pass|Non Resident Pass";
s_a[2] = "All Access|Transport Vehicles|Trustee Vehicles|Resident Pass|Non Resident Pass|Half Yearly Pass|Quarterly Pass|Monthly Pass|Temporary Pass";



function populateStates(countryElementId, stateElementId) {

    var selectedCountryIndex = document.getElementById(countryElementId).selectedIndex;

    var stateElement = document.getElementById(stateElementId);

    stateElement.length = 0; // Fixed by Julian Woods
    stateElement.options[0] = new Option('Select Passes', '');
    stateElement.selectedIndex = 0;

    var state_arr = s_a[selectedCountryIndex].split("|");

    for (var i = 0; i < state_arr.length; i++) {
        stateElement.options[stateElement.length] = new Option(state_arr[i], state_arr[i]);
    }
}

function populateCountries(countryElementId, stateElementId) {
    // given the id of the <select> tag as function argument, it inserts <option> tags
    var countryElement = document.getElementById(countryElementId);
    countryElement.length = 0;
    countryElement.options[0] = new Option('Select Wheeler', '-1');
    countryElement.selectedIndex = 0;
    for (var i = 0; i < country_arr.length; i++) {
        countryElement.options[countryElement.length] = new Option(country_arr[i], country_arr[i]);
    }

    // Assigned all countries. Now assign event listener for the states.

    if (stateElementId) {
        countryElement.onchange = function () {
            populateStates(countryElementId, stateElementId);
        };
    }
}
 </script>



<c:url var="savepassregister" value="/security/savepassregister.html"></c:url>
<form:form action="${savepassregister}" method="post"  commandName="passes" 
onsubmit="return(validate());" name="passregister" >

<br/><br/>
 <table width="50%" align="center">
<tr><td><fieldset>
 <legend align="center"><font size="4"><b>Pass Register</b></font></legend>
		<table align="center" >
 <tr>
			<th align="center" colspan="5" class="font">${msg}</th>
		</tr>  
  <tr>
  <th><font size="3">Select Type Of Wheeler</font><font color="red"><sup>*</sup></font></th>
  <td><select id="country" name="type_of_wheeler" class="selectbox"></select></td>
  </tr>
  
  <tr>
  <th><font size="3">Select Type Of Passes</font><font color="red"><sup>*</sup></font></th>
  <td><select name="type_of_passes" id="state" class="selectbox"></select></td>
 
  </tr>
  
  
        <script language="javascript">
            populateCountries("country", "state");
            populateCountries("country2");
        </script>


 <tr>
 <th><font size="3">Pass Number</font><font color="red"><sup>*</sup></font></th>
 <td><input type="text" name="pass_no" class="textbox" /></td>
 </tr>
 
 <tr>
 <th><font size="3">Old Pass Number</th>
 <td><input type="text" name="old_pass_no" class="textbox" /></td>
 </tr>
 
 <tr>
 <th><font size="3">Name</font><font color="red"><sup>*</sup></font></th>
 <td><input type="text" name="name" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">Department</font></th>
 <td><input type="text" name="department" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">Address</th>
 <td><input type="text" name="address" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">Mobile No</font><font color="red"><sup>*</sup></font></th>
 <td><input  type='tel' pattern="[0-9]{5,15}" name="mobile_no" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">Email Id</font><font color="red"><sup>*</sup></font></th>
 <td><input type="email" name="email_id"  pattern="[^ @]*@[^ @]*" class="textbox"/>
 </td>
 
 </tr>
 
 <tr>
 <th><font size="3">Vehicle Registraion No</font></th>
 <td><input type="text" name="vehicle_registration_no" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">Model & Color</font></th>
 <td><input type="text" name="model_color" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">Owners Signature</font></th>
 <td><input type="text" name="signature" class="textbox" /></td>
 </tr>
 
 <tr>
 <th><font size="3">Renewal Pass No</font></th>
 <td><input type="text" name="renewal_pass_no" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">Pass Expired Date</font><font color="red"><sup>*</sup></font></th>
 <td><input type="text" name="expire_date" id="text" class="textbox" /></td>
 </tr>
 
  
 <tr>
 <th><font size="3">Owners Signature With Date</font></th>
 <td><input type="text" name="date" id="text" class="textbox"/></td>
 </tr>
 
 <tr>
 <th><font size="3">Remarks</font></th>
 <td><input type="text" name="remarks" class="textbox"/></td>
 </tr>
 
 <tr>
 <td></td>
   <td><input type="submit" value="submit" style="height:25px;"/></td>
  </tr>
  
  </table>
  
  </form:form>
</body>
</html>