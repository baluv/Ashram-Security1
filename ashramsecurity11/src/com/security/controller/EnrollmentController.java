package com.security.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

import com.security.domain.ArtofLiving;
import com.security.domain.EmployeeActivities;
import com.security.domain.EmployeeEducation;
import com.security.domain.EmployeeFamily;
import com.security.domain.EmployeeForm;
import com.security.domain.EmployeeLanguage;
import com.security.domain.EmployeeLeaveDTO;
import com.security.domain.EmployeeRecommendation;
import com.security.domain.EmployeeReferences;
import com.security.domain.EmployeeSalaryDTO;
import com.security.domain.EmployeeWork;
import com.security.domain.FoundItems;
import com.security.domain.G4SSecurity;
import com.security.domain.InhouseSecurity;
import com.security.domain.LeaveApplication;
import com.security.domain.Login;
import com.security.domain.LostItems;
import com.security.domain.PassRegister;
import com.security.domain.Salary;
import com.security.domain.Twowheeler;
import com.security.dto.AgencyDto;
import com.security.dto.InHosueDto;
import com.security.service.EnrollmentService;
import com.security.util.Pdf;
import com.security.util.VehiclePdfReport;


@Controller
@RequestMapping("/security")
public class EnrollmentController {
	
	@Autowired
	public EnrollmentService enrollmentservice;
	
	
private ServletContext servletContext;
	
	@Autowired
    private ServletConfig config;
	
	@RequestMapping(value="/login")
	public String getloginpage()
	{
		System.out.println("In Login Controller");
		return "login";
	}
	
	@RequestMapping(value="/manager_home")
	public String getManager(){
		return "manager_home";
	}
	
	
	
	@RequestMapping(value="/checklogin")
	public String checklogin(@ModelAttribute("login")Login login, Map<String,Object>model,
			HttpServletRequest request,HttpServletResponse response)
	{
		String role1 = request.getParameter("role");
		String username1 = request.getParameter("username");
		
		System.out.println("role1 is: "+role1);
		System.out.println("username1 is: "+username1);
		
		if(role1.equalsIgnoreCase(username1) )
		{
			
		String role=enrollmentservice.getRole(login.getUsername(),login.getPassword());
		System.out.println("role is"+role);
		
		model.put("username", login.getUsername());
		
		String username=request.getParameter("username");
		System.out.println("username:"+username);
		
		HttpSession session=request.getSession(true);
		session.setAttribute("username", username);
		
		if(role.equals("[admin]"))
		
			return "home";
		else if (role.equals("[manager]"))
				
			return "manager_home";
		
		else
			return "login";
	}
		else{
			model.put("msg", "Your Role And Username Does not match");
			return "login";
		}
		
		}
	
	@RequestMapping(value="/logout")
	public String logout()
	{
		return "login";
	}
	
	@RequestMapping(value="/pass_register")
	public String getpassregister(Map<String,Object>model)
	{
		return "pass_register";
	}
	
	@RequestMapping(value="/home")
   public String gethomepage(Map<String,Object>model)
	{
		return "home";
	}
	
	@RequestMapping(value="/user_home")
	public String getuserhomepage(Map<String,Object>model)
		{
			return "user_home";
		}
	
	@RequestMapping(value="/dataoperator_home")
	public String getdataoperatorhomepage(Map<String,Object>model)
		{
			return "dataoperator_home";
		}
	
	@RequestMapping(value="/addemployee")
	public String employee(HttpServletRequest request,HttpServletResponse response)
	{
		
		//HttpSession session=session.setAttribute(username, username);
		return "NewEmployee";
	}
	
	@RequestMapping(value="/dataoperator_addemployee")
	public String dataoperator_Newemployee()
	{
		return "dataoperator_newemployee";
	}
	
	@RequestMapping(value="/saveEmployee", method = RequestMethod.POST)
	public String saveEMployee(/*@RequestParam("emp_photo")
			MultipartFile file,*/	 HttpServletRequest request,Map<String,Object>model, @ModelAttribute("login")Login login, @RequestParam(value = "ImageFile", required = false) MultipartFile image, @RequestParam(value = "ImageFile2", required = false) MultipartFile image2,   @RequestParam(value = "ImageFile3", required = false) MultipartFile image3)throws Exception
	{
		System.out.println("save employee controller");
		
		String role=enrollmentservice.getRole(login.getUsername(),login.getPassword());
		
		System.out.println(role);
		
		model.put("username" ,login.getUsername() );
		//ServletConfig config=getServletConfig();
		
		EmployeeForm empform =new EmployeeForm();
		EmployeeFamily empfamily=new EmployeeFamily();
		EmployeeLanguage emplang=new EmployeeLanguage();
		EmployeeEducation empeducation=new EmployeeEducation();
		EmployeeWork empwork=new EmployeeWork();
		EmployeeActivities empactivities=new EmployeeActivities();
		ArtofLiving artofliving=new ArtofLiving();
		EmployeeRecommendation emprecommendation=new EmployeeRecommendation();
		EmployeeReferences empreferences=new EmployeeReferences();
		
		
		System.out.println("save employeeform");
		
		empform.setEmpname(request.getParameter("empname"));
		
		empform.setEmpname(request.getParameter("empname"));
		
		
		
		System.out.println(empform.getEmpname());
		System.out.println(image);
		
		saveImage(empform.getEmpname() + ".jpg", image);
		String filenam = empform.getEmpname() + ".jpg";
		empform.setImageFile(filenam);
		
				
		
		empform.setEmpdob(request.getParameter("empdob"));
		empform.setEmpgender(request.getParameter("empgender"));
		empform.setEmpfname(request.getParameter("empfname"));
		empform.setEmpfproffession(request.getParameter("empfproffession"));
		empform.setFcontactno(request.getParameter("fcontactno"));
		empform.setEmp_currentaddress(request.getParameter("emp_currentaddress"));
		empform.setEmp_permanentaddress(request.getParameter("emp_permanentaddress"));
		empform.setEmp_hight(request.getParameter("emp_hight"));
		empform.setEmp_weight(request.getParameter("emp_weight"));
		empform.setEmp_mobileno(request.getParameter("emp_mobileno"));
		
		System.out.println("Mobile No:"+request.getParameter("emp_mobileno"));
		empform.setEmp_alternatemobileno(request.getParameter("emp_alternatemobileno"));
		empform.setEmp_email(request.getParameter("emp_email"));
		empform.setEmp_maritalstatus(request.getParameter("emp_maritalstatus"));
		String maritalstatus=request.getParameter("emp_maritalstatus");
		
		
	

		
		//if(noofchilderns==null)
		//{
			
			//empform.setEmp_noofchildrens(0);
		//}
		//else
		//{
			empform.setEmp_noofchildrens(request.getParameter("emp_noofchildrens"));	
		//}
		
		//if(noofsons=="")
		//{
		//	empform.setEmp_noofsons(0);
		//}
		//else
		//{
		empform.setEmp_noofsons(request.getParameter("emp_noofsons"));
		empform.setEmp_sonage(request.getParameter("emp_sonage"));
		empform.setEmp_noofdaughters(request.getParameter("emp_noofdaughters"));			
		empform.setEmp_daughterage(request.getParameter("emp_daughterage"));
		empform.setEmp_date(request.getParameter("emp_date"));
		empform.setEmp_place(request.getParameter("emp_place"));
		empform.setEmp_probation_period(request.getParameter("probationperiod"));
		empform.setEmp_department(request.getParameter("deptpost"));
		empform.setEmp_designation(request.getParameter("employee_designation"));
		empform.setEmp_expected_joining_date(request.getParameter("joiningdate"));
	    empform.setJoinedon(request.getParameter("joineddate"));
	    empform.setEmp_office_supervisor(request.getParameter("officesupervisor"));
	    empform.setEmp_head_training(request.getParameter("security"));
	    empform.setEmp_head_training(request.getParameter("sdepartment"));
	   
	    empform.setEmpstatus(empform.getEmpstatus());
	  
	    empform.setEmployee_salary(Integer.parseInt(request.getParameter("employee_salary")));
	   
	    empform.setEmp_rejoined_date(request.getParameter("emp_rejoined_date"));
	    empform.setCategory(request.getParameter("category"));
	   // empform.setRollno(Integer.parseInt(request.getParameter("Roll_no")));
	    empform.setRollno(request.getParameter("Roll_no"));
	    
	    System.out.println("dob Name------->"+empform.getEmpdob());
		System.out.println("hight Name------->"+empform.getEmp_hight());
	  
	    saveImage2(empform.getRollno() + ".jpg", image2);
		String filename = empform.getRollno() + ".jpg";
		System.out.println("Image Name------->"+filename);
		empform.setImageFile2(filename);
		
		saveImage3(empform.getEmp_currentaddress() + ".jpg", image3);
		String filename1 = empform.getEmp_currentaddress() + ".jpg";
		System.out.println("Image Name------->"+filename);
		empform.setImageFile3(filename1);
	    
		enrollmentservice.insertEmployee(empform);
		
		System.out.println(empform.getEmpid());
	
		/*String[] id=request.getParameterValues("id");
		String[] familymembers=request.getParameterValues("familymembers");
		String[] relationship=request.getParameterValues("reltionship");
		String[] occupation=request.getParameterValues("occupation");
		String[] age=request.getParameterValues("age");
		for(int i=0;i<id.length;i++)
		{
			empfamily.setEmp_fname(familymembers[i]);
			empfamily.setEmp_relationship(relationship[i]);
			empfamily.setEmp_foccupation(occupation[i]);
			empfamily.setEmp_fage(age[i]);
			
		}*/
		System.out.println("save family");
		empfamily.setEmpid(empform.getEmpid());
		empfamily.setEmp_fname(request.getParameter("familymembers"));
		empfamily.setEmp_relationship(request.getParameter("reltionship"));
		empfamily.setEmp_foccupation(request.getParameter("occupation"));
		empfamily.setEmp_fage(request.getParameter("age"));
		enrollmentservice.insertEmpFamily(empfamily);
		System.out.println("one record saved succesfully");
		//empfamily.setEmpid(empform.getEmpid());
		empfamily.setEmp_fname(request.getParameter("familymembers1"));
		empfamily.setEmp_relationship(request.getParameter("reltionship1"));
		empfamily.setEmp_foccupation(request.getParameter("occupation1"));
		empfamily.setEmp_fage(request.getParameter("age1"));
		enrollmentservice.insertEmpFamily(empfamily);
		System.out.println("second record saved succesfully");
		System.out.println("save languages");
		emplang.setEmpid(empform.getEmpid());
		
		
		emplang.setEmp_lang_known(request.getParameter("languagesknown"));
		if(request.getParameter("read")==null)
		{
			emplang.setEmp_lang_read("off");
		}
		else
		{
		emplang.setEmp_lang_read(request.getParameter("read"));
		}
		if(request.getParameter("speak")==null)
		{
			emplang.setEmp_lang_speak("off");	
		}
		else
		{
		emplang.setEmp_lang_speak(request.getParameter("speak"));
		}
		if(request.getParameter("write")==null)
		{
			emplang.setEmp_lang_write("off");
		}
		else
		{
		emplang.setEmp_lang_write(request.getParameter("write"));
		}
		emplang.setEmp_lang_level(request.getParameter("remarks"));
		enrollmentservice.saveEmpLang(emplang);
		emplang.setEmp_lang_known(request.getParameter("languagesknown1"));
		if(request.getParameter("read1")==null)
		{
			emplang.setEmp_lang_read("off");
		}
		else
		{
		emplang.setEmp_lang_read(request.getParameter("read1"));
		}
		if(request.getParameter("speak1")==null)
		{
			emplang.setEmp_lang_speak("off");
		}
		else
		{
		emplang.setEmp_lang_speak(request.getParameter("speak1"));
		}
		if(request.getParameter("write1")==null)
		{
			emplang.setEmp_lang_write("off");
		}
		else
		{
		emplang.setEmp_lang_write(request.getParameter("write1"));
		}
		emplang.setEmp_lang_level(request.getParameter("remarks1"));
		enrollmentservice.saveEmpLang(emplang);
		emplang.setEmp_lang_known(request.getParameter("languagesknown2"));
		if(request.getParameter("read2")==null)
		{
			emplang.setEmp_lang_read("off");
		}
		else
		{
		emplang.setEmp_lang_read(request.getParameter("read2"));
		}
		if(request.getParameter("speak2")==null)
		{
			emplang.setEmp_lang_speak("off");
		}
		else
		{
		emplang.setEmp_lang_speak(request.getParameter("speak2"));
		}
		if(request.getParameter("write2")==null)
		{
			emplang.setEmp_lang_write("off");
		}
		else
		{
		emplang.setEmp_lang_write(request.getParameter("write2"));
		}
		emplang.setEmp_lang_level(request.getParameter("remarks2"));
		enrollmentservice.saveEmpLang(emplang);
		
		System.out.println("save education");
		empeducation.setEmpid(empform.getEmpid());
		empeducation.setEmp_exam_passed(request.getParameter("examinationpassed"));
		empeducation.setEmp_institute(request.getParameter("nameofschool"));
		empeducation.setEmp_duration_course(request.getParameter("duration"));
		empeducation.setEmp_yearofpass(request.getParameter("yearofpassing"));
		empeducation.setEmp_percentage(request.getParameter("percentage"));
		enrollmentservice.saveEmpEducation(empeducation);
		empeducation.setEmp_exam_passed(request.getParameter("examinationpassed1"));
		empeducation.setEmp_institute(request.getParameter("nameofschool1"));
		empeducation.setEmp_duration_course(request.getParameter("duration1"));
		empeducation.setEmp_yearofpass(request.getParameter("yearofpassing1"));
		empeducation.setEmp_percentage(request.getParameter("percentage1"));
		enrollmentservice.saveEmpEducation(empeducation);
		
		System.out.println("save work");
		empwork.setEmpid(empform.getEmpid());
		
		empwork.setEmp_company_name(request.getParameter("comapanyaddress"));
		System.out.print("designation"+request.getParameter("designation"));
		empwork.setEmp_designation(request.getParameter("designation"));
		System.out.print("salary"+request.getParameter("salary"));
		empwork.setEmp_sal(request.getParameter("salary"));
		System.out.print("fromto"+request.getParameter("fromto"));
		empwork.setEmp_period(request.getParameter("fromto"));
		System.out.print("reason"+request.getParameter("reason"));
		empwork.setEmp_leavejob(request.getParameter("reason"));
		enrollmentservice.saveEmpWork(empwork);
		
		empwork.setEmp_company_name(request.getParameter("comapanyaddress1"));
		System.out.print("designation1"+request.getParameter("designation1"));
		empwork.setEmp_designation(request.getParameter("designation1"));
		System.out.print("salary1"+request.getParameter("salary1"));
		empwork.setEmp_sal(request.getParameter("salary1"));
		System.out.print("fromto1"+request.getParameter("fromto1"));
		empwork.setEmp_period(request.getParameter("fromto1"));
		System.out.print("reason1"+request.getParameter("reason1"));
		empwork.setEmp_leavejob(request.getParameter("reason1"));
		enrollmentservice.saveEmpWork(empwork);
		
		System.out.println("save activities");
		empactivities.setEmpid(empform.getEmpid());
		empactivities.setActivitytype(request.getParameter("activities"));
		empactivities.setEmp_atschool(request.getParameter("atschool"));
		empactivities.setEmp_atcollege(request.getParameter("atcollege"));
		empactivities.setEmp_later(request.getParameter("later"));
		enrollmentservice.saveEmpActivity(empactivities);
		empactivities.setActivitytype(request.getParameter("activities1"));
		empactivities.setEmp_atschool(request.getParameter("atschool1"));
		empactivities.setEmp_atcollege(request.getParameter("atcollege1"));
		empactivities.setEmp_later(request.getParameter("later1"));
		enrollmentservice.saveEmpActivity(empactivities);
		
		System.out.println("save artofliving");
		artofliving.setEmpid(empform.getEmpid());
		artofliving.setEmp_course(request.getParameter("course"));
		artofliving.setEmp_location(request.getParameter("location")); 
		artofliving.setEmp_teacher(request.getParameter("teacher"));
		artofliving.setEmp_date(request.getParameter("date"));
		artofliving.setEmp_remarks(request.getParameter("artoflivingremarks"));
		enrollmentservice.saveArtofliving(artofliving);
		artofliving.setEmp_course(request.getParameter("course1"));
		artofliving.setEmp_location(request.getParameter("location1"));
		artofliving.setEmp_teacher(request.getParameter("teacher1"));
		artofliving.setEmp_date(request.getParameter("date1"));
		artofliving.setEmp_remarks(request.getParameter("artoflivingremarks1"));
		enrollmentservice.saveArtofliving(artofliving);
		
		System.out.println("save emprecommendation");
		emprecommendation.setEmpid(empform.getEmpid());
		emprecommendation.setEmp_name_address(request.getParameter("tname"));
		emprecommendation.setEmp_teachercode(request.getParameter("tcode"));
		emprecommendation.setEmp_teacher_mobile(request.getParameter("tmobilenumber"));
		emprecommendation.setEmp_teacher_email(request.getParameter("temailid"));
		enrollmentservice.saveEmployeeRecommendation(emprecommendation);
		
		System.out.println("save empreferences");
		empreferences.setEmpid(empform.getEmpid());
		empreferences.setEmp_ref_name(request.getParameter("rname"));
		empreferences.setEmp_ref_address(request.getParameter("raddress"));
		empreferences.setEmp_ref_mobile(request.getParameter("pcontactno"));
		empreferences.setEmp_ref_emailid(request.getParameter("refemailid"));
		System.out.println("refemail"+request.getParameter("refemailid"));
		enrollmentservice.saveEmployeeReferences(empreferences);
		empreferences.setEmp_ref_name(request.getParameter("rname1"));
		empreferences.setEmp_ref_address(request.getParameter("raddress1"));
		
		
		empreferences.setEmp_ref_mobile(request.getParameter("pcontactno1"));
		empreferences.setEmp_ref_emailid(request.getParameter("refemailid1"));
		System.out.println("refemail1"+request.getParameter("refemailid1"));
		enrollmentservice.saveEmployeeReferences(empreferences);
	    model.put("msg","Employee registered Successfully");
		return "NewEmployee";
	}
	
