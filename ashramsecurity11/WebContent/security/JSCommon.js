function trimFld(field)    {
//	alert('iam in trim');
    fieldval = field.value;
    for (i=0; i<field.value.length; i++)    {
        temp = field.value.substring(i,i+1);
        if (temp != " ")    {
            break;
        }
    }
    field.value = fieldval.substring(i,fieldval.length);
    fieldval = field.value;
    for (i=field.value.length; i>0; i--)    {
        temp = field.value.substring(i-1,i);
        if (temp != " ")    {
            break;
        }
    }
    field.value = fieldval.substring(0,i);
}

//checking the count of selected items
var flag=false;
var flag1=false;
var positionOfOthers=0;
var positionOfOthers1=0;
var checkbit=0;

function checkSelectionCount(field,field1,num,type)
{	
	if(checkbit==0 && type=="Tech")
	{
		indexOfOthers(field);
	  	checkbit++;
	}
	
	var count=0;
	var howMany = num;	
  	var dummy=999;  
  	var alertCntr = 0;
  	var deSelcnt = 0;
  	
	for (var i = 0; i < field.length; i++) 
	{
		if (field.options[i].selected == true)
		{ 
			count=count+1;
			
			if(count>howMany)
			{			
				if(alertCntr==0)
					alert( "Please select only " + howMany+" options");
				
				if(i==positionOfOthers)
				{	flag1=false;
				}
				
				field.options[i].selected = false				
				alertCntr++;
			}		
			else
			{			
       			dummy=dummy + "/" + i
			}			
		deSelcnt++;	
		}		
	}
	 
	if(deSelcnt !=0)
	{
		if (dummy.indexOf(positionOfOthers) != -1)
		{
			field1.value = "Enter Value for others";
			flag1=true;		  	  
		}
		else
		{	
			field1.value = "NONE";			
			flag=false;
		} 
 	}
 	count = 0; 	
	return true;
}

function countSelectItems(field)
{	
	var count=0;
	for (var i = 0; i < field.length; i++) 
	{
		if (field.options[i].selected == true)
		{ 
			count=count+1;
		}		
	}
	return count;
}

function indexOfOthers(field)
{
	flag=false;
	flag1=false;
	
	for (var i = 0; i < field.length; i++) 
	{	
		if(field.options[i].value == "TC113")
		{ 	
			positionOfOthers=i;		   
		}
	}	
	
	checkbit = 0;	
}

function checkSelectionCount1(field,field1,num,type) 
{	
	if(checkbit==0 && type=="Lang")
	{
		indexOfOthers1(field);
		checkbit++;
	} 		
	
	var count=0;
	var howMany = num;	
  	dummy1=999;  
  	var alertCntr = 0;
  	
	for (var i = 0; i < field.length; i++) 
	{
		if (field.options[i].selected == true)
		{ 
			count=count+1;
			
			if(count>howMany)
			{	
				if(alertCntr==0)
					alert( "Please select only " + howMany+" options");
				
				if(i==positionOfOthers1)
				{	flag1=false;
				}
				
				field.options[i].selected = false
				alertCntr++;
			}		
			else
			{	
				dummy1=dummy1 + "/" + i			  	
			}			
		}
	}
	
	if (dummy1.indexOf(positionOfOthers1) != -1)
	{
		field1.value = "Enter Value for others"; 		 	 		 	 		 	
		flag1=true;		  	  
	}
	else
	{	
		field1.value = "NONE";			
		flag=false;
	} 
 	
 	count = 0; 	
 	checkbit = 0;
	return true;
} 

function indexOfOthers1(field)
{
	flag=false;
	flag1=false;
 
	for (var i = 0; i < field.length; i++) 
	{	
		if(field.options[i].value == "LT112")
		{ 	
			positionOfOthers1=i;		   		    		   
		}
	}
}

function checkSeletion(field)
{
		
	if( (flag==false) && (flag1==false))
	{
		field.value="NONE";
		field.blur();
	}	
}

// AlphaNumeric Field Validation
function isAlphaNumeric(field,bSubmit){
trimFld(field);
if (bSubmit==true && (field.value.length == 0 || field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.focus();
    	field.select();
    	return false;
    }
var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-. ";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {	        		
	        		alert("Please do not enter special characters in fields");	        		
	        		field.select();
	        		field.focus(); 	        		
       				return false;
	        	}
	}
	return true;
}

