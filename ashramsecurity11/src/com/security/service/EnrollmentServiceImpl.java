package com.security.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.security.dao.EnrollmentDAO;
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
import com.security.domain.LostItems;
import com.security.domain.PassRegister;
import com.security.domain.Salary;
import com.security.domain.Twowheeler;
import com.security.dto.AgencyDto;
import com.security.dto.InHosueDto;



@Transactional
public class EnrollmentServiceImpl implements EnrollmentService{
	
	@Autowired
	public EnrollmentDAO enrollmentdao;
	public String getRole(String username,String password)
	{
		return enrollmentdao.getRole(username, password);
	}
	public void insertEmployee(EmployeeForm empform)
	{
		enrollmentdao.insertEmployee(empform);
	}
	public void insertEmpFamily(EmployeeFamily empfamily)
	{
		enrollmentdao.insertEmpFamily(empfamily);
	}
	public void saveEmpLang(EmployeeLanguage emplang)
	{
		enrollmentdao.saveEmpLang(emplang);
	}
	public void saveEmpEducation(EmployeeEducation empeducation)
	{
		enrollmentdao.saveEmpEducation(empeducation);
	}
	public void saveEmpWork(EmployeeWork empwork)
	{
		enrollmentdao.saveEmpWork(empwork);
	}
	public void saveEmpActivity(EmployeeActivities empactivities)
	{
		enrollmentdao.saveEmpActivity(empactivities);
	}
	public void saveArtofliving(ArtofLiving artofliving)
	{
		enrollmentdao.saveArtofliving(artofliving);
	}
	public void saveEmployeeRecommendation(EmployeeRecommendation empracommendation)
	{
		enrollmentdao.saveEmployeeRecommendation(empracommendation);
	}
	public void saveEmployeeReferences(EmployeeReferences empreferences)
	{
		enrollmentdao.saveEmployeeReferences(empreferences);
	}
	public List<EmployeeForm> getEmployeeList(String empname)
	{
	return	enrollmentdao.getEmployeeList(empname);
	}
	public List<EmployeeForm> getEmployeeDetails()
	{
		return enrollmentdao.getEmployeeDetails();
	}
	public void deleteEmployee(int empid)
	{
	enrollmentdao.deleteEmployee(empid);
	}
	public EmployeeForm employeeDetails(int empid)
	{
		return enrollmentdao.employeeDetails(empid);
	}
	public List<EmployeeFamily> employeeFamilyDetails(int empid)
	{
		return enrollmentdao.employeeFamilyDetails(empid);
	}
	public List<EmployeeEducation> employeeEducation(int empid)
	{
		return enrollmentdao.employeeEducation(empid);
	}
	public List<EmployeeLanguage> employeeLanguage(int empid)
	{
		return enrollmentdao.employeeLanguage(empid);
	}
	public List<EmployeeWork> employeeWork(int empid)
	{
	return	enrollmentdao.employeeWork(empid);
	}
	