	private void saveImage(String filename, MultipartFile image)
			throws RuntimeException, IOException {
		try {
			System.out.println(filename);
		
			File savedFile = new File(config.getServletContext().getRealPath("/")+"\\view\\images\\"+filename);
			System.out.println(savedFile);
			//File file = new File("C:/Documents and Settings/user/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/LatestSecurityproject2/view/images/"
			//		+ filename);
			//System.out.println(file);
			File out = new File("hai.txt");
		     out.createNewFile();
		     
		     
           
			FileUtils.writeByteArrayToFile(savedFile, image.getBytes());
			System.out.println("Go to the location:  " + savedFile.toString()
					+ " on your computer and verify that the image has been stored.");
		} catch (IOException e) {
			throw e;
		}
	}
	
	private void saveImage2(String filename, MultipartFile image2)
	throws RuntimeException, IOException {
try {
	System.out.println(filename);

	File savedFile = new File(config.getServletContext().getRealPath("/")+"\\view\\images\\"+filename);
	System.out.println(savedFile);
	//File file = new File("C:/Documents and Settings/user/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/LatestSecurityproject2/view/images/"
	//		+ filename);
	//System.out.println(file);
	File out = new File("hai.txt");
     out.createNewFile();
   
	FileUtils.writeByteArrayToFile(savedFile, image2.getBytes());
	System.out.println("Go to the location:  " + savedFile.toString()
			+ " on your computer and verify that the image has been stored.");
} catch (IOException e) {
	throw e;
}
}
	private void saveImage3(String filename, MultipartFile image3)
	throws RuntimeException, IOException {
try {
	System.out.println(filename);

	File savedFile = new File(config.getServletContext().getRealPath("/")+"\\view\\images\\"+filename);
	System.out.println(savedFile);
	//File file = new File("C:/Documents and Settings/user/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp3/wtpwebapps/LatestSecurityproject2/view/images/"
	//		+ filename);
	//System.out.println(file);
	File out = new File("hai.txt");
     out.createNewFile();
   
	FileUtils.writeByteArrayToFile(savedFile, image3.getBytes());
	System.out.println("Go to the location:  " + savedFile.toString()
			+ " on your computer and verify that the image has been stored.");
} catch (IOException e) {
	throw e;
}
}
	
	
	@RequestMapping(value="/savedataoperatorEmployee")
	public String savedataoperatorEMployee(/*@RequestParam("emp_photo")
			MultipartFile file,*/HttpServletRequest request,Map<String,Object>model)throws Exception
	{
		
		
		EmployeeForm empform =new EmployeeForm();
		EmployeeFamily empfamily=new EmployeeFamily();
		EmployeeLanguage emplang=new EmployeeLanguage();
		EmployeeEducation empeducation=new EmployeeEducation();
		EmployeeWork empwork=new EmployeeWork();
		EmployeeActivities empactivities=new EmployeeActivities();
		ArtofLiving artofliving=new ArtofLiving();
		EmployeeRecommendation emprecommendation=new EmployeeRecommendation();
		EmployeeReferences empreferences=new EmployeeReferences();
		System.out.println("save employeeform");
		/*try {
			Blob blob = Hibernate.createBlob(file.getInputStream());
			System.out.println(blob);
			empform.setEmp_photo(blob);
		} catch (IOException e) {\z
			e.printStackTrace();
		}*/
		
		
		empform.setEmpname(request.getParameter("empname"));
		empform.setEmpdob(request.getParameter("empdob"));
		empform.setEmpgender(request.getParameter("empgender"));
		empform.setEmpfname(request.getParameter("empfname"));
		empform.setEmpfproffession(request.getParameter("empfproffession"));
		empform.setFcontactno(request.getParameter("fcontactno"));
		empform.setEmp_hight(request.getParameter("emphight"));
		empform.setEmp_weight(request.getParameter("empweight"));
		empform.setEmp_currentaddress(request.getParameter("emp_currentaddress"));
		empform.setEmp_permanentaddress(request.getParameter("emp_permanentaddress"));
		empform.setEmp_mobileno(request.getParameter(request.getParameter("emp_mobileno")));
		empform.setEmp_alternatemobileno(request.getParameter("emp_alternatemobileno"));
		empform.setEmp_email(request.getParameter("emp_email"));
		empform.setEmp_maritalstatus(request.getParameter("emp_maritalstatus"));
		String maritalstatus=request.getParameter("emp_maritalstatus");
		System.out.println(maritalstatus);
		
	String noofchilderns=request.getParameter("emp_noofchildrens");
		System.out.println("no of childrens"+noofchilderns);
		
		//if(noofchilderns==null)
		//{
			
			//empform.setEmp_noofchildrens(0);
		//}
		//else
		//{
			empform.setEmp_noofchildrens(request.getParameter("emp_noofchildrens"));	
		//}
		String noofsons=request.getParameter("emp_noofsons");
		System.out.println(noofsons);
		//if(noofsons=="")
		//{
		//	empform.setEmp_noofsons(0);
		//}
		//else
		//{
			empform.setEmp_noofsons(request.getParameter("emp_noofsons"));
		//}
	
		empform.setEmp_sonage(request.getParameter("emp_sonage"));
		String noofdaughters=request.getParameter("emp_noofdaughters");
		System.out.println(noofdaughters);
		//if(noofdaughters=="")
		//{
		//	empform.setEmp_noofdaughters(0);
		//}
		//else
		//{
			empform.setEmp_noofdaughters(request.getParameter("emp_noofdaughters"));
		//}
		
		empform.setEmp_daughterage(request.getParameter("emp_daughterage"));
		empform.setEmp_date(request.getParameter("emp_date"));
		empform.setEmp_place(request.getParameter("emp_place"));
		empform.setEmp_probation_period(request.getParameter("probationperiod"));
		empform.setEmp_department(request.getParameter("deptpost"));
		empform.setEmp_designation(request.getParameter("designation"));
		empform.setEmp_expected_joining_date(request.getParameter("joiningdate"));
	    empform.setJoinedon(request.getParameter("joineddate"));
	    empform.setEmp_office_supervisor(request.getParameter("officesupervisor"));
	    empform.setEmp_head_training(request.getParameter("security"));
	    empform.setEmp_head_training(request.getParameter("sdepartment"));
	    System.out.println("default status"+empform.getEmpstatus());
	    empform.setEmpstatus(empform.getEmpstatus());
	    empform.setEmp_rejoined_date(request.getParameter("emp_rejoined_date"));
		
		enrollmentservice.insertEmployee(empform);
		System.out.println(empform.getEmpid());
	
		/*String[] id=request.getParameterValues("id");
		String[] familymembers=request.getParameterValues("familymembers");
		String[] relationship=request.getParameterValues("reltionship");
		String[] occupation=request.getParameterValues("occupation");
		String[] age=request.getParameterValues("age");
		for(int i=0;i<id.length;i++)
		{
			empfamily.setEmp_fname(familymembers[i]);
			empfamily.setEmp_relationship(relationship[i]);
			empfamily.setEmp_foccupation(occupation[i]);
			empfamily.setEmp_fage(age[i]);
			
		}*/
		System.out.println("save family");
		empfamily.setEmpid(empform.getEmpid());
		empfamily.setEmp_fname(request.getParameter("familymembers"));
		empfamily.setEmp_relationship(request.getParameter("reltionship"));
		empfamily.setEmp_foccupation(request.getParameter("occupation"));
		empfamily.setEmp_fage(request.getParameter("age"));
	enrollmentservice.insertEmpFamily(empfamily);
		System.out.println("one record saved succesfully");
		//empfamily.setEmpid(empform.getEmpid());
		empfamily.setEmp_fname(request.getParameter("familymembers1"));
		empfamily.setEmp_relationship(request.getParameter("reltionship1"));
		empfamily.setEmp_foccupation(request.getParameter("occupation1"));
		empfamily.setEmp_fage(request.getParameter("age1"));
		enrollmentservice.insertEmpFamily(empfamily);
		System.out.println("second record saved succesfully");
		System.out.println("save languages");
		emplang.setEmpid(empform.getEmpid());
		
		
		emplang.setEmp_lang_known(request.getParameter("languagesknown"));
		if(request.getParameter("read")==null)
		{
			emplang.setEmp_lang_read("off");
		}
		else
		{
		emplang.setEmp_lang_read(request.getParameter("read"));
		}
		if(request.getParameter("speak")==null)
		{
			emplang.setEmp_lang_speak("off");	
		}
		else
		{
		emplang.setEmp_lang_speak(request.getParameter("speak"));
		}
		if(request.getParameter("write")==null)
		{
			emplang.setEmp_lang_write("off");
		}
		else
		{
		emplang.setEmp_lang_write(request.getParameter("write"));
		}
		emplang.setEmp_lang_level(request.getParameter("remarks"));
		enrollmentservice.saveEmpLang(emplang);
		emplang.setEmp_lang_known(request.getParameter("languagesknown1"));
		if(request.getParameter("read1")==null)
		{
			emplang.setEmp_lang_read("off");
		}
		else
		{
		emplang.setEmp_lang_read(request.getParameter("read1"));
		}
		if(request.getParameter("speak1")==null)
		{
			emplang.setEmp_lang_speak("off");
		}
		else
		{
		emplang.setEmp_lang_speak(request.getParameter("speak1"));
		}
		if(request.getParameter("write1")==null)
		{
			emplang.setEmp_lang_write("off");
		}
		else
		{
		emplang.setEmp_lang_write(request.getParameter("write1"));
		}
		emplang.setEmp_lang_level(request.getParameter("remarks1"));
		enrollmentservice.saveEmpLang(emplang);
		emplang.setEmp_lang_known(request.getParameter("languagesknown2"));
		if(request.getParameter("read2")==null)
		{
			emplang.setEmp_lang_read("off");
		}
		else
		{
		emplang.setEmp_lang_read(request.getParameter("read2"));
		}
		if(request.getParameter("speak2")==null)
		{
			emplang.setEmp_lang_speak("off");
		}
		else
		{
		emplang.setEmp_lang_speak(request.getParameter("speak2"));
		}
		if(request.getParameter("write2")==null)
		{
			emplang.setEmp_lang_write("off");
		}
		else
		{
		emplang.setEmp_lang_write(request.getParameter("write2"));
		}
		emplang.setEmp_lang_level(request.getParameter("remarks2"));
		enrollmentservice.saveEmpLang(emplang);
		
		System.out.println("save education");
		empeducation.setEmpid(empform.getEmpid());
		empeducation.setEmp_exam_passed(request.getParameter("examinationpassed"));
		empeducation.setEmp_institute(request.getParameter("nameofschool"));
		empeducation.setEmp_duration_course(request.getParameter("duration"));
		empeducation.setEmp_yearofpass(request.getParameter("yearofpassing"));
		empeducation.setEmp_percentage(request.getParameter("percentage"));
		enrollmentservice.saveEmpEducation(empeducation);
		empeducation.setEmp_exam_passed(request.getParameter("examinationpassed1"));
		empeducation.setEmp_institute(request.getParameter("nameofschool1"));
		empeducation.setEmp_duration_course(request.getParameter("duration1"));
		empeducation.setEmp_yearofpass(request.getParameter("yearofpassing1"));
		empeducation.setEmp_percentage(request.getParameter("percentage1"));
		enrollmentservice.saveEmpEducation(empeducation);
		
		System.out.println("save work");
		empwork.setEmpid(empform.getEmpid());
		empwork.setEmp_company_name(request.getParameter("comapanyaddress"));
		empwork.setEmp_designation(request.getParameter("designation"));
		empwork.setEmp_sal(request.getParameter("salary"));
		empwork.setEmp_period(request.getParameter("fromto"));
		empwork.setEmp_leavejob(request.getParameter("reason"));
		enrollmentservice.saveEmpWork(empwork);
		empwork.setEmp_company_name(request.getParameter("comapanyaddress1"));
		empwork.setEmp_designation(request.getParameter("designation1"));
		empwork.setEmp_sal(request.getParameter("salary1"));
		empwork.setEmp_period(request.getParameter("fromto1"));
		empwork.setEmp_leavejob(request.getParameter("reason1"));
		enrollmentservice.saveEmpWork(empwork);
		
		System.out.println("save activities");
		empactivities.setEmpid(empform.getEmpid());
		empactivities.setActivitytype(request.getParameter("activities"));
		empactivities.setEmp_atschool(request.getParameter("atschool"));
		empactivities.setEmp_atcollege(request.getParameter("atcollege"));
		empactivities.setEmp_later(request.getParameter("later"));
		enrollmentservice.saveEmpActivity(empactivities);
		empactivities.setActivitytype(request.getParameter("activities1"));
		empactivities.setEmp_atschool(request.getParameter("atschool1"));
		empactivities.setEmp_atcollege(request.getParameter("atcollege1"));
		empactivities.setEmp_later(request.getParameter("later1"));
		enrollmentservice.saveEmpActivity(empactivities);
		
		System.out.println("save artofliving");
		artofliving.setEmpid(empform.getEmpid());
		artofliving.setEmp_course(request.getParameter("course"));
		artofliving.setEmp_location(request.getParameter("location"));
		artofliving.setEmp_teacher(request.getParameter("teacher"));
		artofliving.setEmp_date(request.getParameter("date"));
		artofliving.setEmp_remarks(request.getParameter("artoflivingremarks"));
		enrollmentservice.saveArtofliving(artofliving);
		artofliving.setEmp_course(request.getParameter("course1"));
		artofliving.setEmp_location(request.getParameter("location1"));
		artofliving.setEmp_teacher(request.getParameter("teacher1"));
		artofliving.setEmp_date(request.getParameter("date1"));
		artofliving.setEmp_remarks(request.getParameter("artoflivingremarks1"));
		enrollmentservice.saveArtofliving(artofliving);
		
		System.out.println("save emprecommendation");
		emprecommendation.setEmpid(empform.getEmpid());
		emprecommendation.setEmp_name_address(request.getParameter("tname"));
		emprecommendation.setEmp_teachercode(request.getParameter("tcode"));
		emprecommendation.setEmp_teacher_mobile(request.getParameter("tmobilenumber"));
		emprecommendation.setEmp_teacher_email(request.getParameter("temailid"));
		enrollmentservice.saveEmployeeRecommendation(emprecommendation);
		
		System.out.println("save empreferences");
		empreferences.setEmpid(empform.getEmpid());
		empreferences.setEmp_ref_name(request.getParameter("rname"));
		empreferences.setEmp_ref_address(request.getParameter("raddress"));
		empreferences.setEmp_ref_mobile(request.getParameter("pcontactno"));
		empreferences.setEmp_ref_emailid(request.getParameter("refemailid"));
		System.out.println("refemail"+request.getParameter("refemailid"));
		enrollmentservice.saveEmployeeReferences(empreferences);
		empreferences.setEmp_ref_name(request.getParameter("rname1"));
		empreferences.setEmp_ref_address(request.getParameter("raddress1"));
		empreferences.setEmp_ref_mobile(request.getParameter("pcontactno1"));
		empreferences.setEmp_ref_emailid(request.getParameter("refemailid1"));
		System.out.println("refemail1"+request.getParameter("refemailid1"));
		enrollmentservice.saveEmployeeReferences(empreferences);
	model.put("msg","Employee registered Successfully");
		return "dataoperator_newemployee";
	}
	
