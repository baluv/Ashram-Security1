package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;


@SuppressWarnings("serial")
@Entity
@Table(name="employee_form")
public class EmployeeForm {
	
	@Id
	@GeneratedValue
	@Column(name="emp_id")
	private Integer empid;
	
	@Column(name="emp_name")
	private String empname;
	
	@Column(name="emp_dob")
	private String empdob;
	
	@Column(name="emp_gender")
	private String empgender;
	
	@Column(name="emp_father_name")
	private String empfname;
	
	@Column(name="emp_father_profession")
	private String empfproffession;
	
	@Column(name="emp_father_contactno")
	private String fcontactno;
	
	@Column(name="emp_current_address")
	private String emp_currentaddress;
	
	@Column(name="emp_mobile_no")
	private String emp_mobileno;
	
	@Column(name="emp_permanent_address")
	private String emp_permanentaddress;
	
	@Column(name="emp_alternative_mobile_no")
	private String emp_alternatemobileno;
	
	@Column(name="emp_email")
	private String emp_email;
	
	@Column(name="emp_marital_status")
	private String emp_maritalstatus;
	
	@Column(name="emp_noofchildrens")
	private String emp_noofchildrens;
	
	@Column(name="emp_noofsons")
	private String emp_noofsons;
	
	@Column(name="emp_sonage")
	private String emp_sonage;
	
	@Column(name="emp_noofdaughters")
	private String emp_noofdaughters;
	
	@Column(name="emp_daughterage")
	private String emp_daughterage;
	
	
	
	@Lob
	@Column(name="emp_photo")
	private String ImageFile;
	
	
	@Lob
	@Column(name="emp_side_photo")
	private String ImageFile2;
	
	@Lob
	@Column(name="emp_thumb_photo")
	private String ImageFile3;
	
	@Column(name="emp_hight")
	private String emp_hight;
	
	@Column(name="emp_weight")
	private String emp_weight;
	
	@Column(name="emp_date")
	private String emp_date;
	
	@Column(name="emp_place")
	private String emp_place;
	
	@Column(name="emp_probation_period")
	private String emp_probation_period;
	
	@Column(name="emp_department")
	private String emp_department;
	
	@Column(name="emp_designation_period")
	private String emp_designation;
	
	@Column(name="emp_expected_joining_date")
	private String emp_expected_joining_date;
	
	@Column(name="emp_joinedon")
	private String joinedon;
	
	@Column(name="emp_office_supervisor")
	private String emp_office_supervisor;
	
	@Column(name="emp_head_training")
	private String emp_head_training;
	
	@Column(name="emp_head_ashram_security")
	private String emp_head_ashram_security;
	
	@Column(name="emp_status")
	private String empstatus="Working";
	
	@Column(name="emp_rejoined_date")
	private String emp_rejoined_date;
	
	@Column(name="employee_salary")
	private int employee_salary;
	
	@Column(name="emp_Category")
	private String category;
	