	public List<EmployeeActivities> employeeActivity(int empid)
	{
		return enrollmentdao.employeeActivity(empid);
	}
	public List<ArtofLiving> employeeArtofliving(int empid)
	{
		return enrollmentdao.employeeArtofliving(empid);
	}
	public List<EmployeeRecommendation> empRecommendation(int empid)
	{
		return enrollmentdao.empRecommendation(empid);
	}
	public List<EmployeeReferences> empReferences(int empid)
	{
		return enrollmentdao.empReferences(empid);
	}
	public void updateEmployee(EmployeeForm empform)
	{
		enrollmentdao.updateEmployee(empform);
	}
	public void updateFamily(EmployeeFamily empfamily)
	{
		enrollmentdao.updateFamily(empfamily);
	}
	public void updateLanguage(EmployeeLanguage emplanguage)
	{
		enrollmentdao.updateLanguage(emplanguage);
	}
	public void updateEducation(EmployeeEducation empeducation)
	{
		enrollmentdao.updateEducation(empeducation);
	}
	public void updateWork(EmployeeWork empwork)
	{
		enrollmentdao.updateWork(empwork);
	}
	public void updateActivity(EmployeeActivities empactivity)
	{
		enrollmentdao.updateActivity(empactivity);
	}
	public void updateArtofliving(ArtofLiving artofliving)
	{
		enrollmentdao.updateArtofliving(artofliving);
	}
	public void updateRecommendation(EmployeeRecommendation emprecommendation)
	{
		enrollmentdao.updateRecommendation(emprecommendation);
	}
	public void updateReferences(EmployeeReferences empreferences)
	{
		enrollmentdao.updateReferences(empreferences);
	}
	public void insertG4SSecurity(G4SSecurity g4ssecurity)
	{
		enrollmentdao.insertG4SSecurity(g4ssecurity);
	}
	public void saveInhouseSecurity(InhouseSecurity inhousesecurity)
	{
		enrollmentdao.saveInhouseSecurity(inhousesecurity);
	}
	public List<G4SSecurity> getG4SSecuritydetails()
	{
		return enrollmentdao.getG4SSecuritydetails();
	}
	public List<G4SSecurity> getG4SSecuritydetailsById(int id)
	{
		return enrollmentdao.getG4SSecuritydetailsById(id);
	}
	public List<InhouseSecurity> getInhouswSecuritydetails()
	{
		return enrollmentdao.getInhouswSecuritydetails();
	}
	public List<InhouseSecurity> getMonthelyInhouseSecurityDetails(int emp_id,String fromDate,String toDate)
	{
		return enrollmentdao.getMonthelyInhouseSecurityDetails(emp_id,fromDate, toDate);
	}
	public List<G4SSecurity> getMonthelyG4SSecurityDetails(int emp_id,String fromDate,String toDate)
	{
		return enrollmentdao.getMonthelyG4SSecurityDetails(emp_id,fromDate, toDate);
	}
	public List<G4SSecurity> getG4SSecurityDetailsByDate(String Date)
	{
		return enrollmentdao.getG4SSecurityDetailsByDate(Date);
	}
	public int getCountOfLeaves(int emp_id,String fromDate,String toDate)
	{
		return enrollmentdao.getCountOfLeaves(emp_id,fromDate,toDate);
	}
	
	public Long getTotalNoofWorkingDays(int emp_id,String Date)
	{
		return enrollmentdao.getTotalNoofWorkingDays(emp_id,Date);
	}
	public Long getInhouseTotalNoofWorkingDays(int emp_id,String Date)
	{
		return enrollmentdao.getInhouseTotalNoofWorkingDays(emp_id, Date);
	}
	