	@RequestMapping("/employeelist")
	public String getEmpList(Map<String,Object>model,@RequestParam("empname")String empname)
	{
		List<EmployeeForm> list=enrollmentservice.getEmployeeList(empname);
		for(EmployeeForm list1:list)
		{
			System.out.println(list1.getEmpfname());
		}
		model.put("list",list);
		return "employeeDetails";
	}
/*	@RequestMapping("/download/{empid}")
	public String download(@PathVariable("empid")
	Integer empid, HttpServletResponse response) {

		List<EmployeeForm> emplist = enrollmentservice.getemp(empid);
		Iterator it=emplist.iterator();
		while(it.hasNext())
		{
			EmployeeForm empform=(EmployeeForm)it.next();
		try {
			response.setHeader("Content-Disposition", "inline;filename=\""
					+ empform.getEmpname() + "\"");
			OutputStream out = response.getOutputStream();
			response.setContentType(empform.getEmpname());
			IOUtils.copy(empform.getEmp_photo().getBinaryStream(), out);
			out.flush();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
		return null;
	}*/

	@RequestMapping("/employeedetails")
	public String getEmpDetails(Map<String,Object>model)
	{
		List<EmployeeForm> list=enrollmentservice.getEmployeeDetails();
		
		model.put("list", list);
		
		return "employeeDetails";
		
	}
	
	@RequestMapping("/user_employeedetails")
	public String getUserEmpDetails(Map<String,Object>model)
	{
		List<EmployeeForm> list=enrollmentservice.getEmployeeDetails();
		
		model.put("list", list);
		
		return "user_employee_details";
		
	}
	
	
	
	@RequestMapping("/deleteEmployee")
	public String deleteEmployee(@RequestParam("empid")int empid,Map<String,Object>model)
	
	{
		enrollmentservice.deleteEmployee(empid);
		List<EmployeeForm> list=enrollmentservice.getEmployeeDetails();
		model.put("list", list);
		return "employeeDetails";
		
	}
	