function isAlphaNumericSpecial(field,bSubmit){
trimFld(field);
if (bSubmit==true && (field.value.length == 0 || field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.focus();
    	field.select();
    	return false;
    }
var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-.~`!@#$%^&*()=+{[}]|\:'<>,.?/";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {	        		
	        		alert("Please enter special characters in fields");	        		
	        		field.select();
	        		field.focus(); 	        		
       				return false;
	        	}
	}
	return true;
}


function isAlphaNumeric_1(field,bSubmit){
trimFld(field);
if (bSubmit==true && (field.value.length == 0 || field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.focus();
    	field.select();
    	return false;
    }
var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-./, ";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {	        		
	        		alert("Please do not enter special characters in fields");	        		
	        		field.select();
	        		field.focus(); 	        		
       				return false;
	        	}
	}
	return true;
}

function isAlphaNumeric_PS(field,bSubmit)	{
    trimFld(field);
    if (bSubmit==true && (field.value.length == 0||field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.select();
    	field.focus();
        return;
    }
    else {
			var valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789. ";
			var temp;
			for (var i=0; i<field.value.length; i++)	{
	    	temp = field.value.substring(i,i+1);
	      if (valid.indexOf(temp) == "-1")    {
	    		alert("Please enter only alphanumeric characters ");
  	  		field.select();
    			field.focus();
	  	    return false;
        }
      }
    }
    return true;
  }

function gotoChangePassword() {
	this.location.href = "ChangePassword.htm"
}
function gotoNewUser() {
	this.location.href = "ConsultantRegistrationScreen.htm"
}

//Number Field Validation
function isNumber(field,bSubmit)	{
    trimFld(field);
    
    if (bSubmit==true && (field.value.length == 0||field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.select();
    	field.focus();
        return;
    }
    else {
	var valid = "0123456789.";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {
	    			alert("Please enter numeric values");
  	  			field.select();
    				field.focus();
	  	          return false;
        		}
		}
	}
	return true;
}

function isNumberWithoutDecimal(field,bSubmit) {
  if (field) {
    trimFld(field);
    if (bSubmit==true && (field.value.length == 0||field.value==""))    {
      alert("Please do not leave the field empty");
      field.select();
      field.focus();
      return false;
    }
    else {
      var valid = "0123456789";
      var temp;
      for (var i=0; i<field.value.length; i++) {
        temp = field.value.substring(i,i+1);
        if (valid.indexOf(temp) == "-1")    {
          alert("Please enter a valid number");
          field.select();
          field.focus();
          return false;
        }
      }
    }
  }
  return true;
}

//Email Field Validation
function isEmailID(field,bSubmit) {
	
	emailStr = field.value	  
	var emailPat=/^(.+)@(.+)$/
	var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
	var validChars="\[^\\s" + specialChars + "\]"
	var quotedUser="(\"[^\"]*\")"
	var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
	var atom=validChars + '+'
	var word="(" + atom + "|" + quotedUser + ")"
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
		//changed now
	var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-.@";
		var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {	
	        		alert("Please do not enter space or characters like +*()%& in Email Address");	        		
	        		field.select();
	        		field.focus(); 	        		
       				return false;
	        	}
	}

		//changed now

	//alert("bool="+bSubmit);
	if(bSubmit!=true && (field.length == 0 || field.value ==""))
	{
		return true;					
	}
	if(field.length == 0 || field.value =="")
		{	
    	alert("Please do not leave the field empty");
    	field.select();
    	field.focus();
		 return false;
		}		
		
  var matchArray=emailStr.match(emailPat)
  	 if(matchArray==null) {
		alert("Please enter a valid EmailID");
		field.focus();
		field.select();
		return false  
		}
	 var user=matchArray[1];
	 var domain=matchArray[2];

	 if (user.match(userPat)==null) {
    // user is not valid
	    alert("The username in Email Address doesn't seem to be valid.")
    	field.focus();
    	field.select();
	    return false
	 }

	var IPArray=domain.match(ipDomainPat)
	if (IPArray!=null) {
    // this is an IP address
		for (var i=1;i<=4;i++) {
			if (IPArray[i]>255) {
				alert("Destination IP address in EmailID is invalid!");
				field.focus();
				field.select();
				return false
			}
		}
	return true
	}

	var domainArray=domain.match(domainPat)
	if (domainArray==null) {
		alert("The domain name in EmailID doesn't seem to be valid.");
			field.focus();
			field.select();
		return false
	}

	var atomPat=new RegExp(atom,"g")
	var domArr=domain.match(atomPat)
	var len=domArr.length
	if (domArr[domArr.length-1].length<2||domArr[domArr.length-1].length>3) {
   // the address must end in a two letter or three letter word.
		alert("The Email address must end in a three-letter domain, or two letter country.");
		field.focus();
		field.select();
		return false
	}

	if (len<2) {
		var errStr="The Email address is missing a hostname!"
		alert(errStr)
		field.focus();
		field.select();			
		return false
	}
	return true;
}





/********************************************************************



// Date validation

function isDate(field)
{
var date=field.value

var d1=date.substring(0,2)
var d2=date.substring(3,5)
var d3=date.substring(6,10)


var day  =parseInt(d1);
var month=parseInt(d2);
var year =parseInt(d3);

if( isNaN(d1) || isNaN(d2) || isNaN(d3))
{
alert("Enter only numbers for date");
return false;
}

separator=date.substring(2,3)
separator1=date.substring(5,6)


if(separator != "-" || separator1 != "-" )
{
alert("Enter the format dd-mm-yyyy");
return false;
}

if(day<1 || day > 31)
{
alert("Enter the proper day");
return false;
}

if(month<1 || month > 12)
{
alert("Enter the proper month");
return false;
}

if(month==2 && day>29)
{
alert("Wrong day for february");
return false;
}

if((month==4 || month==6 || month==9 || month==11) &&  ( day > 30))
{
alert("Wrong day for the month");
return false;
}

if(year < 2000 || year >3000)
{
alert("Enter  the proper  year");
return false;
}



}

*********************************************************************/

//Validate Form
function checkForm(theForm)
{
    for (i=0;i<theForm.elements.length;i++)
    {
      ele = theForm.elements[i]

      if ( ((ele.type=="text") || (ele.type=="textarea") || (ele.type=="password")) && (ele.value==""))
      {
		if((ele.type=="text")&&(ele.name == "TechnologyOthers"))
			returnValue = true
		else
			returnValue = false
		      break;
      }
      else
        returnValue = true
    }

    if (!returnValue)
    {
      alert("Form not submitted - please enter a value for this field")
    }

    if(returnValue)
       theForm.submit()
}


function isDay(field)
{
	var day=field.value
	//var day  =parseInt(d1);

	if(day<1 || day > 31)
	{
		alert("Enter the proper day");
		return false;
	}
	
	return true;
}

function isMonth(field)
{
	var month=field.value
	//var month =parseInt(d1);

	if(month<1 || month > 12)
	{
		alert("Enter the proper month");
		return false;
	}
	
	return true;
}


function isDate(field,field1,field2,presentYear)
{
//change now

if(field.value==""||field.value.length==0||isNaN(parseInt(field.value)))
{
alert("Please enter correct Day ");
field.select();
field.focus();
return false;
}
if(field1.value==""||field1.value.length==0||isNaN(parseInt(field1.value)))
{
alert("Please enter correct Month ");
field1.select();
field1.focus();
return false;
}
if(field2.value==""||field2.value.length==0||isNaN(parseInt(field2.value)))
{
alert("Please enter correct Year");
field2.select();
field2.focus();
return false;
}


var day=field.value
var month=field1.value
var year=field2.value

//var d1=field.value
//var d2=field1.value
//var d3=field2.value

var presentYear = parseInt(presentYear)

//var day  =parseInt(d1);
//var month=parseInt(d2);
//var year =parseInt(d3);

    
if(day<1 || day > 31)
{
alert("Please enter correct Day ");
field.focus();
field.select();
return false;
}

if(month<1 || month > 12)
{
alert("Please enter correct Month ");
field1.focus();
field1.select();
return false;
}

if(month==2 && day>29)
{
alert("This month does not have these many days");	
field1.select();
field1.focus();
return false;
}

// leap year check

if ( !((year % 4 == 0) && (!(year % 100 == 0) || (year % 400 == 0) ) ) && (month == 2) && (day > 28))
{
alert("This is not a leap year");	
field1.select();
field1.focus();
return false;
}


if((month==4 || month==6 || month==9 || month==11) &&  ( day > 30))
{
alert("This month does not have these many days");	
field1.select();
field1.focus();
return false;
}
//Modified By HarshVardhan on june 24,02.
//if(year > presentYear-18 || year < presentYear-80)
//{
//alert("Please enter correct Year");
//field2.select();
//field2.focus();
//return false;
//}

//if( isNaN(d1) || isNaN(d2) || isNaN(d3))

if( isNaN(day) || isNaN(month) || isNaN(year))
{
alert("Enter only numeric value for date");
field.select();
field.focus();
return false;
}
return true;
}


// To Support Resume Posting Screens - Nagarajan K - Dated - 13/04/2001


function isAlphaNumericFN(field,bSubmit)	{
trimFld(field);
if (bSubmit==true && (field.value.length == 0 || field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.focus();
    	field.select();
    	return false;
    }
var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {	        		
	        		alert("Please do not enter special characters in fields");	        		
	        		field.select();
	        		field.focus(); 	        		
       				return false;
	        	}
	}

if( (field.value.indexOf(" ") >= 0) )
	{
		alert("please do not enter spaces between words in CandidateFirstName");		 
		field.select();
	      field.focus(); 
		return false;
	}

	if( (field.value.indexOf(".") >= 0) )
	{
		alert("please do not enter '.'(DOT) in CandidateFirstName"); 		field.select();
	      field.focus(); 				
		return false;

	}

	if ( field.value.length < 2 ) {
		alert("Please enter atleast 2 characters in first name");
		field.select();
	      field.focus(); 
		return false;
	}


	return true;
} 

function isAlphaNumericLN(field,bSubmit)	{
trimFld(field);
//alert('iam here');
if (bSubmit==true && (field.value.length == 0 || field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.focus();
    	field.select();
    	return false;
    }
var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ .";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {	        		
	        		alert("Please do not enter special characters in fields");	        		
	        		field.select();
	        		field.focus(); 	        		
       				return false;
	        	}
	}


if( (field.value.indexOf(" ") >= 0) )
	{
		alert("please do not enter spaces between words in CandidateLastName");		 
		field.select();
	      field.focus(); 		
		return false;
	}

	if( (field.value.indexOf(".") >= 0) )
	{
		alert("please do not enter '.'(DOT) in CandidateLastName");
		 field.select();
	       field.focus(); 	
	return false;

	}

	if ( field.value.length < 2 ) {
		alert("Please enter atleast 2 characters in last name");
		field.select();
	      field.focus(); 
		return false;
	}


	return true;
}


function isEmailFld(field){

trimFld(field);


if (field.value.length == 0) { 

alert("please enter valid email id")

field.focus(); 

field.select(); 

return false;

}

UsrDomSepCount = 0;

UsrDomSepIndex = -1;

for (i=0; i<field.value.length; i++) {

temp = field.value.substring(i,i+1);

if ((temp == ";") || (temp == ":") || (temp == "&") ||

(temp == "#") || (temp == ",")) {

alert("Characters like ;:&#, not allowed in email address");

// field.value = ""; 

field.focus(); 

field.select();

return false;

}

if (UsrDomSepCount == 0) {

UsrDomSepIndex++;

}

if (temp == '@') {

UsrDomSepCount++; 

}

}

if (UsrDomSepCount != 1) {

alert("There should one @ symbol in the email address\n");

//field.value = ""; 

field.focus();

field.select();

return false;

}

usr = field.value.substring(0,UsrDomSepIndex);

dom = field.value.substring(UsrDomSepIndex+1,i);

if ((usr.length == 0) || (!isNotNumericVal(usr.substring(0,1)))) {

alert("Enter a username starting with a character");

//field.value = ""; 

field.focus();

field.select();

return false;

}

domlen = dom.length;

if ((dom.substring(0,1) == ".") || (dom.substring(domlen-1,domlen) == ".")) {

alert("domain should not start or end with .");

//field.value = "";

field.focus();

field.select();

return false;

}

dotIndex1 = -1;

dotIndex2 = -1;

dotCount = 0;

for (i=0; i<domlen; i++) {

if (dotIndex2 == -1) {

dotIndex1++;

}

else {

dotIndex2++;

}

if (dom.substring(i,i+1) == ".") {

dotCount++;

if (dotIndex2 == -1) {

dotIndex2 = dotIndex1;

}

else {

if (dotIndex2-dotIndex1 == 1) {

alert("atleast one character between two .s");

field.focus();

field.select();

return false;

}

else {

dotIndex1 = dotIndex2;

}

} 

}

}

if (dotCount == 0) {

alert("atleast one . in the domain is required.");

//field.value = "";

field.focus();

field.select();

return false;

}

return true;

}

function isNotNumericVal(val)	{	

	  



    var valid = "0123456789";

    var temp;   

    for (var i=0; i<val.length; i++)	{

        temp = val.substring(i,i+1);        

        if (valid.indexOf(temp) == "-1")    {

            return true;

        }

    }    

    return false;

}

function textSearch(field,bSubmit)
{
	trimFld(field);

	if(field.value.length!=0)
 	{		
 		if(!(isText(field,false)))
 			return false;
  		
  		var comma=0;
  		var space=0;
   		
   		for (i=0; i<field.value.length; i++)
    	{ 	tem = field.value.substring(i,i+1);
        	
        	if (tem==",")
        	{	comma++;
        	}
        	/*else if (tem==" ")
        	{	space++;
        	}*/
  		}
  	
  		/*if(comma>2 || space>2)
  		{	alert("Maximum three values are allowed");
  			field.focus();
  			return false;
  		}
  
  		if(comma>0 && space>0)
  		{	alert("Values can be comma(,) or Space separated not both");
  			field.focus();
  			return false;
  		}*/
 	}
 	else
 	{	alert("Please type any text for Searching");	
		field.focus();
		return false;
	}
	return true;
}

function isText(field,bSubmit)	
{
  	var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ,*+&";
	var tem;
	var tempcomma=0;
	
	for (var i=0; i<field.value.length; i++)	
	{	tem = field.value.substring(i,i+1);
	    if (valid.indexOf(tem) == "-1")    
	    {	alert("Please do not enter any special characters");
  	  		field.select();
    		field.focus();
	  	    return false;
		}
	}
	if(field.value.length==1 || field.value.length==2)
	{
		for (var i=0; i<field.value.length; i++)	
		{	tem = field.value.substring(i,i+1);
	        if (tem == ",")    
	        {	tempcomma++;	
	    	}
		}
	}
	
	if(field.value.length == tempcomma)
	{  	alert("Please enter the Text");
		return false;
	}	
	
	return true;
}


//rajesh
function validateForAmountDecimal(field,bSubmit)
  {
  	if(!isNumber(field,bSubmit))
  	{
  		return false;
  	}
  	var vAmountValue = field.value;
        var vAmountValueLength = field.value.length;
        if(vAmountValueLength  > 0)
	{
  	var vAmountElements = vAmountValue.split(".");
  	//alert("The vAmountElements is : " + vAmountElements.length);
  	if(vAmountElements.length > 2)
  	{
  	  alert("Please enter only one decimal.");
          field.select();field.focus();
          return false;  		
  	}
  	if(vAmountElements.length > 1)
  	{
	   if(vAmountElements[0].length > 8)
	   {
	  	alert("Integer part of the amount should not be more than 8 digits");
	        field.select(); field.focus();
	        return false;  		
	  }
	  if(vAmountElements[1].length > 2)
	  {
	  	alert("please enter only 2 digits after the decimal");
	        field.select(); field.focus();
	        return false;  		
	  }
	}
   	if(vAmountElements.length == 1)
  	{
  	   if(vAmountElements[0].length > 8)
	   {	
	  	  alert("Integer part of the amount should not be more than 8 digits");
	          field.select(); field.focus();
	          return false;  		
	  }
   	}
      }//End of the if for length greater than zero.
  	return true; 
  }

  function countResumeTextLength(resumeTextField,countField)
  {
    countField.value = resumeTextField.value.length;
  }

function checkMaxSelection(field,bIncludeFirst,nCount,strLabel,bAtleastOneRequired) {
  if (field) {
    if (bAtleastOneRequired) {
      if (field.selectedIndex == -1) {
        alert("Please select any value of "+strLabel);
        field.focus();
        return false;
      }
    }
    if (!bIncludeFirst) {
      if (field.options[0].selected == true) {
        alert("Please de-select Click to Select of "+strLabel);
        field.focus();
        return false;
      }
    }
    var nSelectedCount = 0;
    for (var i=0;i<field.options.length;i++) {
      if (field.options[i].selected == true) {
        if (nSelectedCount < nCount) {
          nSelectedCount++;
        }
        else {
          alert("Please select maximum of "+nCount+" "+strLabel);
          for (var j=i;j<field.options.length;j++) {
            field.options[j].selected = false;
          }
          field.focus();
          return false;
        }
      }
    }
  }
  return true;
}

//rajesh

// Date Validation.

function isValidDate(dayfield,monfield,yearfield) {

    trimFld(dayfield);
    trimFld(monfield);
    trimFld(yearfield);

    if (dayfield.value.length == 0) {
    	alert("Enter the day field.");
	    dayfield.focus();
      return false;    	
    }
    if (monfield.value.length == 0) {
    	alert("Enter the month field.");
	    monfield.focus();
      return false;    	
    }
    if (yearfield.value.length == 0) {
    	alert("Enter the year field.");
	    yearfield.focus();
      return false;    	
    }
    
    

    if (monfield.value.length != 0)    {

        if (isNotNumericVal(monfield.value))    {

            alert("Enter numeric values in the month field.");

            monfield.value = "";

	    monfield.focus();

            return false;

        }

        else if ((eval(monfield.value)>12) || (eval(monfield.value)<1))   {

            alert("Not a valid Month.");

            monfield.value = "";

            monfield.focus();

            return false;

        }

    }

    if (yearfield.value.length != 0)    {

        if (isNotNumericVal(yearfield.value))    {

            alert("Enter numeric values in the year field.");

            yearfield.value = "";

            yearfield.focus();

            return false;

        }

        else if ((eval(yearfield.value)>9999) || (eval(yearfield.value)<1))   {

            alert("Not a valid Year.");

            yearfield.value = "";

            yearfield.focus();

            return false;

        }

        if (eval(yearfield.value)<1000)    {

            alert("Please enter the Year in 'YYYY' format.");

            yearfield.value = "";

            yearfield.focus();

            return false;

        } 

    }

    if (dayfield.value.length != 0)    {

        if (isNotNumericVal(dayfield.value))    {

            alert("Enter numeric values in the day field.");

            dayfield.value = "";

            dayfield.focus();

            return false;

        }

        else if ((eval(dayfield.value)>31) || (eval(dayfield.value)<1))   {

            alert("Not a valid Day.");

            dayfield.value = "";

            dayfield.focus();

            return false;

        }

        if (((eval(monfield.value) == 4) || (eval(monfield.value) == 6) || 

             (eval(monfield.value) == 9) || (eval(monfield.value) == 11)) &&

             (eval(dayfield.value) == 31))    {

            alert("Not a valid Day for the Month specified.");

            dayfield.value = "";

            dayfield.focus();

	    return false;

        }

        if (eval(monfield.value) == 2)    {

            if (eval(dayfield.value) > 29)    {

                alert("Not a valid Day for the Month specified.");

                dayfield.value = "";

                dayfield.focus();

                return false;

            }

            leapyear = "no";

            year = yearfield.value;

            if (year%4 == 0)	{

                leapyear = "yes";

                if (year%100 == 0)    {

                    leapyear = "no";

                    if (year%400 == 0)    {

                        leapyear = "yes";

                    }

                }

            }

            if ((leapyear == "no") && (eval(dayfield.value) == 29))    {

                alert("Not a valid Day for the Month and Year specified.");

                dayfield.value = "";

                dayfield.focus();

                return false;

            }    

        }

    }

    return true;
}

//Changed by Sandesh
function goClickJD(vCompCode)
{
	if(vCompCode=='WT')
		window.open("https://synergy.wipro.com/resumebuilder_files/RolesAndResponsibilities.html","win",'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
	else
		window.open("https://synergy.wipro.com/resumebuilder_files/"+vCompCode+"RolesAndResponsibilities.html","win",'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}

//Added by Sandesh - April 21st
//Input: Multiple Drop down, Output: "sepType" seperated Codes
function validateMultiDDSelected(fldObj,sepType)
{
    flgNoneSeld = false;
    flgOtherSeld = false;
    var vFieldValue = "";
    var vTempValue = "";
    indObj = fldObj.options.length;
    
    for (indval = 0; indval < indObj; indval++)
    {	
    	if (fldObj.options[indval].selected == true && fldObj.options[indval].value == "NONE")
    	{	flgNoneSeld = true;
    	}
    	else if (fldObj.options[indval].selected == true && fldObj.options[indval].value != "NONE") 
    	{	
    		if (!flgOtherSeld)
    			vTempValue = fldObj.options[indval].value;
    		else
    			vTempValue = vTempValue + sepType + fldObj.options[indval].value;
    		
    		flgOtherSeld = true;
		}
    }
    
    if (flgOtherSeld)
    	vFieldValue = vTempValue;
    else if (flgNoneSeld)
    	vFieldValue = "NONE";
    else
    	vFieldValue = "NONE";

    return vFieldValue;
}

//Added by Sandesh - Viewing Contractor Assessment Details
function goClickContRecomm(resNumber)
{	window.open('CN_ContractorRecommendationViewScreen.jsp?ResNumber='+resNumber+'','ContRecomm','alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}

//Added by Sandesh - Viewing Contractor Resume
function goClickContResume(resNumber)
{	window.open("CN_ResumeScreen.jsp?reqCode="+resNumber,'ContractResume','alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}


function goWESClickContResume(resNumber)
{	window.open("WES_ResumeScreen.jsp?reqCode="+resNumber,'ContractResume','alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}



//Added by Sandesh - Viewing Lateral Resume
function goClickLatResume(resNumber)
{	window.open("InterviewResumeScreen.jsp?reqCode="+resNumber,'ContractResume','alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}

//Added by Sandesh - Closing the Form
function closeForm()
{	window.close();		
}

//Added by Sandesh - For WU - Assign Test Id and Process Query Screens
function checkPercentage(fldOpr,fld)
{	
	posVal = fldOpr.selectedIndex;
    assignValue = fldOpr.options[posVal].value;
	
	if(assignValue=='NONE')
		fld.value="";
	else
		fld.focus();
}

//Added by Sandesh - For WU - Assign Test Id and Process Query Screens
function validatePercentage(fldOpr,fld,fieldName)
{
	posVal = fldOpr.selectedIndex;
    assignValue = fldOpr.options[posVal].value;

    trimFld(fld);
    
	if(!(fld.value.length == 0 || fld.value==""))
    {	if(!isNumber(fld,true))
    	{ return false;}
    
    	if(fld.value>100)
		{	alert("Maximum Percentage can only be 100 for : "+fieldName);
			fld.select();fld.focus();
			return false;
		}
    	
    	if(assignValue=='NONE')
    	{	alert("Please specify a Criteria for : "+fieldName);
    		fldOpr.focus();
    		return false;
    	}
    }
    
    if(!(assignValue=='NONE'))
	{	if(!isNumber(fld,true))
    	{ return false;}
	}
	
	if(	(assignValue=='<' && fld.value==0)
		|| (assignValue=='>' && fld.value==100))
	{	alert("Invalid Query Condition");
	    fldOpr.focus(); 
    	return false;
	}
	
	return true;
}

//Added by Sandesh - Viewing WU Resume
function goViewWUResume(ResumeNumber)
{	window.open("QS_WUResumeScreen.jsp?ResumeNumber="+ResumeNumber,"win"+ResumeNumber,'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}

//Added by Sandesh - Viewing Contract Job Details
function goGetContractJobDetails(JobCode)
{	window.open ("CN_JobDescription.jsp?JobCode="+JobCode,"win"+JobCode,'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}

function goGetWesJobDetails(JobCode)
{	window.open ("WES_JobDescription.jsp?JobCode="+JobCode,"win"+JobCode,'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}


//Added by Sandesh - Used in WU - Process & Resume Deletion - Resume Number Field
function isNumberWithComma(field,bSubmit)
{
    trimFld(field);
    if (bSubmit==true && (field.value.length == 0||field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.select();
    	field.focus();
        return;
    }
    else {
	var valid = "0123456789, ";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {
	    			alert("Invalid Entry!! Please refer the Hint.");
  	  				field.select();
    				field.focus();
	  	          return false;
        		}
		}
	}
	return true;
}

//Function 			:	Opens a new window for Searching an Employee
//formName 			:	Only the Form Name.  Don't include "document"
//fieldName 		:	Only the Field Name.  Don't include "document.formName"
//multiRecIndex 	:	Multiple Records' index value else "NONE"
//fieldType 		:	TEXT (For Text Box) or SINGLEDPD (For Single Dropdown) or MULTIDPD (For Multiple Dropdown)
//multDPDMaxCount	:	If fieldType is MULTIDPD, what is the maximum no. of values those can be selected in the drop down else "NONE"
//labelName			:	E.g., Panelist, Panelists

function goSearchEmp(formName,fieldName,multiRecIndex,
			fieldType,multDPDMaxCount,labelName)
{	
	count=0;
	fldObj = "";
	
	if(multiRecIndex == 'NONE')
	{	fldObj = eval("document."+formName+"."+fieldName+"");
	}	
	else
	{	fldObj = eval("document."+formName+"."+fieldName+"["+multiRecIndex+"]");
	}	
	
	if(fieldType == 'TEXT' || fieldType == 'SINGLEDPD')
	{	multDPDMaxCount = 1;
	}
	else if(fieldType == 'MULTIDPD')
	{
		for (var i = 0; i < fldObj.length; i++)
		{
			if (fldObj.options[i].selected == true)
			{ 	count=count+1;
			}	
			
			if(count>=multDPDMaxCount)
			{	break;
			}	
		}
	}
	else
	{	alert("Invalid Input!!");
		return false;
	}
	
	if(count>=multDPDMaxCount)
	{	alert("A maximum of only "+multDPDMaxCount+" "+labelName+" can be selected from the list!!");
	}
	else
	{	window.open("QS_AutoPopulateDataOnSearch.jsp?FormName="+formName+"&FieldName="+fieldName+"&Index="+multiRecIndex+"&FieldType="+fieldType,"win",'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
	}	
}

//Added by Sandesh - Viewing RR Details
function goCheckRRDetails(rr)
{	
	if(rr=='-')
		alert("Job was not created based on a Resource Request (RR).");
	else	
		window.open("RRJP_RecruiterViewDetails.jsp?RRNumber="+rr,"win"+rr,'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}

//Added by Sandesh - Viewing Contract Resume History
function goClickContHistory(ResNum)
{	window.open ("CN_CandidateStatus.jsp?ResNum="+ResNum,"win"+ResNum,'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
}




// AlphaNumeric Field Validation
function searchNameisAlphaNumeric(field,bSubmit){
trimFld(field);
if (bSubmit==true && (field.value.length == 0 || field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.focus();
    	field.select();
    	return false;
    }
var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {	        		
	        		alert("Please do not enter special characters in fields");	        		
	        		field.select();
	        		field.focus(); 	        		
       				return false;
	        	}
	}
	return true;
}


function checkMaxSelection(field,bIncludeFirst,nCount,strLabel,bAtleastOneRequired) {
  if (field) {
    if (bAtleastOneRequired) {
      if (field.selectedIndex == -1) {
        alert("Please select any value of "+strLabel);
        field.focus();
        return false;
      }
    }
   
    var nSelectedCount = 0;
    for (var i=0;i<field.options.length;i++) {
      if (field.options[i].selected == true) {
        if (nSelectedCount < nCount) {
          nSelectedCount++;
        }
        else {
          alert("Please select maximum of "+nCount+" "+strLabel);
          for (var j=i;j<field.options.length;j++) {
            field.options[j].selected = false;
          }
          field.focus();
          return false;
        }
              
      }
    
    
    }
    if (nSelectedCount > 1)
    {
     if (!bIncludeFirst) {
          if (field.options[0].selected == true) {
            alert("Please de-select No Preference of "+strLabel);
            field.focus();
            return false;
          }
    }
    }
    
  }
  return true;
}
//====================================================
// Added by Ankur on 2:03 PM 4/1/2006
// Rounds up/down for to specific number of digits
//
// e.g MathRound("123.7896","3")  => 123.790
// e.g MathRound("123.7896","0")  => 124
// e.g MathRound("123.7896","-1") => 120
//====================================================
function MathRound(Number,Num_Digits)
{	
	if(Number != "" && Num_Digits != "" )
	{
		var value  = parseFloat(Number);
		var digits = parseInt(Num_Digits);

		if(!isNaN(value) && !isNaN(digits))
		{
			var mul     = 0.0;
			var result  = 0.0;
			
			mul    = Num_Digits == 0 ? 1 : Math.pow(10,digits);		
			result = (Math.round(value * mul)) / mul;
			return result;
		}
	}

	return Number;
}

function compareTwoDates(day1,month1,year1,day2,month2,year2)
{
	var firstdate  = new Date(year1,month1-1,day1);
	var seconddate = new Date(year2,month2-1,day2);

 	var difference = seconddate.getTime() - firstdate.getTime();

 	var daysDifference = Math.floor(difference/1000/60/60/24);
     difference -= daysDifference*1000*60*60*24

    var hoursDifference = Math.floor(difference/1000/60/60);
    difference -= hoursDifference*1000*60*60

    var minutesDifference = Math.floor(difference/1000/60);
    difference -= minutesDifference*1000*60

   	var secondsDifference = Math.floor(difference/1000);

	if ( daysDifference < 0)
	   	return false;
	else
    	return true;
}
function checkForClick(field) {
  if (field) {
    if ( field.selectedIndex == -1 || field.selectedIndex == 0) {
      alert("Please select any value");
      field.focus();
      return false;
    }
  }
  return true;
}


function goSearchPanelist(formName,fieldName,multiRecIndex,
			fieldType,multDPDMaxCount,labelName,countItems,status)
{	
	count=0;
	fldObj = "";
	
	if(multiRecIndex == 'NONE')
	{	fldObj = eval("document."+formName+"."+fieldName+"");
	}	
	else
	{	fldObj = eval("document."+formName+"."+fieldName+"["+multiRecIndex+"]");
		
	
	}	
	
	if(fieldType == 'TEXT' || fieldType == 'SINGLEDPD')
	{	multDPDMaxCount = 1;
	}
	else if(fieldType == 'MULTIDPD')
	{
		for (var i = 0; i < fldObj.length; i++)
		{
			if (fldObj.options[i].selected == true)
			{ 	count=count+1;
			}	
			
			if(count>=multDPDMaxCount)
			{	break;
			}	
		}
	}
	else
	{	alert("Invalid Input!!");
		return false;
	}
	
	if(count>=multDPDMaxCount)
	{	alert("A maximum of only "+multDPDMaxCount+" "+labelName+" can be selected from the list!!");
	}
	else
	{
		window.open("IV_PanelistSearch.jsp?FormName="+formName+"&FieldName="+fieldName+"&Index="+multiRecIndex+"&FieldType="+fieldType+"&countItems="+countItems+"&status="+status,"win",'alwaysRaised,location=no,menubar=yes,resizable=yes,scrollbars=yes,status=yes,width=500,height=400,top=35,left=125');
                                                                                                                                
	}                                                                                                                                                                                                                         	
}


function validateCheckDate(day,month,year,bSubmit)
{

	if(day && month && year)
	{
		if( (day.length == 0) || (month.length == 0) || (year.length == 0))
		{
			alert("Enter date ");
			return false;
		}
	}
	else
	{
		return false;
	}
	var today = new Date();

 	var obDate = new Date(year,month-1,day);

 	var difference = today.getTime() - obDate.getTime();

 	var daysDifference = Math.floor(difference/1000/60/60/24);
     difference -= daysDifference*1000*60*60*24

    var hoursDifference = Math.floor(difference/1000/60/60);
    difference -= hoursDifference*1000*60*60

    var minutesDifference = Math.floor(difference/1000/60);
    difference -= minutesDifference*1000*60

   	var secondsDifference = Math.floor(difference/1000);

	if (daysDifference < 0)
	   	return false;
	else
    	return true;
}
 function Trim(str)
{
  return str.replace(/^\s*|\s*$/g,"");
}


function validateLastName(field,bSubmit)	
{
	trimFld(field);
	
     if (bSubmit==true && (field.value.length == 0||field.value=="")){
	
    	alert("Please do not leave the field empty");
    	field.focus();
    	field.select();
    	return false;
    }
    else
    {
	    var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";
		var temp;
		for (var i=0; i<field.value.length; i++)	
		{
			temp = field.value.substring(i,i+1);
		if (valid.indexOf(temp) == "-1")    
		{	        		
				alert("Please do not enter special characters in fields");	        		
				field.select();
				field.focus(); 	        		
				return false;
			}
		}
		
		var vValue = field.value;
		var vAllElements = vValue.split(" ");
	
		vValue = "";
		

		for(n=0;n<vAllElements.length;n++)
		{
			if(vAllElements[n].length>0)
			{
				if(vAllElements[n].length<2)
				{
					alert("Please expand all words in last name.");		 
					field.select();
				    field.focus(); 		
					return false;
				}
				else
				{
					vValue = vValue + vAllElements[n] + " ";
				}
			}
		}
		field.value = vValue;
		trimFld(field);	    		
       }
	
	return true;
}

function trimFldIncludingEnter(field)    {
    fieldval = field.value;
    var nReturn = 0;
    for (i=0; i<field.value.length; i++)    {
        temp = field.value.substring(i,i+1);
        if (temp != " ")    {
        	if (temp == "\r") {
        		if (nReturn == 0) nReturn++;
        		else { i--; break; }
        	}
        	else if (temp == "\n") {
        		if (nReturn == 1) nReturn = 0;
        		else { i--; break; }
        	}
        	else break;
        }
    }
    field.value = fieldval.substring(i,fieldval.length);
    fieldval = field.value;
    nReturn = 0;
    for (i=field.value.length; i>0; i--)    {
        temp = field.value.substring(i-1,i);
        if (temp != " ")    {
        	if (temp == "\n") {
        		if (nReturn == 0) nReturn++;
        		else { i++; break; }
        	}
        	else if (temp == "\r") {
        		if (nReturn == 1) nReturn = 0;
        		else { i++; break; }
        	}
        	else break;
        }
    }
    field.value = fieldval.substring(0,i);
}

//allow space while checking special characters in password filed
function isAlphaNumericSpecialForCandidates(field,bSubmit){

trimFld(field);
if (bSubmit==true && (field.value.length == 0 || field.value==""))    {
    	alert("Please do not leave the field empty");
    	field.focus();
    	field.select();
    	return false;
    }
var valid = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-.~`!@#$%^&*()=+{[}]|\:'<>,.?/ ";
	var temp;
		for (var i=0; i<field.value.length; i++)	{
	        	temp = field.value.substring(i,i+1);
	        	if (valid.indexOf(temp) == "-1")    {
	        		alert("Please do not enter special characters in fields");
	        		field.select();
	        		field.focus();
       				return false;
	        	}
	}
	return true;
}
function isNumberWithoutDecimal_ps(field,bSubmit) {
  if (field) {
    trimFld(field);
    if (bSubmit==true && (field.value.length == 0||field.value==""))    {
      alert("Please do not leave the field empty");
      field.select();
      field.focus();
      return false;
    }
    else {
      var valid = "0123456789";
      var temp;
      for (var i=0; i<field.value.length; i++) {
        temp = field.value.substring(i,i+1);
        if (valid.indexOf(temp) == "-1")    {
          return false;
        }
      }
    }
  }
  return true;
}