	public List<EmployeeForm> getEmpname(int emp_id)
	{
		return enrollmentdao.getEmpname(emp_id);
	}
	/*public List getInhouseEmpname()
	{
		return enrollmentdao.getInhouseEmpname();
	}*/
	/*public List getG4SEmpname()
	{
		return enrollmentdao.getG4SEmpname();
	}*/
	public Long getPoDayShiftCount(String Date)
	{
		return enrollmentdao.getPoDayShiftCount(Date);
	}
	public Long getPoNightShiftCount(String Date)
	{
		return enrollmentdao.getPoNightShiftCount(Date);
	}
	public Long getSsDayShiftCount(String Date)
	{
		return enrollmentdao.getSsDayShiftCount(Date);
	}
	public Long getSsNightShiftCount(String Date)
	{
		return enrollmentdao.getSsNightShiftCount(Date);
	}
	public Long getHgDayShiftCount(String Date)
	{
		return enrollmentdao.getHgDayShiftCount(Date);
	}
	public Long getHgNightShiftCount(String Date)
	{
		return enrollmentdao.getHgNightShiftCount(Date);
	}
	public Long getSgDayShiftCount(String Date)
	{
		return enrollmentdao.getSgDayShiftCount(Date);
	}
	public Long getSgNightShiftCount(String Date)
	{
		return enrollmentdao.getSgNightShiftCount(Date);
	}
	public Long getInhousePoDayShiftCount(String Date)
	{
		return enrollmentdao.getInhousePoDayShiftCount(Date);
	}
	public Long getInhousePoNightShiftCount(String Date)
	{
		return enrollmentdao.getInhousePoNightShiftCount(Date);
	}
	public Long getInhouseSsDayShiftCount(String Date)
	{
		return enrollmentdao.getInhouseSsDayShiftCount(Date);
	}
	public Long getInhouseSsNightShiftCount(String Date)
	{
		return enrollmentdao.getInhouseSsNightShiftCount(Date);
	}
	public Long getInhouseHgDayShiftCount(String Date)
	{
		return enrollmentdao.getInhouseHgDayShiftCount(Date);
	}
	public Long getInhouseHgNightShiftCount(String Date)
	{
		return enrollmentdao.getInhouseHgNightShiftCount(Date);
	}
	public Long getInhouseSgDayShiftCount(String Date)
	{
		return enrollmentdao.getInhouseSgDayShiftCount(Date);
	}
	public Long getInhouseSgNightShiftCount(String Date)
	{
		return enrollmentdao.getInhouseSgNightShiftCount(Date);
	}
	public void saveLostItems(LostItems lostitems)
	{
		enrollmentdao.saveLostItems(lostitems);
	}
	public void saveFoundItems(FoundItems founditems)
	{
		enrollmentdao.saveFoundItems(founditems);
	}
	public List<LostItems> getLostItemDetails()
	{
		return enrollmentdao.getLostItemDetails();
	}
	public List<FoundItems> getFoundItemDetails()
	{
		return enrollmentdao.getFoundItemDetails();
	}
	public void saveSalary(Salary salary)
	{
		enrollmentdao.saveSalary(salary);
	}
	public List<Salary> getG4SSalaryDetails()
	{
		return enrollmentdao.getG4SSalaryDetails();
	}
	public List<EmployeeSalaryDTO> getG4SEmployeeSalaryDetails()
	{
		return enrollmentdao.getG4SEmployeeSalaryDetails();
	}
	public List<EmployeeSalaryDTO> getInhouseEmployeeSalaryDetails()
	{
		return enrollmentdao.getInhouseEmployeeSalaryDetails();
	}
	public void insertLeaveForm(LeaveApplication leaveapplication)
	 {
	  System.out.println("in service");
	  enrollmentdao.insertLeaveForm(leaveapplication);
	 }
	public List<LeaveApplication> getLeaveDetails()
	 {
	  return enrollmentdao.getLeaveDetails();
	 }
	public void insertTwowheeler(Twowheeler twowheeler)
	 {
	  System.out.println("in service");
	  enrollmentdao.insertTwowheeler(twowheeler);
	 }
	public List<Twowheeler> getVehicledetails(String empname,String fromdate,String todate){
		return enrollmentdao.getVehicledetails(empname, fromdate, todate);
	}
	public List<EmployeeLeaveDTO> getEmployeeLeaveDetails()
	{
		return enrollmentdao.getEmployeeLeaveDetails();
	}
	
	
	public void saveReg(PassRegister passregister) {
		
		enrollmentdao.saveReg(passregister);
		
	}
	
	
	public List<PassRegister> getPageRegister() {
		
		return enrollmentdao.getPassRegister();
	}
	
	/*public List<PassRegister> getEmail(String name, String email_id) {
		
		return enrollmentdao.getEmail(name, email_id);
	}*/
	
	
	
	public PassRegister getEmail(int id) {
				
		return enrollmentdao.getEmail(id);
	}
	
	public List<Twowheeler> getAllWheelers(String type, String fromdate,
			String todate) {
		
		return enrollmentdao.getAllWheelers(type, fromdate,todate);
	}
	
	public List<AgencyDto> getDtoDetails(int emp_id, String fromDate, String toDate) {
		
		return enrollmentdao.getDtoDetails(emp_id,fromDate,toDate);
	}
	
	
	public List<InHosueDto> getDtoDetails5(int emp_id, String fromDate, String toDate) {
		
		return enrollmentdao.getDtoDetails5(emp_id,fromDate,toDate);
	}
	
	

	
}
