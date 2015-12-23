package com.security.service;


import java.util.List;


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

public interface EnrollmentService {
	public String getRole(String username,String password);
	public void insertEmployee(EmployeeForm empform);
	public void insertEmpFamily(EmployeeFamily empfamily);
	public void saveEmpLang(EmployeeLanguage emplang);
	public void saveEmpEducation(EmployeeEducation empeducation);
	public void saveEmpWork(EmployeeWork empwork);
	public void saveEmpActivity(EmployeeActivities empactivities);
	public void saveArtofliving(ArtofLiving artofliving);
	public void saveEmployeeRecommendation(EmployeeRecommendation empracommendation);
	public void saveEmployeeReferences(EmployeeReferences empreferences);
	public List<EmployeeForm> getEmployeeList(String empname);
	public List<EmployeeForm> getEmployeeDetails();
	public void deleteEmployee(int empid);
	public EmployeeForm employeeDetails(int empid);
	public List<EmployeeFamily> employeeFamilyDetails(int empid);
	public List<EmployeeEducation> employeeEducation(int empid);
	public List<EmployeeLanguage> employeeLanguage(int empid);
	public List<EmployeeWork> employeeWork(int empid);
	public List<EmployeeActivities> employeeActivity(int empid);
	public List<ArtofLiving> employeeArtofliving(int empid);
	public List<EmployeeRecommendation> empRecommendation(int empid);
	public List<EmployeeReferences> empReferences(int empid);
	public void updateEmployee(EmployeeForm empform);
	public void updateFamily(EmployeeFamily empfamily);
	public void updateLanguage(EmployeeLanguage emplanguage);
	public void updateEducation(EmployeeEducation empeducation);
	public void updateWork(EmployeeWork empwork);
	public void updateActivity(EmployeeActivities empactivity);
	public void updateArtofliving(ArtofLiving artofliving);
	public void updateRecommendation(EmployeeRecommendation emprecommendation);
	public void updateReferences(EmployeeReferences empreferences);
	public void insertG4SSecurity(G4SSecurity g4ssecurity);
	public void saveInhouseSecurity(InhouseSecurity inhousesecurity);
	public List<G4SSecurity> getG4SSecuritydetails();
	public List<G4SSecurity> getG4SSecuritydetailsById(int id);
	public List<InhouseSecurity> getInhouswSecuritydetails();
	public List<G4SSecurity> getMonthelyG4SSecurityDetails(int emp_id,String fromDate,String toDate);
	public List<G4SSecurity> getG4SSecurityDetailsByDate(String Date);
	public List<InhouseSecurity> getMonthelyInhouseSecurityDetails(int emp_id,String fromDate,String toDate);
	public List<EmployeeForm> getEmpname(int emp_id);
	//public List getInhouseEmpname();
	//public List getG4SEmpname();
	public Long getPoDayShiftCount(String Date);
	public Long getPoNightShiftCount(String Date);
	public Long getSsDayShiftCount(String Date);
	public Long getSsNightShiftCount(String Date);
	public Long getHgDayShiftCount(String Date);
	public Long getHgNightShiftCount(String Date);
	public Long getSgDayShiftCount(String Date);
	public Long getSgNightShiftCount(String Date);
	public Long getInhousePoDayShiftCount(String Date);
	public Long getInhousePoNightShiftCount(String Date);
	public Long getInhouseSsDayShiftCount(String Date);
	public Long getInhouseSsNightShiftCount(String Date);
	public Long getInhouseHgDayShiftCount(String Date);
	public Long getInhouseHgNightShiftCount(String Date);
	public Long getInhouseSgDayShiftCount(String Date);
	public Long getInhouseSgNightShiftCount(String Date);
	public int getCountOfLeaves(int emp_id,String fromDate,String toDate);
	public Long getTotalNoofWorkingDays(int emp_id,String Date);
	public Long getInhouseTotalNoofWorkingDays(int emp_id,String Date);
	public void saveLostItems(LostItems lostitems);
	public void saveFoundItems(FoundItems founditems);
	public List<LostItems> getLostItemDetails();
	public List<FoundItems> getFoundItemDetails();
	public void saveSalary(Salary salary);
	public List<Salary> getG4SSalaryDetails();
	public List<EmployeeSalaryDTO> getG4SEmployeeSalaryDetails();
	public List<EmployeeSalaryDTO> getInhouseEmployeeSalaryDetails();
	public void insertLeaveForm(LeaveApplication leaveapplication);
	public List<LeaveApplication> getLeaveDetails();
	public void insertTwowheeler(Twowheeler twowheeler);
	public List<Twowheeler> getVehicledetails(String empname,String fromdate,String todate);
	public List<EmployeeLeaveDTO> getEmployeeLeaveDetails();
	
	public void saveReg(PassRegister passregister);
	
	public List<PassRegister> getPageRegister();
	
	//public List<PassRegister> getEmail(String name, String email_id);
	
	public PassRegister getEmail(int id);
	public List<Twowheeler> getAllWheelers(String type, String fromdate, String todate);
	public List<AgencyDto> getDtoDetails(int emp_id, String fromDate, String toDate);
	public List<InHosueDto> getDtoDetails5(int emp_id, String fromDate, String toDate);
	
	

}