	@Column(name="Roll_no")
	private String rollno;
	
	
	
	
	
	
	public int getEmployee_salary() {
		return employee_salary;
	}
	public void setEmployee_salary(int employee_salary) {
		this.employee_salary = employee_salary;
	}
	public String getEmp_rejoined_date() {
		return emp_rejoined_date;
	}
	public void setEmp_rejoined_date(String emp_rejoined_date) {
		this.emp_rejoined_date = emp_rejoined_date;
	}
	public String getEmpstatus() {
		return empstatus;
	}
	public void setEmpstatus(String empstatus) {
		this.empstatus = empstatus;
	}
	public String getEmp_probation_period() {
		return emp_probation_period;
	}
	public void setEmp_probation_period(String emp_probation_period) {
		this.emp_probation_period = emp_probation_period;
	}
	public String getEmp_department() {
		return emp_department;
	}
	public void setEmp_department(String emp_department) {
		this.emp_department = emp_department;
	}
	public String getEmp_designation() {
		return emp_designation;
	}
	public void setEmp_designation(String emp_designation) {
		this.emp_designation = emp_designation;
	}
	public String getEmp_expected_joining_date() {
		return emp_expected_joining_date;
	}
	public void setEmp_expected_joining_date(String emp_expected_joining_date) {
		this.emp_expected_joining_date = emp_expected_joining_date;
	}
	public String getJoinedon() {
		return joinedon;
	}
	public void setJoinedon(String joinedon) {
		this.joinedon = joinedon;
	}
	public String getEmp_office_supervisor() {
		return emp_office_supervisor;
	}
	public void setEmp_office_supervisor(String emp_office_supervisor) {
		this.emp_office_supervisor = emp_office_supervisor;
	}
	public String getEmp_head_training() {
		return emp_head_training;
	}
	public void setEmp_head_training(String emp_head_training) {
		this.emp_head_training = emp_head_training;
	}
	public String getEmp_head_ashram_security() {
		return emp_head_ashram_security;
	}
	public void setEmp_head_ashram_security(String emp_head_ashram_security) {
		this.emp_head_ashram_security = emp_head_ashram_security;
	}
	public String getEmp_date() {
		return emp_date;
	}
	public void setEmp_date(String emp_date) {
		this.emp_date = emp_date;
	}
	public String getEmp_place() {
		return emp_place;
	}
	public void setEmp_place(String emp_place) {
		this.emp_place = emp_place;
	}
	/*@OneToMany(fetch = FetchType.LAZY, mappedBy = "employee_form")
	private Set<EmployeeFamily> employeefamily;
	
	
	public Set<EmployeeFamily> getEmployeefamily() {
		return employeefamily;
	}
	public void setEmployeefamily(Set<EmployeeFamily> employeefamily) {
		this.employeefamily = employeefamily;
	}*/
	
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getEmpdob() {
		return empdob;
	}
	public void setEmpdob(String empdob) {
		this.empdob = empdob;
	}
	public String getEmpgender() {
		return empgender;
	}
	public void setEmpgender(String empgender) {
		this.empgender = empgender;
	}
	public String getEmpfname() {
		return empfname;
	}
	public void setEmpfname(String empfname) {
		this.empfname = empfname;
	}
	public String getEmpfproffession() {
		return empfproffession;
	}
	public void setEmpfproffession(String empfproffession) {
		this.empfproffession = empfproffession;
	}
	public String getFcontactno() {
		return fcontactno;
	}
	public void setFcontactno(String fcontactno) {
		this.fcontactno = fcontactno;
	}
	public String getEmp_currentaddress() {
		return emp_currentaddress;
	}
	public void setEmp_currentaddress(String emp_currentaddress) {
		this.emp_currentaddress = emp_currentaddress;
	}
	
	public String getEmp_permanentaddress() {
		return emp_permanentaddress;
	}
	public String getEmp_mobileno() {
		return emp_mobileno;
	}
	public void setEmp_mobileno(String emp_mobileno) {
		this.emp_mobileno = emp_mobileno;
	}
	public void setEmp_permanentaddress(String emp_permanentaddress) {
		this.emp_permanentaddress = emp_permanentaddress;
	}
	public String getEmp_alternatemobileno() {
		return emp_alternatemobileno;
	}
	public void setEmp_alternatemobileno(String emp_alternatemobileno) {
		this.emp_alternatemobileno = emp_alternatemobileno;
	}
	public String getEmp_email() {
		return emp_email;
	}
	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}
	public String getEmp_maritalstatus() {
		return emp_maritalstatus;
	}
	public void setEmp_maritalstatus(String emp_maritalstatus) {
		this.emp_maritalstatus = emp_maritalstatus;
	}
	
	
	public String getEmp_noofchildrens() {
		return emp_noofchildrens;
	}
	public void setEmp_noofchildrens(String emp_noofchildrens) {
		this.emp_noofchildrens = emp_noofchildrens;
	}
	public String getEmp_noofsons() {
		return emp_noofsons;
	}
	public void setEmp_noofsons(String emp_noofsons) {
		this.emp_noofsons = emp_noofsons;
	}
	public String getEmp_noofdaughters() {
		return emp_noofdaughters;
	}
	public void setEmp_noofdaughters(String emp_noofdaughters) {
		this.emp_noofdaughters = emp_noofdaughters;
	}
	public String getEmp_sonage() {
		return emp_sonage;
	}
	public void setEmp_sonage(String emp_sonage) {
		this.emp_sonage = emp_sonage;
	}
	
	public String getEmp_daughterage() {
		return emp_daughterage;
	}
	public void setEmp_daughterage(String emp_daughterage) {
		this.emp_daughterage = emp_daughterage;
	}
	
	
	
	
	public String getImageFile() {
		return ImageFile;
	}
	public void setImageFile(String imageFile) {
		ImageFile = imageFile;
	}
	public Integer getEmpid() {
		return empid;
	}
	public void setEmpid(Integer empid) {
		this.empid = empid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getImageFile2() {
		return ImageFile2;
	}
	public void setImageFile2(String imageFile2) {
		ImageFile2 = imageFile2;
	}
	public String getImageFile3() {
		return ImageFile3;
	}
	public void setImageFile3(String imageFile3) {
		ImageFile3 = imageFile3;
	}
	public String getEmp_hight() {
		return emp_hight;
	}
	public void setEmp_hight(String emp_hight) {
		this.emp_hight = emp_hight;
	}
	public String getEmp_weight() {
		return emp_weight;
	}
	public void setEmp_weight(String emp_weight) {
		this.emp_weight = emp_weight;
	}
	
	
	
}
