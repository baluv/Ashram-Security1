jQuery.validator.addMethod( 
	  "selectNone", 
	  function(value, element) { 
	    if (element.value == "none") 
	    { 
	      return false; 
	    } 
	    else return true; 
	  }, 
	  "Please select an option." 
	); 
	 
	 
	$(document).ready(function() {
	$("#sform").validate({
        rules: {
        
        username: "required",
      dob: "required"
      
         
        },
        });
 });
 
 