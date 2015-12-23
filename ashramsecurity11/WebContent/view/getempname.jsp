<%@page language="java" import ="java.sql.*" %>  
 <%  
 String name=request.getParameter("count");
 
 String buffer="";  
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/security","root","tiger");  
 Statement stmt = con.createStatement();  
 //ResultSet rs = stmt.executeQuery("Select * from books where book_name LIKE '"+name+"%'");  
ResultSet rs = stmt.executeQuery("Select emp_name from employee_form where emp_id ='"+name+"'");  
   while(rs.next()){
   buffer=buffer+rs.getString(1)+"<br>";  
   }  
 buffer=buffer+""; 
  
 
 response.getWriter().println(buffer) ;  
  //System.out.println( buffer); 
 %>