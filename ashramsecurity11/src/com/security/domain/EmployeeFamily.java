package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="employee_family_details")
public class EmployeeFamily {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="emp_id")
	private int empid;
	
	@Column(name="emp_family_names")
	private String emp_fname;
	
	@Column(name="emp_relationship")
	private String emp_relationship;
	
	@Column(name="emp_family_occupation")
	private String emp_foccupation;
	
	@Column(name="emp_family_age")
	private String emp_fage;
 
	
	
	


	public String getEmp_fname() {
		return emp_fname;
	}

	public void setEmp_fname(String emp_fname) {
		this.emp_fname = emp_fname;
	}

	public String getEmp_relationship() {
		return emp_relationship;
	}

	public void setEmp_relationship(String emp_relationship) {
		this.emp_relationship = emp_relationship;
	}

	public String getEmp_foccupation() {
		return emp_foccupation;
	}

	public void setEmp_foccupation(String emp_foccupation) {
		this.emp_foccupation = emp_foccupation;
	}

	public String getEmp_fage() {
		return emp_fage;
	}

	public void setEmp_fage(String emp_fage) {
		this.emp_fage = emp_fage;
	}

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

	

}
