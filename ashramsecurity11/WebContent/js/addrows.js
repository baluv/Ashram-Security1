function popup() {
alert("Hello World")
}

function addRow6(languagesknown) {
 
            var table = document.getElementById(languagesknown);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var colCount = table.rows[1].cells.length;
 
            for(var i=0; i<colCount; i++) {
 
                var newcell = row.insertCell(i);
 
                newcell.innerHTML = table.rows[1].cells[i].innerHTML;
                //alert(newcell.childNodes);
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = "";
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                }
            }
        }
        
        
        function addRow1(educational) {
 
            var table = document.getElementById(educational);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var colCount = table.rows[2].cells.length;
 
            for(var i=0; i<colCount; i++) {
 
                var newcell = row.insertCell(i);
 
                newcell.innerHTML = table.rows[2].cells[i].innerHTML;
                //alert(newcell.childNodes);
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = "";
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                }
            }
        }
         function addRow2(activities) {
 
            var table = document.getElementById(activities);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var colCount = table.rows[2].cells.length;
 
            for(var i=0; i<colCount; i++) {
 
                var newcell = row.insertCell(i);
 
                newcell.innerHTML = table.rows[2].cells[i].innerHTML;
                //alert(newcell.childNodes);
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = "";
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                    case "textarea":
                            newcell.childNodes[0].selectedIndex = "";
                            break;
                }
            }
        }
        
         function addRow3(familyrelations) {
 
            var table = document.getElementById(familyrelations);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var colCount = table.rows[1].cells.length;
 
            for(var i=0; i<colCount; i++) {
 
                var newcell = row.insertCell(i);
 
                newcell.innerHTML = table.rows[1].cells[i].innerHTML;
                //alert(newcell.childNodes);
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = "";
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                    case "textarea":
                            newcell.childNodes[0].selectedIndex = "";
                            break;
                }
            }
        }
        function addRow4(companyexperience) {
 
            var table = document.getElementById(companyexperience);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var colCount = table.rows[2].cells.length;
 
            for(var i=0; i<colCount; i++) {
 
                var newcell = row.insertCell(i);
 
                newcell.innerHTML = table.rows[2].cells[i].innerHTML;
                //alert(newcell.childNodes);
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = "";
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                    case "textarea":
                            newcell.childNodes[0].selectedIndex = "";
                            break;
                }
            }
        }
 
  function addRow5(artofliving) {
 
            var table = document.getElementById(artofliving);
 
            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
 
            var colCount = table.rows[2].cells.length;
 
            for(var i=0; i<colCount; i++) {
 
                var newcell = row.insertCell(i);
 
                newcell.innerHTML = table.rows[2].cells[i].innerHTML;
                //alert(newcell.childNodes);
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = "";
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                    case "textarea":
                            newcell.childNodes[0].selectedIndex = "";
                            break;
                }
            }
        }
 
        function deleteRow1(familyrelations) {
            try {
            var table = document.getElementById(familyrelations);
            var rowCount = table.rows.length;
   if(rowCount==1){
    alert("Cannot delete all the rows.");}
   if(rowCount>1){
    table.deleteRow(rowCount -1);
   }
   }catch(e) {
                alert(e);
            }
        }
        
        
         function deleteRow2(languagesknown) {
            try {
            var table = document.getElementById(languagesknown);
            var rowCount = table.rows.length;
          
   if(rowCount==1){
    alert("Cannot delete all the rows.");}
   if(rowCount>1){
    table.deleteRow(rowCount -1);
   }
   }catch(e) {
                alert(e);
            }
        }
         function deleteRow3(educational) {
            try {
            var table = document.getElementById(educational);
            var rowCount = table.rows.length;
   if(rowCount==1){
    alert("Cannot delete all the rows.");}
   if(rowCount>1){
    table.deleteRow(rowCount -1);
   }
   }catch(e) {
                alert(e);
            }
        }
        
        function deleteRow4(companyexperience) {
            try {
            var table = document.getElementById(companyexperience);
            var rowCount = table.rows.length;
   if(rowCount==1){
    alert("Cannot delete all the rows.");}
   if(rowCount>1){
    table.deleteRow(rowCount -1);
   }
   }catch(e) {
                alert(e);
            }
        }
        
        function deleteRow5(activities) {
            try {
            var table = document.getElementById(activities);
            var rowCount = table.rows.length;
   if(rowCount==1){
    alert("Cannot delete all the rows.");}
   if(rowCount>1){
    table.deleteRow(rowCount -1);
   }
   }catch(e) {
                alert(e);
            }
        }
        
         function deleteRow6(artofliving) {
            try {
            var table = document.getElementById(artofliving);
            var rowCount = table.rows.length;
   if(rowCount==1){
    alert("Cannot delete all the rows.");}
   if(rowCount>1){
    table.deleteRow(rowCount -1);
   }
   }catch(e) {
                alert(e);
            }
        }
        
        //email check
 function emailCheck(emailStr) {
// checks if the e-mail address is valid
var emailPat = /^(\".*\"|[A-Za-z]\w*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z]\w*(\.[A-Za-z]\w*)+)$/;
var matchArray = emailStr.match(emailPat);
if (matchArray == null) {
alert("Please Enter Required Fields & Email Address!");
return false;
}
// make sure the IP address domain is valid
var IPArray = matchArray[2].match(/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/);
if (IPArray != null) {
for (var i=1;i<=4;i++) {
if (IPArray[i]>255) {
alert("Destination IP address is invalid!")
return false;
      }
   }
}
return true;
}
 
 //
 function Validate()
{
        var x = document.sform.phone_no.value;
       
        if (x==null || x=="")
 	 {
 		 alert("Phone no. cannot be left blank");
 		 return false;
 	 }       

       	 if(isNaN(x)|| x.indexOf(" ")!=-1)
	{
              			alert("Enter numeric value");
			return false;
                }
       			 if (x.length > 10)
			{
                			alert("enter 10 characters"); 
				return false;
          			 }
       
}


//dispalying textboxes when radiobox clicked
function radioWithText(d) {

    document.getElementById('one').style.display = "none";
      document.getElementById('two').style.display = "none";
   document.getElementById(d).style.display='inline';
    document.getElementById("qwe").reset();
}



