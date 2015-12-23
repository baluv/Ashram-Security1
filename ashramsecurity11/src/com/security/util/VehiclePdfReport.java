package com.security.util;

import java.io.OutputStream;
import java.util.List;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.security.domain.EmployeeForm;
import com.security.domain.Twowheeler;


public class VehiclePdfReport {
	
	
	public void writePdf(OutputStream outputStream,List<Twowheeler> li, String vehicletype){
		System.out.println("In VehiclePdfReport pdf:"+vehicletype);
		 Document document = new Document(PageSize.A4.rotate());
		  try{
			  
			  
		    PdfWriter.getInstance(document,outputStream); // Code 2
		    document.open();
			 Paragraph para=new Paragraph();
			 para.setAlignment(Element.ALIGN_CENTER);
			 Font font1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLUE);
			 Font font2 = new Font(FontFamily.HELVETICA, 14, Font.BOLD, BaseColor.BLUE);
	      Chunk chunk = new Chunk("For "+vehicletype, font2);
	      para.add(chunk);
	      para.add(Chunk.NEWLINE);
			 para.add(Chunk.NEWLINE);
				
		
					
					document.add(para);
		    
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
		    
		  
		    PdfPTable table1 = new PdfPTable(8);
		    
		     table1.setWidthPercentage(100);
		     float[] columnWidths1 = new float[] {3f,15f,7f,7f,8f,6f,8f,8f};
		              table1.setWidths(columnWidths1);
		              table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
		              table1.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
		              table1.getDefaultCell().setFixedHeight(20);
		              table1.getDefaultCell().setBackgroundColor(BaseColor.CYAN);
		   
		             table1.addCell("Id");
		             table1.addCell("Vehicle Type");
		 		     table1.addCell("From");
		 		     table1.addCell("To");
		 		     table1.addCell("Quantity");
		 		     table1.addCell("Amount");
		 		    table1.addCell("Machine");
		 		   table1.addCell("Date");
		 		     
		     
		      document.add(table1);
		//System.out.println(li.size());
		  PdfPTable table2 = new PdfPTable(8);
			    
			     table2.setWidthPercentage(100);
			     float[] columnWidths2 = new float[] {3f,15f,7f,7f,8f,6f,8f,8f};
			              table2.setWidths(columnWidths2);
			              table2.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			              table2.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
			              table2.getDefaultCell().setFixedHeight(20);
			              //table2.getDefaultCell().setBackgroundColor(BaseColor.CYAN);
			              System.out.println("1");
			         for(Twowheeler e: li)
			      	    {        
			        	// System.out.println("4");
			              
			     table2.addCell(e.getId().toString());
			     table2.addCell(e.getVehicletype());
			     table2.addCell(e.getFromsno());
			     table2.addCell(e.getTosno());
			     table2.addCell(e.getQuantity());
			     table2.addCell(e.getAmount());
			     table2.addCell(e.getMachine());
			     table2.addCell(e.getDate());
			     
			
			    
			      	  }
			         document.add(table2);
		      document.close();
		            
		    
		  }catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		

}
}
