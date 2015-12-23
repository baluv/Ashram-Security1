package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee_recommendation")
public class EmployeeRecommendation {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="emp_id")
	private int empid;
	
	@Column(name="emp_name_address")
	private String emp_name_address;
	
	@Column(name="emp_teachercode")
	private String emp_teachercode;
	
	@Column(name="emp_teacher_mobile")
	private String emp_teacher_mobile;
	
	@Column(name="emp_teacher_email")
	private String emp_teacher_email;

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

	public String getEmp_name_address() {
		return emp_name_address;
	}

	public void setEmp_name_address(String emp_name_address) {
		this.emp_name_address = emp_name_address;
	}

	public String getEmp_teachercode() {
		return emp_teachercode;
	}

	public void setEmp_teachercode(String emp_teachercode) {
		this.emp_teachercode = emp_teachercode;
	}

	public String getEmp_teacher_mobile() {
		return emp_teacher_mobile;
	}

	public void setEmp_teacher_mobile(String emp_teacher_mobile) {
		this.emp_teacher_mobile = emp_teacher_mobile;
	}

	public String getEmp_teacher_email() {
		return emp_teacher_email;
	}

	public void setEmp_teacher_email(String emp_teacher_email) {
		this.emp_teacher_email = emp_teacher_email;
	}
	

}
