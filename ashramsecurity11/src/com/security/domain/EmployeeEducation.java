package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee_educational_details")
public class EmployeeEducation {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	
	@Column(name="emp_id")
	private int empid;
	
	@Column(name="emp_exam_passed")
	private String emp_exam_passed;
	
	@Column(name="emp_institute")
	private String emp_institute;

	@Column(name="emp_duration_course")
	private String emp_duration_course;
	
	@Column(name="emp_yearofpass")
	private String emp_yearofpass;
	
	@Column(name="emp_percentage")
	private String emp_percentage;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public String getEmp_exam_passed() {
		return emp_exam_passed;
	}

	public void setEmp_exam_passed(String emp_exam_passed) {
		this.emp_exam_passed = emp_exam_passed;
	}

	public String getEmp_institute() {
		return emp_institute;
	}

	public void setEmp_institute(String emp_institute) {
		this.emp_institute = emp_institute;
	}

	public String getEmp_duration_course() {
		return emp_duration_course;
	}

	public void setEmp_duration_course(String emp_duration_course) {
		this.emp_duration_course = emp_duration_course;
	}

	public String getEmp_yearofpass() {
		return emp_yearofpass;
	}

	public void setEmp_yearofpass(String emp_yearofpass) {
		this.emp_yearofpass = emp_yearofpass;
	}

	public String getEmp_percentage() {
		return emp_percentage;
	}

	public void setEmp_percentage(String emp_percentage) {
		this.emp_percentage = emp_percentage;
	}
	
}