	@RequestMapping(value="/updateEmployee")
	public String updateEmployee(@RequestParam("empid")int empid,Map<String,Object>model,HttpServletRequest request)
	{
		System.out.println("welcome to update employee");
		EmployeeForm empform=enrollmentservice.employeeDetails(empid);
		//EmployeeLanguage emplanguage=enrollmentservice.employeeLanguage(empform.getEmpid());
		model.put("empid",empform.getEmpid());
		model.put("empname",empform.getEmpname());
		
		String image123=empform.getImageFile();
		System.out.println("image name in controller:"+image123);
		System.out.println("image name in controller:"+empform.getImageFile2());
		System.out.println("image name in controller:"+empform.getImageFile3());
		
		System.out.println("hi u r in update emplyee controller class");
		
		System.out.println("image file:"+empform.getImageFile()+"image file2:"+empform.getImageFile2()+"image file3:"+empform.getImageFile3());
		
		model.put("empimage", empform.getImageFile());
		model.put("empsidephoto", empform.getImageFile2());
		model.put("empthumbphoto", empform.getImageFile3());
		
		model.put("dob",empform.getEmpdob());
	    model.put("gender", empform.getEmpgender());
		model.put("fname",empform.getEmpfname());
	    model.put("faddress",empform.getEmpfproffession());
		model.put("fcontact",empform.getFcontactno());
		model.put("emphight", empform.getEmp_hight());
		model.put("empweight", empform.getEmp_weight());
		model.put("currentaddress",empform.getEmp_currentaddress());
		model.put("mobilenumber",empform.getEmp_mobileno());
		model.put("permanentaddress",empform.getEmp_permanentaddress());
				
		System.out.println("emp name in controller:"+empform.getEmpname());
		System.out.println("Mobile No in controller:"+empform.getEmp_mobileno());
		
		model.put("alternatemobile",empform.getEmp_alternatemobileno());
		model.put("email",empform.getEmp_email());
		model.put("maritalstatus",empform.getEmp_maritalstatus());
		model.put("noofchildrens",empform.getEmp_noofchildrens());
		model.put("noofsons",empform.getEmp_noofsons());
		model.put("sonage",empform.getEmp_sonage());
		model.put("noofdaughters", empform.getEmp_noofdaughters());
		model.put("daughterage",empform.getEmp_daughterage());
		model.put("empdate",empform.getEmp_date());
		model.put("empplace",empform.getEmp_place());
		model.put("probation",empform.getEmp_probation_period());
		model.put("deptpost",empform.getEmp_department());
		model.put("designation",empform.getEmp_designation());
		model.put("expecteddate",empform.getEmp_expected_joining_date());
		model.put("joinedon",empform.getJoinedon());
		model.put("rejoineddate",empform.getEmp_rejoined_date());
		model.put("officesupervisor",empform.getEmp_office_supervisor());
		model.put("training",empform.getEmp_head_training());
		model.put("security",empform.getEmp_head_ashram_security());
		
		
		
		
		model.put("empstatus",empform.getEmpstatus());
		model.put("empsalary",empform.getEmployee_salary());
		model.put("rollno",empform.getRollno());
		
		System.out.println("employee status:"+empform.getEmpstatus());
		
		
		
		
		model.put("list",enrollmentservice.employeeFamilyDetails(empform.getEmpid()));
		//EmployeeLanguage emplanguage=enrollmentservice.employeeLanguage(empid);
		/*model.put("empid",empform.getEmpid());
		model.put("id",emplanguage.getId());
		model.put("languageknown",emplanguage.getEmp_lang_known());
		model.put("speak",emplanguage.getEmp_lang_speak());
		model.put("read",emplanguage.getEmp_lang_read());
		model.put("write",emplanguage.getEmp_lang_write());
		model.put("level",emplanguage.getEmp_lang_level());
		System.out.println("hai" +emplanguage.getEmpid());
		System.out.println("hai" +emplanguage.getId());
		System.out.println("hai" +emplanguage.getEmp_lang_known());
		System.out.println("hai" +emplanguage.getEmp_lang_speak());
		System.out.println("hai" +emplanguage.getEmp_lang_read());
		System.out.println("hai" +emplanguage.getEmp_lang_write());*/
		model.put("educationlist",enrollmentservice.employeeEducation(empform.getEmpid()));
	    model.put("languagelist", enrollmentservice.employeeLanguage(empform.getEmpid()));
	    model.put("worklist", enrollmentservice.employeeWork(empform.getEmpid()));
        model.put("artoflivinglist", enrollmentservice.employeeArtofliving(empform.getEmpid()));
		model.put("activitieslist", enrollmentservice.employeeActivity(empform.getEmpid()));
		model.put("recommendationlist",enrollmentservice.empRecommendation(empform.getEmpid()));
		model.put("referencelist",enrollmentservice.empReferences(empform.getEmpid()));
		return "EmployeeUpdate";
		
	}
	
@RequestMapping(value="/employeeUpdated",method = RequestMethod.POST)
	public String employeeUpdated(Map<String,Object>model,HttpServletRequest request,@RequestParam(value = "ImageFile", required = false) MultipartFile image, @RequestParam(value = "ImageFile2", required = false) MultipartFile image2,   @RequestParam(value = "ImageFile3", required = false) MultipartFile image3) throws Exception
	{
	EmployeeForm empform =new EmployeeForm();
	EmployeeFamily empfamily=new EmployeeFamily();
	EmployeeLanguage emplanguage=new EmployeeLanguage();
	EmployeeEducation empeducation=new EmployeeEducation();
	EmployeeWork empwork=new EmployeeWork();
	EmployeeActivities empactivities=new EmployeeActivities();
	ArtofLiving artofliving=new ArtofLiving();
	EmployeeRecommendation emprecommendation=new EmployeeRecommendation();
	EmployeeReferences empreferences=new EmployeeReferences();
	System.out.println("before employeeform updated");
		
		empform.setEmpid(Integer.parseInt(request.getParameter("empid")));
		empform.setEmpname(request.getParameter("empname"));
		
		System.out.println("employee name in employeeUpdated controller:"+empform.getEmpname());
		
		/**
		saveImage(empform.getEmpname() + ".jpg", image);
		String filenam = empform.getEmpname() + ".jpg";
		empform.setImageFile(filenam);
		***/
		empform.setEmpdob(request.getParameter("empdob"));
		empform.setEmpgender(request.getParameter("empgender"));
		empform.setEmpfname(request.getParameter("empfname"));
		empform.setEmpfproffession(request.getParameter("empfproffession"));
		empform.setFcontactno(request.getParameter("fcontactno"));
		
		empform.setEmp_hight(request.getParameter("emp_hight"));
		empform.setEmp_weight(request.getParameter("emp_weight"));
		
		empform.setRollno(request.getParameter("rollno"));
		//System.out.println("Roll No:"+request.getParameter("rollno"));
		empform.setEmp_currentaddress(request.getParameter("emp_currentaddress"));
		empform.setEmp_permanentaddress(request.getParameter("emp_permanentaddress"));
		empform.setEmp_mobileno(request.getParameter("emp_mobileno"));
		
		System.out.println("Emp Mobile No In employeeUpdated controller:::"+request.getParameter("emp_mobileno"));
		
		empform.setEmp_alternatemobileno(request.getParameter("emp_alternatemobileno"));
		empform.setEmp_email(request.getParameter("emp_email"));
	empform.setEmp_maritalstatus(request.getParameter("emp_maritalstatus"));
	empform.setEmp_noofchildrens(request.getParameter("emp_noofchildrens"));
	empform.setEmp_noofsons(request.getParameter("emp_noofsons"));
	empform.setEmp_sonage(request.getParameter("emp_sonage"));
	empform.setEmp_noofdaughters(request.getParameter("emp_noofdaughters"));
	empform.setEmp_daughterage(request.getParameter("emp_daughterage"));
	
	empform.setEmp_date(request.getParameter("emp_date"));
	empform.setEmp_place(request.getParameter("emp_place"));
	empform.setEmp_probation_period(request.getParameter("probationperiod"));
	empform.setEmp_department(request.getParameter("deptpost"));
	empform.setEmp_designation(request.getParameter("employee_designation"));
	empform.setEmp_expected_joining_date(request.getParameter("joiningdate"));
	empform.setJoinedon(request.getParameter("joineddate"));
	empform.setEmp_rejoined_date(request.getParameter("emp_rejoined_date"));
	System.out.println("updated rejoineddate"+request.getParameter("emp_rejoined_date"));
	empform.setEmp_office_supervisor(request.getParameter("officesupervisor"));
	empform.setEmp_head_ashram_security(request.getParameter("security"));
	empform.setEmp_head_training(request.getParameter("training"));
	empform.setEmployee_salary(Integer.parseInt(request.getParameter("employee_salary")));
	System.out.println("while updating employee status"+request.getParameter("empstatus"));
	empform.setEmpstatus(request.getParameter("empstatus"));
	
	/**
	 	saveImage2(empform.getEmpdob() + ".jpg", image2);
		String filename = empform.getEmpdob() + ".jpg";
		System.out.println("Image Name------->"+filename);
		empform.setImageFile2(filename);
		
		saveImage3(empform.getEmp_hight() + ".jpg", image3);
		String filename1 = empform.getEmp_hight() + ".jpg";
		System.out.println("Image Name------->"+filename);
		empform.setImageFile3(filename1);
	**/
		//String maritalstatus=request.getParameter("emp_maritalstatus");
		enrollmentservice.updateEmployee(empform);
		System.out.println("after employeeform updated");
		
		
		String[] id=request.getParameterValues("familyid");
		String[] fname=request.getParameterValues("familymembers");
		String[] relationship=request.getParameterValues("reltionship");
		String[] occupation=request.getParameterValues("occupation");
		String[] age=request.getParameterValues("age");
		for(int i=0;i<id.length;i++)
		{
		empfamily.setEmpid(empform.getEmpid());
		empfamily.setId(Integer.parseInt(id[i]));
		empfamily.setEmp_fname(fname[i]);
		empfamily.setEmp_relationship(relationship[i]);
		empfamily.setEmp_foccupation(occupation[i]);
		empfamily.setEmp_fage(age[i]);
		enrollmentservice.updateFamily(empfamily);
		}
		
	
		String[] languageid=request.getParameterValues("languageid");
		String[] languagesknown=request.getParameterValues("languagesknown");
		String[] speak=request.getParameterValues("speak");
		String[] read=request.getParameterValues("read");
		String[] write=request.getParameterValues("write");
		String[] remarks=request.getParameterValues("remarks");
		
	
		for(int i=0;i<languageid.length;i++)
		{
			emplanguage.setEmpid(empform.getEmpid());
			emplanguage.setId(Integer.parseInt(languageid[i]));
			emplanguage.setEmp_lang_known(languagesknown[i]);
			emplanguage.setEmp_lang_speak(speak[i]);
			emplanguage.setEmp_lang_read(read[i]);
			emplanguage.setEmp_lang_write(write[i]);
			emplanguage.setEmp_lang_level(remarks[i]);
			System.out.println("speak" +speak[i]);
			System.out.println("read" +read[i]);
			System.out.println("write" +write[i]);
			
			enrollmentservice.updateLanguage(emplanguage);
				
		}
	
		String[] educationid=request.getParameterValues("educationid");
		String[] examinationpassed=request.getParameterValues("examinationpassed");
		String[] nameofschool=request.getParameterValues("nameofschool");
		String[] duration=request.getParameterValues("duration");
		String[] yearofpassing=request.getParameterValues("yearofpassing");
		String[] percentage=request.getParameterValues("percentage");
		for(int i=0;i<educationid.length;i++)
		{
			empeducation.setEmpid(empform.getEmpid());
			empeducation.setId(Integer.parseInt(educationid[i]));
			empeducation.setEmp_exam_passed(examinationpassed[i]);
			empeducation.setEmp_institute(nameofschool[i]);
			empeducation.setEmp_duration_course(duration[i]);
			empeducation.setEmp_yearofpass(yearofpassing[i]);
			empeducation.setEmp_percentage(percentage[i]);
			enrollmentservice.updateEducation(empeducation);
			
		}
		
		String[] workid=request.getParameterValues("workid");
		String[] companyaddress=request.getParameterValues("comapanyaddress");
		String[] designation=request.getParameterValues("designation");
		String[] salary=request.getParameterValues("salary");
		String[] fromto=request.getParameterValues("fromto");
		String[] reason=request.getParameterValues("reason");
		for(int i=0;i<workid.length;i++)
		{
			empwork.setEmpid(empform.getEmpid());
			empwork.setId(Integer.parseInt(workid[i]));
			empwork.setEmp_company_name(companyaddress[i]);
			empwork.setEmp_designation(designation[i]);
			empwork.setEmp_sal(salary[i]);
			empwork.setEmp_period(fromto[i]);
			empwork.setEmp_leavejob(reason[i]);
			enrollmentservice.updateWork(empwork);
			
		}
		
		String[] activityid=request.getParameterValues("activityid");
		String[] activities=request.getParameterValues("activities");
		String[] atschool=request.getParameterValues("atschool");
		String[] atcollege=request.getParameterValues("atcollege");
		String[] later=request.getParameterValues("later");
		for(int i=0;i<activityid.length;i++)
		{
			empactivities.setEmpid(empform.getEmpid());
			empactivities.setId(Integer.parseInt(activityid[i]));
			empactivities.setActivitytype(activities[i]);
			empactivities.setEmp_atschool(atschool[i]);
			empactivities.setEmp_atcollege(atcollege[i]);
			empactivities.setEmp_later(later[i]);
			enrollmentservice.updateActivity(empactivities);
		}
		
		String[] artoflivingid=request.getParameterValues("artoflivingid");
		String[] course=request.getParameterValues("course");
		String[] location=request.getParameterValues("location");
		String[] teacher=request.getParameterValues("teacher");
		String[] date=request.getParameterValues("date");
		String[] artoflivingremarks=request.getParameterValues("artoflivingremarks");
		for(int i=0;i<artoflivingid.length;i++)
		{
			artofliving.setEmpid(empform.getEmpid());
			artofliving.setId(Integer.parseInt(artoflivingid[i]));
			artofliving.setEmp_course(course[i]);
			artofliving.setEmp_location(location[i]);
			artofliving.setEmp_teacher(teacher[i]);
			artofliving.setEmp_date(date[i]);
			artofliving.setEmp_remarks(artoflivingremarks[i]);
			enrollmentservice.updateArtofliving(artofliving);
		}
		
		emprecommendation.setEmpid(empform.getEmpid());
		emprecommendation.setId(Integer.parseInt(request.getParameter("recommendationid")));
		emprecommendation.setEmp_name_address(request.getParameter("tname"));
		emprecommendation.setEmp_teacher_email(request.getParameter("temailid"));
		emprecommendation.setEmp_teacher_mobile(request.getParameter("tmobilenumber"));
		emprecommendation.setEmp_teachercode(request.getParameter("tcode"));
	enrollmentservice.updateRecommendation(emprecommendation);
	
	String[] referenceid=request.getParameterValues("referenceid");
	String[] rname=request.getParameterValues("rname");
	String[] raddress=request.getParameterValues("raddress");
	String[] pcontactno=request.getParameterValues("pcontactno");
	String[] remail=request.getParameterValues("remail");
	for(int i=0;i<referenceid.length;i++)
	{
		
		empreferences.setEmpid(empform.getEmpid());
		empreferences.setId(Integer.parseInt(referenceid[i]));
		empreferences.setEmp_ref_name(rname[i]);
		empreferences.setEmp_ref_address(raddress[i]);
		empreferences.setEmp_ref_mobile(pcontactno[i]);
		empreferences.setEmp_ref_emailid(remail[i]);
		enrollmentservice.updateReferences(empreferences);
	}
	EmployeeForm empform1=enrollmentservice.employeeDetails(Integer.parseInt(request.getParameter("empid")));
	model.put("empid",empform1.getEmpid());
	model.put("empname",empform1.getEmpname());
	
	
	model.put("empimage", empform1.getImageFile());
	model.put("empsidephoto", empform1.getImageFile2());
	model.put("empthumbphoto", empform1.getImageFile3());
	
	model.put("dob",empform1.getEmpdob());
    model.put("gender", empform1.getEmpgender());
	model.put("fname",empform1.getEmpfname());
    model.put("faddress",empform1.getEmpfproffession());
	model.put("fcontact",empform1.getFcontactno());
	model.put("currentaddress",empform1.getEmp_currentaddress());
	model.put("permanentaddress",empform1.getEmp_permanentaddress());
	model.put("mobilenumber",empform1.getEmp_mobileno());
	
	System.out.println("M No:"+empform1.getEmp_mobileno());
	
	model.put("alternatemobile",empform1.getEmp_alternatemobileno());
	model.put("email",empform1.getEmp_email());
	model.put("maritalstatus",empform1.getEmp_maritalstatus());
	model.put("noofchildrens",empform1.getEmp_noofchildrens());
	model.put("noofsons",empform1.getEmp_noofsons());
	model.put("sonage",empform1.getEmp_sonage());
	model.put("noofdaughters", empform1.getEmp_noofdaughters());
	model.put("daughterage",empform1.getEmp_daughterage());
	model.put("empdate",empform1.getEmp_date());
	model.put("empplace",empform1.getEmp_place());
	model.put("probation",empform1.getEmp_probation_period());
	model.put("deptpost",empform1.getEmp_department());
	model.put("designation",empform1.getEmp_designation());
	model.put("expecteddate",empform1.getEmp_expected_joining_date());
	model.put("joinedon",empform1.getJoinedon());
	model.put("rejoineddate",empform1.getEmp_rejoined_date());
	model.put("officesupervisor",empform1.getEmp_office_supervisor());
	model.put("training",empform1.getEmp_head_training());
	model.put("security",empform1.getEmp_head_ashram_security());
	model.put("empstatus",empform1.getEmpstatus());
	model.put("list",enrollmentservice.employeeFamilyDetails(empform.getEmpid()));
	model.put("educationlist",enrollmentservice.employeeEducation(empform.getEmpid()));
    model.put("languagelist", enrollmentservice.employeeLanguage(empform.getEmpid()));
    model.put("worklist", enrollmentservice.employeeWork(empform.getEmpid()));
    model.put("artoflivinglist", enrollmentservice.employeeArtofliving(empform.getEmpid()));
	model.put("activitieslist", enrollmentservice.employeeActivity(empform.getEmpid()));
	model.put("recommendationlist",enrollmentservice.empRecommendation(empform.getEmpid()));
	model.put("referencelist",enrollmentservice.empReferences(empform.getEmpid()));	
	model.put("msg","Employee Updated Successfully");	
		System.out.println("after empfamily updated");
		
		/*  to Return employee updated jsp */
		List<EmployeeForm> list=enrollmentservice.getEmployeeDetails();
		model.put("list", list);
		
		return "employeeDetails";

	}

@RequestMapping(value="/g4ssecurity")
public String getG4ssecuritypage(Map<String,Object>model)

{
	G4SSecurity g4ssecurityform=new G4SSecurity();
	model.put("g4ssecurityform",g4ssecurityform);
	return "g4ssecurity";
}

@RequestMapping(value="/dataoperator_g4ssecurity")
public String getdataoperatorG4ssecuritypage(Map<String,Object>model)

{
	G4SSecurity g4ssecurityform=new G4SSecurity();
	model.put("g4ssecurityform",g4ssecurityform);
	return "dataoperator_g4ssecurity";
}

@RequestMapping(value="/saveG4SSecurity")
public String saveG4SSecurity(Map<String,Object>model,@ModelAttribute("g4ssecurity")G4SSecurity g4ssecurity,@RequestParam("g4s_date")String g4s_date)
{

//EmployeeForm empform=new EmployeeForm();
	G4SSecurity g4ssecurityform=new G4SSecurity();
	System.out.println("befor calling saveg4ssecurity");
	enrollmentservice.insertG4SSecurity(g4ssecurity);
System.out.println("after calling saveg4ssecurity");
	model.put("g4ssecurityform", g4ssecurityform);

model.put("msg","G4SSecurity Details Successfully Inserted");
//model.put("list",enrollmentservice.getG4SSecurityDetailsByDate(g4s_date));
model.put("g4s_date", g4s_date);
	System.out.println("welcome to if block");
	model.put("podayshiftcount",enrollmentservice.getPoDayShiftCount(g4s_date));
	
model.put("ponightshiftcount",enrollmentservice.getPoNightShiftCount(g4s_date));
model.put("ssdayshiftcount",enrollmentservice.getSsDayShiftCount(g4s_date));
model.put("ssnightshiftcount",enrollmentservice.getSsNightShiftCount(g4s_date));
model.put("hgdayshiftcount",enrollmentservice.getHgDayShiftCount(g4s_date));
model.put("hgnightshiftcount", enrollmentservice.getHgNightShiftCount(g4s_date));
model.put("sgdayshiftcount",enrollmentservice.getSgDayShiftCount(g4s_date));
model.put("sgnightshiftcount",enrollmentservice.getSgNightShiftCount(g4s_date));

	return "g4ssecurity";
}


@RequestMapping(value="/savedataoperatorG4SSecurity")
public String savedataoperatorG4SSecurity(Map<String,Object>model,@ModelAttribute("g4ssecurity")G4SSecurity g4ssecurity,@RequestParam("g4s_date")String g4s_date)
{


	G4SSecurity g4ssecurityform=new G4SSecurity();
	enrollmentservice.insertG4SSecurity(g4ssecurity);

	model.put("g4ssecurityform", g4ssecurityform);

model.put("msg","G4SSecurity Details Successfully Inserted");
//model.put("list",enrollmentservice.getG4SSecurityDetailsByDate(g4s_date));
model.put("g4s_date", g4s_date);
	System.out.println("welcome to if block");
	model.put("podayshiftcount",enrollmentservice.getPoDayShiftCount(g4s_date));
	
model.put("ponightshiftcount",enrollmentservice.getPoNightShiftCount(g4s_date));
model.put("ssdayshiftcount",enrollmentservice.getSsDayShiftCount(g4s_date));
model.put("ssnightshiftcount",enrollmentservice.getSsNightShiftCount(g4s_date));
model.put("hgdayshiftcount",enrollmentservice.getHgDayShiftCount(g4s_date));
model.put("hgnightshiftcount", enrollmentservice.getHgNightShiftCount(g4s_date));
model.put("sgdayshiftcount",enrollmentservice.getSgDayShiftCount(g4s_date));
model.put("sgnightshiftcount",enrollmentservice.getSgNightShiftCount(g4s_date));

	return "dataoperator_g4ssecurity";
}

@RequestMapping(value="/inhousesecurity")
public String getInhouseSecurity(Map<String,Object>model)
{
	InhouseSecurity inhousesecurityform=new InhouseSecurity();
	model.put("inhousesecurityform",inhousesecurityform);
	return "Inhousesecurity";
}

@RequestMapping(value="/dataoperator_inhousesecurity")
public String getdataoperatorInhouseSecurity(Map<String,Object>model)
{
	InhouseSecurity inhousesecurityform=new InhouseSecurity();
	model.put("inhousesecurityform",inhousesecurityform);
	return "dataoperator_inhousesecurity";
}

@RequestMapping(value="/saveInhouseSecurity")
public String saveInhouseSecurity(Map<String,Object>model,@ModelAttribute("inhousesecurity")InhouseSecurity inhousesecurity,@RequestParam("inhouse_date")String inhouse_date)
{
	System.out.println("save inhousesecurity");
System.out.println("security post"  +inhousesecurity.getInhouse_securitypost())	;
	InhouseSecurity inhousesecurityform=new InhouseSecurity();
	enrollmentservice.saveInhouseSecurity(inhousesecurity);
	model.put("inhousesecurityform", inhousesecurityform);
	model.put("inhouse_date", inhouse_date);
	model.put("msg", "InhouseSecurity Details Successfully Inserted");
	model.put("podayshiftcount",enrollmentservice.getInhousePoDayShiftCount(inhouse_date));
	model.put("ponightshiftcount",enrollmentservice.getInhousePoNightShiftCount(inhouse_date));
	model.put("ssdayshiftcount",enrollmentservice.getInhouseSsDayShiftCount(inhouse_date));
	model.put("ssnightshiftcount",enrollmentservice.getInhouseSsNightShiftCount(inhouse_date));
	model.put("hgdayshiftcount",enrollmentservice.getInhouseHgDayShiftCount(inhouse_date));
	model.put("hgnightshiftcount",enrollmentservice.getInhouseHgNightShiftCount(inhouse_date));
	model.put("sgdayshiftcount",enrollmentservice.getInhouseSgDayShiftCount(inhouse_date));
	model.put("sgnightshiftcount",enrollmentservice.getInhouseSgNightShiftCount(inhouse_date));
	Long count=enrollmentservice.getInhousePoDayShiftCount(inhouse_date);
	System.out.println("pocount"+count);
	return "Inhousesecurity";
}


@RequestMapping(value="/savedataoperatorInhouseSecurity")
public String savedataoperatorInhouseSecurity(Map<String,Object>model,@ModelAttribute("inhousesecurity")InhouseSecurity inhousesecurity,@RequestParam("inhouse_date")String inhouse_date)
{
	System.out.println("save inhousesecurity");
System.out.println("security post"  +inhousesecurity.getInhouse_securitypost())	;
	InhouseSecurity inhousesecurityform=new InhouseSecurity();
	enrollmentservice.saveInhouseSecurity(inhousesecurity);
	model.put("inhousesecurityform", inhousesecurityform);
	model.put("inhouse_date", inhouse_date);
	model.put("msg", "InhouseSecurity Details Successfully Inserted");
	model.put("podayshiftcount",enrollmentservice.getInhousePoDayShiftCount(inhouse_date));
	model.put("ponightshiftcount",enrollmentservice.getInhousePoNightShiftCount(inhouse_date));
	model.put("ssdayshiftcount",enrollmentservice.getInhouseSsDayShiftCount(inhouse_date));
	model.put("ssnightshiftcount",enrollmentservice.getInhouseSsNightShiftCount(inhouse_date));
	model.put("hgdayshiftcount",enrollmentservice.getInhouseHgDayShiftCount(inhouse_date));
	model.put("hgnightshiftcount",enrollmentservice.getInhouseHgNightShiftCount(inhouse_date));
	model.put("sgdayshiftcount",enrollmentservice.getInhouseSgDayShiftCount(inhouse_date));
	model.put("sgnightshiftcount",enrollmentservice.getInhouseSgNightShiftCount(inhouse_date));
	Long count=enrollmentservice.getInhousePoDayShiftCount(inhouse_date);
	System.out.println("pocount"+count);
	return "dataoperator_inhousesecurity";
}

@RequestMapping(value="/g4ssecuritydetails")
public String getG4SSecurityDetails(Map<String,Object>model)
{
	List<G4SSecurity> list=enrollmentservice.getG4SSecuritydetails();
	model.put("list", list);
	return "g4ssecuritydetails";
}

@RequestMapping(value="/user_g4ssecuritydetails")
public String getUserG4SSecurityDetails(Map<String,Object>model)
{
	List<G4SSecurity> list=enrollmentservice.getG4SSecuritydetails();
	model.put("list", list);
	return "user_g4ssecuritydetails";
}

@RequestMapping(value="/inhousesecuritydetails")
public String getInhouseSecurityDetails(Map<String,Object>model)
{
	List<InhouseSecurity> list=enrollmentservice.getInhouswSecuritydetails();
	model.put("list",list);
	System.out.println("in inhousesecuritydetails controller");
	return "inhousesecuritydetails";
}

@RequestMapping(value="/user_inhousesecuritydetails")
public String getUserInhouseSecurityDetails(Map<String,Object>model)
{
	List<InhouseSecurity> list=enrollmentservice.getInhouswSecuritydetails();
	model.put("list",list);
	return "user_inhousesecuritydetails";
}

@RequestMapping(value="/g4ssecurityreport")
public String getG4SSecurityReport(Map<String,Object>model)
{
	//G4SSecurity g4ssecurityform=new G4SSecurity();
	//model.put("list",enrollmentservice.getG4SEmpname());
	//model.put("g4ssecurityform",g4ssecurityform);
	
	return "g4s_report";
}

@RequestMapping(value="/getG4SSecurityReport")
public String getG4SSecurityReport(Map<String,Object>model,@RequestParam("emp_id")int emp_id,@RequestParam("fromDate")String fromDate,@RequestParam("toDate")String toDate,HttpServletRequest request)throws IOException
{
	
	 List<G4SSecurity> list=enrollmentservice.getMonthelyG4SSecurityDetails(emp_id,fromDate,toDate);
	 System.out.println("empid is"+request.getParameter("emp_id"));
	 model.put("empname",request.getParameter("emp_id"));
		model.put("fromDate",request.getParameter("fromDate"));
		model.put("toDate",request.getParameter("toDate"));
	 
	 
	 model.put("list",list);
	 //int noofleaves=enrollmentservice.getCountOfLeaves(emp_id,fromDate, toDate);
	// Long totalnoofworkingdays=enrollmentservice.getTotalNoofWorkingDays(emp_id,fromDate,toDate);
	// List<EmployeeForm> list=enrollmentservice.getEmpname(emp_id);
	// for(EmployeeForm list1:list)
	 //{
		// System.out.println("designation"+list1.getEmp_designation());
		// System.out.println("empname"+list1.getEmpname());
		// model.put("designation",list1.getEmp_designation());
		// model.put("empname",list1.getEmpname());
		 
	// }
	// model.put("empname",enrollmentservice.getEmpname(emp_id));
    // model.put("list",noofleaves);
	// model.put("workingdays",totalnoofworkingdays);
	// model.put("fromDate",request.getParameter("fromDate"));
	// model.put("toDate",request.getParameter("toDate"));
	 return "g4s_report_details";
	
	
}


@RequestMapping(value="/getG4SSecurityReportpdf")

public Document getG4SSecurityReportpdf(HttpServletRequest request,HttpServletResponse response)throws Exception
{
	Document document = new Document(PageSize.A4.rotate());
	System.out.println("In Get Pdf Reports Controller:");
	try{
		 
		PdfWriter.getInstance(document,response.getOutputStream()); // Code 2
		document.open();
		 Paragraph para=new Paragraph();
		 para.setAlignment(Element.ALIGN_CENTER);
		 Font font1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
         Chunk chunk = new Chunk("Ashram Security Department",font1);
         para.add(chunk);
			
					
				para.add(Chunk.NEWLINE);
				Chunk chunk2 = new Chunk("Agency Pdf Report",font1);
				 para.add(chunk2);
				 para.add(Chunk.NEWLINE); 
				 para.add(Chunk.NEWLINE);
				document.add(para);	
					//para.add(Chunk.NEWLINE);
				//para.add(Chunk1.NEWLINE);
		PdfPTable table1 = new PdfPTable(5); 
        Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
       // table1.getDefaultCell().setFixedHeight(100);
		   table1.setWidthPercentage(100);
			 float[] columnWidthsimg = new float[] {20f,20f,30f,20f,10f};
	           table1.setWidths(columnWidthsimg);
		        
	            table1.addCell("Employee Id");
		        table1.addCell("Security Post");
		        table1.addCell("Shift");
		        table1.addCell("Rank");
	            table1.addCell("Date");
	        
	        document.add(table1);
	        
	        PdfPTable table2 = new PdfPTable(5); 
  //  Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
   // table1.getDefaultCell().setFixedHeight(100);
	   table2.setWidthPercentage(100);
		 float[] columnWidths = new float[] {20f,20f,30f,20f,10f};
           table2.setWidths(columnWidths);
           
           System.out.println("in pdf");
           System.out.println("in pdf" + request.getParameter("emp_id"));
           System.out.println("in pdf" + request.getParameter("fromDate"));
           System.out.println("in pdf" + request.getParameter("toDate"));
           
        List<G4SSecurity>  list= enrollmentservice.getMonthelyG4SSecurityDetails(Integer.parseInt(request.getParameter("emp_id")),request.getParameter("fromDate"), request.getParameter("toDate"));
           //int emp_id=Integer.parseInt(request.getParameter("empname"));
	       //System.out.println("empid for report"+emp_id);
           for(G4SSecurity list1:list)
          
           
           {
        	  
	        	table2.addCell(String.valueOf(list1.getEmp_id()));
	          	table2.addCell(list1.getG4s_securitypost());
	        	table2.addCell(list1.getG4s_shift());
	        	table2.addCell(list1.getG4s_rank());
	        	table2.addCell(String.valueOf(list1.getG4s_date()));
	        }
           
           
           
	        document.add(table2);
	        document.close();
	}
	
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	
	return document;
}

@RequestMapping(value="/inhousesecurityreport")
public String getInhouseReport(Map<String,Object>model)
{
	InhouseSecurity inhouseform=new InhouseSecurity();
//List list=	enrollmentservice.getEmpname();
//System.out.println(list);
//model.put("list", enrollmentservice.getInhouseEmpname());
model.put("inhouseform", inhouseform);
	return "inhouse_report";
}

@RequestMapping(value="/getInhouseSecurityReport1")
public String getInhouseSecurityReport(Map<String,Object>model,@RequestParam("emp_id")int emp_id,@RequestParam("fromDate")String fromDate,@RequestParam("toDate")String toDate,HttpServletRequest request)
{
	List<InhouseSecurity> list=enrollmentservice.getMonthelyInhouseSecurityDetails(emp_id, fromDate, toDate);
	System.out.print("empid is"+request.getParameter("emp_id"));
	model.put("empname",Integer.parseInt(request.getParameter("emp_id")));
	model.put("fromDate",request.getParameter("fromDate"));
	model.put("toDate",request.getParameter("toDate"));
	model.put("list", list);
	System.out.println("empname:"+request.getParameter("emp_id"));
    return "inhouse_report_details";
}


@RequestMapping(value="/getInhouseSecurityReportpdf")
public Document getInhouseSecurityReportpdf(HttpServletResponse response,HttpServletRequest request)
{
	Document document = new Document(PageSize.A4.rotate());
	try{
		 
		PdfWriter.getInstance(document,response.getOutputStream()); // Code 2
		document.open();
		 Paragraph para=new Paragraph();
		 para.setAlignment(Element.ALIGN_CENTER);
		 Font font1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
         Chunk chunk = new Chunk("Ashram Security Department",font1);
         para.add(chunk);
			
					
				para.add(Chunk.NEWLINE);
				Chunk chunk2 = new Chunk("Inhouse Pdf Report",font1);
				 para.add(chunk2);
				 para.add(Chunk.NEWLINE); 
				 para.add(Chunk.NEWLINE);
				document.add(para);	
					//para.add(Chunk.NEWLINE);
				//para.add(Chunk1.NEWLINE);
		PdfPTable table1 = new PdfPTable(5); 
        Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
       // table1.getDefaultCell().setFixedHeight(100);
		   table1.setWidthPercentage(100);
			 float[] columnWidthsimg = new float[] {20f,20f,30f,20f,10f};
	           table1.setWidths(columnWidthsimg);
		        
		        table1.addCell("Employee Id");
		        table1.addCell("Security Post");
		        table1.addCell("Shift");
		        table1.addCell("Rank");
	            table1.addCell("Date");
	        
	            document.add(table1);
	        
	        PdfPTable table2 = new PdfPTable(5); 
	        //Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
	       // table1.getDefaultCell().setFixedHeight(100);
			   table2.setWidthPercentage(100);
				 float[] columnWidths = new float[] {20f,20f,30f,20f,10f};
		           table2.setWidths(columnWidths);
		           
	        List<InhouseSecurity> list=enrollmentservice.getMonthelyInhouseSecurityDetails(Integer.parseInt(request.getParameter("emp_id")),request.getParameter("fromDate"), request.getParameter("toDate"));
	       //int emp_id=Integer.parseInt(request.getParameter("empname"));
	       // System.out.println("empid for report"+emp_id);
	        for(InhouseSecurity list1:list)
	        {
	        	table2.addCell(String.valueOf(list1.getEmp_id()));
	         	table2.addCell(list1.getInhouse_securitypost());
	        	table2.addCell(list1.getInhouse_shift());
	        	table2.addCell(list1.getInhouse_rank());
	        	table2.addCell(list1.getInhouse_date());
	        	  
	           }
			document.add(table2);
			document.close();
			
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
		
		return document;
		
	}


/*@RequestMapping(value = "/getG4SSecurityReport")
public ModelAndView generatePdfReport1(ModelAndView modelAndView,
		@RequestParam("fromDate")
		String fromDate, @RequestParam("endDate")
		String toDate) {

	System.out.println("welcome to jasper");

	Map<String, Object> parameterMap = new HashMap<String, Object>();

	List<InhouseSecurity> usersList =enrollmentservice.getMonthelyG4SSecurityDetails(fromDate, toDate);
			

	JRDataSource JRdataSource = new JRBeanCollectionDataSource(usersList);

	parameterMap.put("datasource", JRdataSource);
	// pdfReport bean has ben declared in the jasper-views.xml file
	modelAndView = new ModelAndView("inhousesecurityreport", parameterMap);

	return modelAndView;

}// generatePdfReport*/
@RequestMapping(value="/lostitemregister")
public String getLostItemsForm(Map<String,Object>model)
{
	LostItems lostitems=new LostItems();
	model.put("lostitemsform",lostitems);
	return "lostitem_register";
}

@RequestMapping(value="/saveLostItems")
public String saveLostItems(@ModelAttribute("lostitems")LostItems lostitems,Map<String,Object>model,HttpServletRequest request)throws Exception
{
	LostItems lostitems1=new LostItems();
	
	/*  DateFormat readFormat = new SimpleDateFormat( "MM/dd/yyyy,hh,mm,aaa");

	    DateFormat writeFormat = new SimpleDateFormat( "MM/dd/yyyy hh:mm aaa");
	    Date date = null;
	    
	       date = readFormat.parse( lostitems.getDate_timeoflost());
	    		   String date_timeoflost = "";
	    if( date != null ) {
	    	date_timeoflost = writeFormat.format( date );
	    }
	    date=readFormat.parse( lostitems.getReporting_date_time());
		   String reporting_date_time = "";
		   if(date!=null)
		   {
			   reporting_date_time =writeFormat.format(date);
		   }

	lostitems.setName_address(lostitems.getName_address());
    lostitems.setDate(lostitems.getDate());
	lostitems.setContact_no(lostitems.getContact_no());
	lostitems.setDate_timeoflost(date_timeoflost);
	lostitems.setReporting_date_time(reporting_date_time);
	lostitems.setItemslost(lostitems.getItemslost());
    lostitems.setPlaceoflost(lostitems.getPlaceoflost());
	lostitems.setApprox_value(lostitems.getApprox_value());
	lostitems.setReceipt_no(lostitems.getReceipt_no());
    lostitems.setRemarks(lostitems.getRemarks());*/
	enrollmentservice.saveLostItems(lostitems);
	model.put("lostitemsform",lostitems1);
	model.put("msg", "LostItems Are Registered Successfully");
	return "lostitem_register";
}

    @RequestMapping(value="/lostitemdetails")
    public String getLostItemDetails(Map<String,Object>model)
    {
    	List<LostItems> list=enrollmentservice.getLostItemDetails();
    	model.put("list",list);
    	return "lostitems_details";
    }
    
    @RequestMapping(value="/founditemregister")
    public String gounditemregister(Map<String,Object>model)
    {
    	FoundItems founditemsform=new FoundItems();
    model.put("founditemsform",founditemsform);
    	return "founditem_register";
    }
    
    @RequestMapping(value="/savefoundItems")
    public String saveFoundItems(Map<String,Object>model,@ModelAttribute("founditems")FoundItems founditems)
    {
    	FoundItems founditemsform=new FoundItems();
    	enrollmentservice.saveFoundItems(founditems);
    	model.put("msg","Found Items Registered Successfully");
        model.put("founditemsform",founditemsform);
        return "founditem_register";
    	
    }
    @RequestMapping(value="/founditemdetails")
    public ModelAndView getFoundItemdetails()
    {
    	
    	
    	return new ModelAndView("founditem_details","list",enrollmentservice.getFoundItemDetails());
    }
    
    
    
    
    @RequestMapping(value="/leave")
    public String getLeaveApplication(Map<String,Object>model)

    {
     //System.out.println("intwowheeler");
     LeaveApplication leaveForm=new LeaveApplication();
     //System.out.println("intwowheeler after object creation");
     model.put("LeaveForm",leaveForm);
     //System.out.println("intwowheeler after model");
     return "leaveForm";
    }

    @RequestMapping(value="/saveLeave")
    public String saveLeave(Map<String,Object>model,@ModelAttribute("leaveapplication")LeaveApplication leaveapplication )
    {
     System.out.println("in save leaveForm");
     LeaveApplication leaveappForm=new LeaveApplication();
     enrollmentservice.insertLeaveForm(leaveapplication);
     model.put("LeaveForm", leaveappForm);
     model.put("msg","leaveForm Details Successfully Inserted");

     return "leaveForm";
    }
    @RequestMapping("/leavedetails")
    public String getLeaveDetails(Map<String,Object>model)
    {
     //List<LeaveApplication> list=enrollmentservice.getLeaveDetails();
    
     List<EmployeeLeaveDTO> list=enrollmentservice.getEmployeeLeaveDetails();
     model.put("list", list);
     
     return "leaveDetails";
     
    }
    
    
    @RequestMapping(value="/salarycalculation")
    public String togetSalaryForm()
    {
    	return "get_salary_form";
    }
    
    @RequestMapping(value="/getSalary")
    public String getSalaryForm(Map<String,Object>model,HttpServletRequest request)throws IOException
    {
    	String security=request.getParameter("security");
    	if(security.equals("g4ssecurity"))
    	{
    		model.put("security_post",security);
    	String date=request.getParameter("date");
    	
int emp_id=Integer.parseInt(request.getParameter("emp_id"));
    	System.out.println("requested date:"+date);
    	 DateFormat readFormat = new SimpleDateFormat( "yyyy-MM-dd");

 	    DateFormat writeFormat = new SimpleDateFormat( "yyyy-MM");
 	    Date date1 = null;
 	   String select_date= "";
 	    try
 	    {
 	       date1 = readFormat.parse( date);
 	    		  
 	    if( date1 != null ) {
 	    	select_date = writeFormat.format( date1 );
 	    }
 	    }catch(Exception ex)
 	    {
 	    	ex.printStackTrace();
 	    }
 	    System.out.println("date is"+date1);
 	   Calendar c1 = Calendar.getInstance();
 	   c1.setTime(date1);
 	  int days=c1.getActualMaximum(Calendar.DAY_OF_MONTH);
 	  System.out.println("noofdays"+days);
 	  // int noofleaves=enrollmentservice.getCountOfLeaves(emp_id,fromDate, toDate);
 		 Long totalnoofworkingdays=enrollmentservice.getTotalNoofWorkingDays(emp_id,select_date);
 		 List<EmployeeForm> list=enrollmentservice.getEmpname(emp_id);
 		 for(EmployeeForm list1:list)
 		 {
 			int salary=list1.getEmployee_salary();
 		double	salary_per_day=salary/days;
 		double Basic_salary=salary_per_day*totalnoofworkingdays;
 		System.out.println("salary per day"+salary_per_day);
 		model.put("Basic_salary", Basic_salary);
 			 model.put("designation",list1.getEmp_designation());
 			 model.put("empname",list1.getEmpname());
 			 model.put("salary",list1.getEmployee_salary());
 			 model.put("emp_id",emp_id);
 		 }
 		// model.put("empname",enrollmentservice.getEmpname(emp_id));
 	    // model.put("list",noofleaves);
 		 model.put("workingdays",totalnoofworkingdays);
 		 model.put("fromDate",request.getParameter("fromDate"));
 		 model.put("toDate",request.getParameter("toDate"));
 	    System.out.println("afterparsing"+select_date);
    	
    	return "g4s_salary_form";
    	}
    	else if(security.equals("inhousesecurity"))
    	{
    		model.put("security_post",security);
        	String date=request.getParameter("date");
        	
    int emp_id=Integer.parseInt(request.getParameter("emp_id"));
        	System.out.println("requested date"+date);
        	 DateFormat readFormat = new SimpleDateFormat( "yyyy-MM-dd");

     	    DateFormat writeFormat = new SimpleDateFormat( "yyyy-MM");
     	    Date date1 = null;
     	   String select_date= "";
     	    try
     	    {
     	       date1 = readFormat.parse( date);
     	    		  
     	    if( date1 != null ) {
     	    	select_date = writeFormat.format( date1 );
     	    }
     	    }catch(Exception ex)
     	    {
     	    	ex.printStackTrace();
     	    }
     	    System.out.println("date is"+date1);
     	   Calendar c1 = Calendar.getInstance();
     	   c1.setTime(date1);
     	  int days=c1.getActualMaximum(Calendar.DAY_OF_MONTH);
     	  System.out.println("noofdays"+days);
     	  // int noofleaves=enrollmentservice.getCountOfLeaves(emp_id,fromDate, toDate);
     		 Long totalnoofworkingdays=enrollmentservice.getInhouseTotalNoofWorkingDays(emp_id,select_date);
     		 System.out.println("inhouse workingdays"+totalnoofworkingdays);
     		 List<EmployeeForm> list=enrollmentservice.getEmpname(emp_id);
     		 for(EmployeeForm list1:list)
     		 {
     			int salary=list1.getEmployee_salary();
     		double	salary_per_day=salary/days;
     		double Basic_salary=salary_per_day*totalnoofworkingdays;
     		System.out.println("salary per day"+salary_per_day);
     		model.put("Basic_salary", Basic_salary);
     			 model.put("designation",list1.getEmp_designation());
     			 model.put("empname",list1.getEmpname());
     			 model.put("salary",list1.getEmployee_salary());
     			 model.put("emp_id",emp_id);
     		 }
     		// model.put("empname",enrollmentservice.getEmpname(emp_id));
     	    // model.put("list",noofleaves);
     		 model.put("workingdays",totalnoofworkingdays);
     		 model.put("fromDate",request.getParameter("fromDate"));
     		 model.put("toDate",request.getParameter("toDate"));
     	    System.out.println("afterparsing"+select_date);
        	
    		return "g4s_salary_form";
    	}
    	else
    	{
    		return "get_salary_form";
    	}
    	
    }

    
    @RequestMapping(value="/saveSalary")
    public String saveSalary(Map<String,Object>model,@ModelAttribute("salary")Salary salary,HttpServletRequest request)
    {
    	salary.setSecurity_type(request.getParameter("security_post"));
    	salary.setSalary_month(Integer.parseInt(request.getParameter("fromDate")));
    	salary.setWorking_days(Integer.parseInt(request.getParameter("working_days")));
    	salary.setBasic_salary(Double.parseDouble(request.getParameter("basic_salary")));
    	salary.setGross_salary(Double.parseDouble(request.getParameter("gross_salary")));
    	salary.setPf(Double.parseDouble(request.getParameter("pfmoney")));
    	salary.setEsi(Double.parseDouble(request.getParameter("esimoney")));
    	salary.setUniform(Integer.parseInt(request.getParameter("uniform")));
    	salary.setAdvance(Integer.parseInt(request.getParameter("advance")));
    	salary.setTotal_deduction(Double.parseDouble(request.getParameter("total_deduction")));
    	salary.setNet_pay(Double.parseDouble(request.getParameter("net_pay")));
    	salary.setEntry_date(request.getParameter("entry_date"));
    	salary.setEntered_by(request.getParameter("entered_by"));
    	
    	enrollmentservice.saveSalary(salary);
    	model.put("msg","Salary Details Entered Successfully");
    	return "get_salary_form";
    	
    }
    /*@RequestMapping(value="/salarydetails")
    public String getSalaryDetailsform()
    {
    	return "salary_details";
    }*/
    
    @RequestMapping(value="/g4ssalarydetails")
    public String getG4SSalaryDetails(Map<String,Object>model)
    {
    	model.put("list",enrollmentservice.getG4SEmployeeSalaryDetails());
    	// List<EmployeeForm> list=enrollmentservice.getEmployeeDetails();
 		// for(EmployeeForm list1:list)
 		// {
 		//	 model.put("designation",list1.getEmp_designation());
 		//	 model.put("empname",list1.getEmpname());
 			
 		 //}
    	
    	return "salary_details";
    }
    @RequestMapping(value="/inhousesalarydetails")
    public String getInhouseSalaryDetails(Map<String,Object>model)
    {
    	model.put("list",enrollmentservice.getInhouseEmployeeSalaryDetails());
    	// List<EmployeeForm> list=enrollmentservice.getEmployeeDetails();
 		// for(EmployeeForm list1:list)
 		// {
 		//	 model.put("designation",list1.getEmp_designation());
 		//	 model.put("empname",list1.getEmpname());
 			
 		 //}
    	
    	return "salary_details1";
    }
    
    @RequestMapping(value="/getG4SReport")
    public Document gtReport(HttpServletRequest request,HttpServletResponse response)
    {
    	Document document = new Document(PageSize.A4.rotate());
    	try{
    		 
    			PdfWriter.getInstance(document,response.getOutputStream()); // Code 2
    			document.open();
    			 Paragraph para=new Paragraph();
    			 para.setAlignment(Element.ALIGN_CENTER);
    			 Font font1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
                 Chunk chunk = new Chunk("Ashram Security",font1);
                 para.add(chunk);
					
					para.add(Chunk.NEWLINE); 
					//para.add(Chunk.NEWLINE); 
					Chunk chunk1 = new Chunk("Agency Security Details",font1);	
					 para.add(chunk1);
						
						para.add(Chunk.NEWLINE);
						Chunk chunk2 = new Chunk("Salary Statement for the Month",font1);
						 para.add(chunk2);
						 para.add(Chunk.NEWLINE); 
						 para.add(Chunk.NEWLINE);
						document.add(para);	
							//para.add(Chunk.NEWLINE);
						//para.add(Chunk1.NEWLINE);
    			PdfPTable table1 = new PdfPTable(11); 
		        Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
		       // table1.getDefaultCell().setFixedHeight(100);
				   table1.setWidthPercentage(100);
					 float[] columnWidthsimg = new float[] {15f,10f,10f,10f,10f,5f,5f,9f,9f,10f,7f};
			           table1.setWidths(columnWidthsimg);
		        
		        
		        table1.addCell("Name");
		        table1.addCell("Designation");
		        table1.addCell("No.of Days");
		        table1.addCell("Basic+DA");
		        table1.addCell("Gross");
	            table1.addCell("PF");
	            table1.addCell("ESI");
	            table1.addCell("Uniform");
	            table1.addCell("Advance");
	            table1.addCell("Total Deduction");
	            table1.addCell("Net Pay");
	        
	        document.add(table1);
	        PdfPTable table2 = new PdfPTable(11); 
	      //  Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
	       // table1.getDefaultCell().setFixedHeight(100);
			   table2.setWidthPercentage(100);
				 float[] columnWidths = new float[] {15f,10f,10f,10f,10f,5f,5f,9f,9f,10f,7f};
		           table2.setWidths(columnWidths);
		        List<EmployeeSalaryDTO>  list= enrollmentservice.getG4SEmployeeSalaryDetails();
		          // List<Salary> list=enrollmentservice.getSalaryDetails();
		           for(EmployeeSalaryDTO list1:list)
		           {
		        	 
		       			 
		       		  table2.addCell(list1.getEmpname());
			          table2.addCell(list1.getEmp_designation());
		       	      table2.addCell(String.valueOf(list1.getWorking_days())); 
		        	  table2.addCell(String.valueOf(list1.getBasic_salary()));
		        	  table2.addCell(String.valueOf(list1.getGross_salary()));
		        	  table2.addCell(String.valueOf(list1.getPf()));
		        	  table2.addCell(String.valueOf(list1.getEsi()));
		        	  table2.addCell(String.valueOf(list1.getUniform()));
		        	  table2.addCell(String.valueOf(list1.getAdvance()));
		        	  table2.addCell(String.valueOf(list1.getTotal_deduction()));
		        	  table2.addCell(String.valueOf(list1.getNet_pay()));
		        	  
		           }
    			document.add(table2);
    			document.close();
    			
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	return document;
    }
    
    
    @RequestMapping(value="/gtInhouseReport")
    public Document gtReport2(HttpServletRequest request,HttpServletResponse response)
    {
    	Document document = new Document(PageSize.A4.rotate());
    	try{
    		 
    			PdfWriter.getInstance(document,response.getOutputStream()); // Code 2
    			document.open();
    			 Paragraph para=new Paragraph();
    			 para.setAlignment(Element.ALIGN_CENTER);
    			 Font font1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
                 Chunk chunk = new Chunk("Ashram Security",font1);
                 para.add(chunk);
					
					para.add(Chunk.NEWLINE); 
					//para.add(Chunk.NEWLINE); 
					Chunk chunk1 = new Chunk("Inhouse Security Details",font1);	
					 para.add(chunk1);
						
						para.add(Chunk.NEWLINE);
						Chunk chunk2 = new Chunk("Salary Statement for the Month",font1);
						 para.add(chunk2);
						 para.add(Chunk.NEWLINE); 
						 para.add(Chunk.NEWLINE);
						document.add(para);	
					    //para.add(Chunk.NEWLINE);
						//para.add(Chunk1.NEWLINE);
    			PdfPTable table1 = new PdfPTable(11); 
		        Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
		       // table1.getDefaultCell().setFixedHeight(100);
				   table1.setWidthPercentage(100);
					 float[] columnWidthsimg = new float[] {15f,10f,10f,10f,10f,5f,5f,9f,9f,10f,7f};
			           table1.setWidths(columnWidthsimg);
		        
		        
		        table1.addCell("Name");
		        table1.addCell("Designation");
		        table1.addCell("No.of Days");
		        table1.addCell("Basic+DA");
		        table1.addCell("Gross");
	            table1.addCell("PF");
	            table1.addCell("ESI");
	            table1.addCell("Uniform");
	            table1.addCell("Advance");
	            table1.addCell("Total Deduction");
	            table1.addCell("Net Pay");
	        
	        document.add(table1);
	        PdfPTable table2 = new PdfPTable(11); 
	      //  Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
	       // table1.getDefaultCell().setFixedHeight(100);
			   table2.setWidthPercentage(100);
				 float[] columnWidths = new float[] {15f,10f,10f,10f,10f,5f,5f,9f,9f,10f,7f};
		           table2.setWidths(columnWidths);
		        List<EmployeeSalaryDTO>  list= enrollmentservice.getInhouseEmployeeSalaryDetails();
		          // List<Salary> list=enrollmentservice.getSalaryDetails();
		           for(EmployeeSalaryDTO list1:list)
		           {
		        	 
		       			 
		       		  table2.addCell(list1.getEmpname());
			          table2.addCell(list1.getEmp_designation());
		       	      table2.addCell(String.valueOf(list1.getWorking_days())); 
		        	  table2.addCell(String.valueOf(list1.getBasic_salary()));
		        	  table2.addCell(String.valueOf(list1.getGross_salary()));
		        	  table2.addCell(String.valueOf(list1.getPf()));
		        	  table2.addCell(String.valueOf(list1.getEsi()));
		        	  table2.addCell(String.valueOf(list1.getUniform()));
		        	  table2.addCell(String.valueOf(list1.getAdvance()));
		        	  table2.addCell(String.valueOf(list1.getTotal_deduction()));
		        	  table2.addCell(String.valueOf(list1.getNet_pay()));
		        	  
		           }
    			document.add(table2);
    			document.close();
    			
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    	}
    	return document;
    }
    
    
    @RequestMapping(value="/getpdfreports")
    public Document gtReports(HttpServletRequest request,HttpServletResponse response)
    {
    	Document document = new Document(PageSize.A4.rotate());
    	System.out.println("In Get Pdf Reports Controller:");
    	try{
   		 
			PdfWriter.getInstance(document,response.getOutputStream()); // Code 2
			document.open();
			 Paragraph para=new Paragraph();
			 para.setAlignment(Element.ALIGN_CENTER);
			 Font font1 = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
             Chunk chunk = new Chunk("ASHRAM SECURITY DEPARTMENT",font1);
             para.add(chunk);
				
				para.add(Chunk.NEWLINE); 
				//para.add(Chunk.NEWLINE); 
				Chunk chunk1 = new Chunk("RECRUITMENT FORM",font1);	
				 para.add(chunk1);
					
					para.add(Chunk.NEWLINE);
					Chunk chunk2 = new Chunk("Employee Details Form",font1);
					 para.add(chunk2);
					 para.add(Chunk.NEWLINE); 
					 para.add(Chunk.NEWLINE);
					document.add(para);	
						//para.add(Chunk.NEWLINE);
					//para.add(Chunk1.NEWLINE);
			PdfPTable table1 = new PdfPTable(7); 
	        Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
	       // table1.getDefaultCell().setFixedHeight(100);
			   table1.setWidthPercentage(100);
				 float[] columnWidthsimg = new float[] {10f,30f,10f,10f,10f,15f,15f};
		           table1.setWidths(columnWidthsimg);
	        
	        table1.addCell("EmpId");
	        table1.addCell("Name");
	        table1.addCell("JoindOn");
	        table1.addCell("Gender");
	        table1.addCell("Roll No");
            table1.addCell("Current Address");
            table1.addCell("MobileNumber");
            
           
        
        document.add(table1);
        PdfPTable table2 = new PdfPTable(7); 
      //  Font font = new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
       // table1.getDefaultCell().setFixedHeight(100);
		   table2.setWidthPercentage(100);
			 float[] columnWidths = new float[] {10f,30f,10f,10f,10f,15f,15f};
	           table2.setWidths(columnWidths);
	        List<EmployeeForm>  list= enrollmentservice.getEmployeeDetails();
	          // List<Salary> list=enrollmentservice.getSalaryDetails();
	           for(EmployeeForm list1:list)
	           {
	        	 
	        	  table2.addCell(String.valueOf(list1.getEmpid())); 
	       		  table2.addCell(list1.getEmpname());
		          table2.addCell(list1.getJoinedon());
	       	      table2.addCell(String.valueOf(list1.getEmpgender())); 
	          	  table2.addCell(String.valueOf(list1.getRollno()));
	        	  table2.addCell(String.valueOf(list1.getEmp_currentaddress()));
	        	  table2.addCell(String.valueOf(list1.getEmp_mobileno()));
	        	
	        	  
	        	  
	           }
			document.add(table2);
			document.close();
			
	}catch(Exception ex)
	{
		ex.printStackTrace();
	}
    	
    	
    	
		return document;
    	
    }
    
    @RequestMapping(value="/twowheeler")
    public String getTwowheelerpage(Map<String,Object>model)

    {
     //System.out.println("intwowheeler");
     Twowheeler twowheelerform=new Twowheeler();
     //System.out.println("intwowheeler after object creation");
     model.put("Twowheelerform",twowheelerform);
     //System.out.println("intwowheeler after model");
     return "twowheeler";
    }

    @RequestMapping(value="/saveTwowheeler")
    public String saveTwowheeler(Map<String,Object>model,@ModelAttribute("twowheeler")Twowheeler twowheeler )
    {
     System.out.println("in save twowheeler");
     Twowheeler twowheelerform=new Twowheeler();
     enrollmentservice.insertTwowheeler(twowheeler);
     model.put("Twowheelerform", twowheelerform);
     model.put("msg","Twowheeler Details Successfully Inserted");

     return "twowheeler";
    }

    @RequestMapping(value="/vehiclereport")
    public String getVehicle(Map<String,Object>model)
    {
     //VehicleReport vehicle = new VehicleReport();
    // model.put("vehiclereport", vehicle);
     return "vehiclereport";
    }

    @RequestMapping(value="/getvehicle")
    public String getVehicleDetails(Map<String,Object>model,@RequestParam("vehicletype")String vehicletype,@RequestParam("fromdate")String fromdate,@RequestParam("todate")String todate,HttpServletRequest request)
    {
    	
    	System.out.println("vehicletype:"+vehicletype);
        System.out.println("fromdate:"+fromdate);
        System.out.println("todate:"+todate);
     List<Twowheeler> list=enrollmentservice.getVehicledetails( vehicletype,fromdate,todate);
     System.out.println(list.size());
     model.put("vehicletype",request.getParameter("vehicletype"));
     model.put("fromdate",request.getParameter("fromdate"));
     model.put("todate",request.getParameter("todate"));
     model.put("list", list);
     
     return "vehicle_report_details";
        
    }
    @RequestMapping(value="/getvehiclepdf")
    public void getVehiclePdf(Map<String,Object>model,@RequestParam("vehicletype")String vehicletype,@RequestParam("fromdate")String fromdate,@RequestParam("todate")String todate,HttpServletRequest request, HttpServletResponse response)
    {
     //List<Twowheeler> list=enrollmentservice.getVehicledetails( vehicletype,fromdate,todate);
    	
    	
    	System.out.println("vehicletype:"+vehicletype);
        System.out.println("fromdate:"+fromdate);
        System.out.println("todate:"+todate);
        
    	 String type = request.getParameter("vehicletype");
         String fromdate1 = request.getParameter("fromdate");
         String todate1 = request.getParameter("todate");
         if( type.equals("All"))
         {
        	 System.out.println("All Wheelers");
        	 List<Twowheeler> list = enrollmentservice.getAllWheelers(type, fromdate1, todate1);
        	 model.put("list", list);
        	 try{
     			new VehiclePdfReport().writePdf(response.getOutputStream(),list, vehicletype);
     			}catch(Exception e)
     			{
     				e.printStackTrace();
     			}
         }
         
         else
         {
        	 List<Twowheeler> list=enrollmentservice.getVehicledetails( vehicletype,fromdate,todate);
             System.out.println(list.size());
             model.put("vehicletype",request.getParameter("vehicletype"));
             model.put("fromdate",request.getParameter("fromdate"));
             model.put("todate",request.getParameter("todate"));
             model.put("list", list);
             try{
     			new VehiclePdfReport().writePdf(response.getOutputStream(),list,vehicletype );
     			}catch(Exception e)
     			{
     				e.printStackTrace();
     			}
             
             
         }	
    
     
     
     System.out.println("In getvehiclepdf: Ramakrishna");
     
     
     
     
     
     
        
    }
    
    @RequestMapping(value="/savepassregister")
    public String saveRegister(Map<String,Object>model,@ModelAttribute("passes")PassRegister passregister)throws Exception{
    	
    	System.out.println("In savepass register controller");
    	PassRegister passregisterform=new PassRegister();
    	enrollmentservice.saveReg(passregister);
    	model.put("passregisterform", passregisterform);
    	model.put("msg","successfully pass details stored");
		return "pass_register";
    	
    }
    
    @RequestMapping(value="/getpassregister")
    public String getPassRegister(Map<String,Object>model,@ModelAttribute("passes")PassRegister passregister){
		
    	List<PassRegister> list=enrollmentservice.getPageRegister();
    	System.out.println("List Size In pass register controller"+list.size());
    	model.put("list", list);
    	return "pass_register_details";
    	
    }
    
    @RequestMapping(value="/sample")
    public String sample(Map<String,Object>model){
    	List<PassRegister> list=enrollmentservice.getPageRegister();
    	System.out.println("List Size In Sample controller"+list.size());
    	model.put("list", list);
    	   return "home";
    	
    }
    

    @RequestMapping(value = "/email")
	public String getEmployeeDetails(@RequestParam("id")int id, Map<String, Object> model, HttpServletRequest request) {
    	
    	System.out.println("welcome to email");
    	
    	PassRegister pass = enrollmentservice.getEmail(id);
    	model.put("id",pass.getId());
    	model.put("name",pass.getName());
    	model.put("email",pass.getEmail_id());
    	
    	System.out.println("email" + pass.getEmail_id());
    	
		
		return "EmailForm";

	}
   
    @Autowired
    private JavaMailSender mailSender;
    @RequestMapping(value="/sendemail")
    public String doSendEmail(HttpServletRequest request, Map<String,Object>model) {
        
        String recipientAddress = request.getParameter("recipient");
     String subject = request.getParameter("subject");
     String message = request.getParameter("message");
     
     System.out.println("To: " + recipientAddress);
     System.out.println("Subject: " + subject);
     System.out.println("Message: " + message);
     
     SimpleMailMessage email = new SimpleMailMessage();
     email.setTo(recipientAddress);
     email.setSubject(subject);
     email.setText(message);
     
     mailSender.send(email);
       model.put("msg","Email Sent Successfully!!"); 
       
       System.out.println("Message: In Send Mail");
        
     return "EmailForm";
       }
    
    @RequestMapping(value = "/pdfReport")
	public void getPdf(HttpServletRequest request,HttpServletResponse response)
	{
		
		
		
    	List<EmployeeForm> emplist=enrollmentservice.getEmployeeDetails();
		
		System.out.println("li1");               
		System.out.println(emplist);
		System.out.println("li2");
		try{
			new Pdf().writePdf(response.getOutputStream(),emplist);
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
		}
    
    @RequestMapping(value = "/vehiclereport1")
     public String getVreport(Map<String,Object>model,@RequestParam("vehicletype")String vehicletype,@RequestParam("fromdate")String fromdate,@RequestParam("todate")String todate,HttpServletRequest request) {
        
     String type = request.getParameter("vehicletype");
     String fromdate1 = request.getParameter("fromdate");
     String todate1 = request.getParameter("todate");
     if( type.equals("All"))
     {
    	 System.out.println("All Wheelers");
    	 List<Twowheeler> list = enrollmentservice.getAllWheelers(type, fromdate1, todate1);
    	 model.put("vehicletype",request.getParameter("vehicletype"));
         model.put("fromdate",request.getParameter("fromdate"));
         model.put("todate",request.getParameter("todate"));
    	 model.put("list", list);
     }
     
     else
     {
    	 List<Twowheeler> list=enrollmentservice.getVehicledetails( vehicletype,fromdate,todate);
         System.out.println(list.size());
         model.put("vehicletype",request.getParameter("vehicletype"));
         model.put("fromdate",request.getParameter("fromdate"));
         model.put("todate",request.getParameter("todate"));
         model.put("list", list);
         
         
     }
     
     
     
	return "vehicle_report_details";
    

    }
    
   /* @RequestMapping(value = "/getG4SSecurityReport1")
    public String getDtoDetails(Map<String,Object>model, @RequestParam("emp_id") int emp_id, HttpServletRequest request)
    {
    	
    	List<AgencyDto> list= enrollmentservice.getDtoDetails(emp_id);
    	model.put("list", list);
    	System.out.println(list);
    	System.out.println("in getDtoDetails controller ");
    	System.out.println(request.getParameter("empname"));
    	
    	return "g4s_report_details";
    }*/
    
    @RequestMapping(value = "/getG4SSecurityReport2")
    public String getDtoDetails1(Map<String,Object>model, @RequestParam("emp_id") int emp_id, @RequestParam("fromDate")String fromDate,@RequestParam("toDate")String toDate, HttpServletRequest request)
    {
    	
    	List<AgencyDto> list= enrollmentservice.getDtoDetails(emp_id, fromDate, toDate);
    	model.put("list", list);
    	model.put("emp_id", emp_id);
    	model.put("fromDate", fromDate);
    	model.put("toDate", toDate);
    	
    	
    	System.out.println(list);
    	System.out.println("in getDtoDetails controller ");
    	System.out.println("emp name:"+request.getParameter("empname"));
    	
    	return "g4s_report_details";
    }
    
    @RequestMapping(value= "/getInhouseSecurityReport")
    public String getDtoDetails5(Map<String,Object>model,  @RequestParam("emp_id") int emp_id, @RequestParam("fromDate")String fromDate,@RequestParam("toDate")String toDate, HttpServletRequest request)
    		{
    	List<InHosueDto> list= enrollmentservice.getDtoDetails5(emp_id, fromDate, toDate);
    	model.put("list", list);
    	model.put("emp_id", emp_id);
    	model.put("fromDate", fromDate);
    	model.put("toDate", toDate);
    	
    	System.out.println("EMp Id In getInhouseSecurityReport:"+emp_id);
    	System.out.println("list size in contropller h"+list.size());
    	System.out.println("in getDtoDetails controller ");
    	System.out.println(request.getParameter("empname"));
    	
    	return "inhouse_report_details";
    	
    		}
    
    @RequestMapping(value="/print")
    public String getEmployeedetailsprint(@RequestParam("empid")int empid,Map<String,Object>model,HttpServletRequest request){
    	
    	System.out.println("in Print Controller:");
    	
    	
    	System.out.println("welcome to update employee");
		EmployeeForm empform=enrollmentservice.employeeDetails(empid);
		//EmployeeLanguage emplanguage=enrollmentservice.employeeLanguage(empform.getEmpid());
		
		model.put("empimage", empform.getImageFile());
		model.put("empsidephoto", empform.getImageFile2());
		model.put("empthumbphoto", empform.getImageFile3());
		model.put("empid",empform.getEmpid());
		model.put("empname",empform.getEmpname());
		model.put("dob",empform.getEmpdob());
	    model.put("gender", empform.getEmpgender());
		model.put("fname",empform.getEmpfname());
	    model.put("faddress",empform.getEmpfproffession());
		model.put("fcontact",empform.getFcontactno());
		model.put("emphight",empform.getEmp_hight());
		model.put("empweight",empform.getEmp_weight());
		
		model.put("currentaddress",empform.getEmp_currentaddress());
		model.put("mobilenumber",empform.getEmp_mobileno());
		model.put("permanentaddress",empform.getEmp_permanentaddress());
				
		System.out.println("emp name in controller:"+empform.getEmpname());
		System.out.println("Mobile No in controller:"+empform.getEmp_mobileno());
		
		model.put("alternatemobile",empform.getEmp_alternatemobileno());
		model.put("email",empform.getEmp_email());
		model.put("maritalstatus",empform.getEmp_maritalstatus());
		model.put("noofchildrens",empform.getEmp_noofchildrens());
		model.put("noofsons",empform.getEmp_noofsons());
		model.put("sonage",empform.getEmp_sonage());
		model.put("noofdaughters", empform.getEmp_noofdaughters());
		model.put("daughterage",empform.getEmp_daughterage());
		model.put("empdate",empform.getEmp_date());
		model.put("empplace",empform.getEmp_place());
		model.put("probation",empform.getEmp_probation_period());
		model.put("deptpost",empform.getEmp_department());
		model.put("designation",empform.getEmp_designation());
		model.put("expecteddate",empform.getEmp_expected_joining_date());
		model.put("joinedon",empform.getJoinedon());
		model.put("rejoineddate",empform.getEmp_rejoined_date());
		model.put("officesupervisor",empform.getEmp_office_supervisor());
		model.put("training",empform.getEmp_head_training());
		model.put("security",empform.getEmp_head_ashram_security());
		model.put("empstatus",empform.getEmpstatus());
		model.put("empsalary",empform.getEmployee_salary());
		model.put("rollno",empform.getRollno());
		System.out.println("employee status"+empform.getEmpstatus());
		System.out.println("head ashram security"+empform.getEmp_head_ashram_security());
		
		
		
		model.put("list",enrollmentservice.employeeFamilyDetails(empform.getEmpid()));
		//EmployeeLanguage emplanguage=enrollmentservice.employeeLanguage(empid);
		/*model.put("empid",empform.getEmpid());
		model.put("id",emplanguage.getId());
		model.put("languageknown",emplanguage.getEmp_lang_known());
		model.put("speak",emplanguage.getEmp_lang_speak());
		model.put("read",emplanguage.getEmp_lang_read());
		model.put("write",emplanguage.getEmp_lang_write());
		model.put("level",emplanguage.getEmp_lang_level());
		System.out.println("hai" +emplanguage.getEmpid());
		System.out.println("hai" +emplanguage.getId());
		System.out.println("hai" +emplanguage.getEmp_lang_known());
		System.out.println("hai" +emplanguage.getEmp_lang_speak());
		System.out.println("hai" +emplanguage.getEmp_lang_read());
		System.out.println("hai" +emplanguage.getEmp_lang_write());*/
		model.put("educationlist",enrollmentservice.employeeEducation(empform.getEmpid()));
	    model.put("languagelist", enrollmentservice.employeeLanguage(empform.getEmpid()));
	    model.put("worklist", enrollmentservice.employeeWork(empform.getEmpid()));
        model.put("artoflivinglist", enrollmentservice.employeeArtofliving(empform.getEmpid()));
		model.put("activitieslist", enrollmentservice.employeeActivity(empform.getEmpid()));
		model.put("recommendationlist",enrollmentservice.empRecommendation(empform.getEmpid()));
		model.put("referencelist",enrollmentservice.empReferences(empform.getEmpid()));
    	
    	
    	
    	return "print";
    }
    
    
   
}



