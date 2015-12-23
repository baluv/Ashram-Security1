package com.security.util;



import java.util.List;


import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.security.domain.EmployeeForm;


import java.io.*;

public class Pdf {
	
public void writePdf(OutputStream outputStream,List<EmployeeForm> li){
	System.out.println("write pdf");
	  Document document = new Document(PageSize.A4.rotate());
	  try{
	    PdfWriter.getInstance(document,outputStream); // Code 2
	    document.open();
	    
	    document.addTitle("Test PDF");
        document.addSubject("Testing email PDF");
        document.addKeywords("iText, email");
        document.addAuthor("Jee Vang");
        document.addCreator("Jee Vang");
     /*    
        Paragraph paragraph = new Paragraph();
        paragraph.add(new Chunk("hello!"));
        document.add(paragraph);
         
        document.close();
	    
	    */
	    
	  
	    PdfPTable table1 = new PdfPTable(6);
	    
	     table1.setWidthPercentage(100);
	     float[] columnWidths1 = new float[] {3f,15f,7f,7f,8f,6f};
	              table1.setWidths(columnWidths1);
	              table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	              table1.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	              table1.getDefaultCell().setFixedHeight(20);
	              table1.getDefaultCell().setBackgroundColor(BaseColor.CYAN);
	   
	             table1.addCell("Id");
	             table1.addCell("Name");
	 		     table1.addCell("MobileNo");
	 		     table1.addCell("EmailId");
	 		     table1.addCell("JoiningDate");
	 		     table1.addCell("Status");
	 		     
	     
	      document.add(table1);
	//System.out.println(li.size());
	  PdfPTable table2 = new PdfPTable(6);
		    
		     table2.setWidthPercentage(100);
		     float[] columnWidths2 = new float[] {3f,15f,7f,7f,8f,6f};
		              table2.setWidths(columnWidths2);
		              table2.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		              table2.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
		              table2.getDefaultCell().setFixedHeight(20);
		              //table2.getDefaultCell().setBackgroundColor(BaseColor.CYAN);
		              System.out.println("1");
		         for(EmployeeForm e: li)
		      	    {        
		        	// System.out.println("4");
		              
		     table2.addCell(e.getEmpid().toString());
		     table2.addCell(e.getEmpname());
		    // table2.addCell(e.getEmp_mobileno());
		     table2.addCell(e.getEmp_email());
		     table2.addCell(e.getJoinedon());
		     table2.addCell(e.getEmpstatus());
		     
		
		    
		      	  }
		         document.add(table2);
	      document.close();
	            
	    
	  }catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	
}

}




