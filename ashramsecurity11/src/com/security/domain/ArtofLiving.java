package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee_artofliving")
public class ArtofLiving {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="emp_id")
	private int empid;
	
	@Column(name="emp_course")
	private String emp_course;
	
	@Column(name="emp_location")
	private String emp_location;
	
	@Column(name="emp_teacher")
	private String emp_teacher;
	
	@Column(name="emp_date")
	private String emp_date;
	
	@Column(name="emp_remarks")
	private String emp_remarks;

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

	public String getEmp_course() {
		return emp_course;
	}

	public void setEmp_course(String emp_course) {
		this.emp_course = emp_course;
	}

	public String getEmp_location() {
		return emp_location;
	}

	public void setEmp_location(String emp_location) {
		this.emp_location = emp_location;
	}

	public String getEmp_teacher() {
		return emp_teacher;
	}

	public void setEmp_teacher(String emp_teacher) {
		this.emp_teacher = emp_teacher;
	}

	public String getEmp_date() {
		return emp_date;
	}

	public void setEmp_date(String emp_date) {
		this.emp_date = emp_date;
	}

	public String getEmp_remarks() {
		return emp_remarks;
	}

	public void setEmp_remarks(String emp_remarks) {
		this.emp_remarks = emp_remarks;
	}
	
	

}
