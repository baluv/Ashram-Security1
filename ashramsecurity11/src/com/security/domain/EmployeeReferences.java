package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee_references")
public class EmployeeReferences {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="emp_id")
	private int empid;
	
	@Column(name="emp_ref_name")
	private String emp_ref_name;
	
	@Column(name="emp_ref_address")
	private String emp_ref_address;
	
	@Column(name="emp_ref_mobile")
	private String emp_ref_mobile;
	
	@Column(name="emp_ref_emailid")
	private String emp_ref_emailid;

	public String getEmp_ref_emailid() {
		return emp_ref_emailid;
	}

	public void setEmp_ref_emailid(String emp_ref_emailid) {
		this.emp_ref_emailid = emp_ref_emailid;
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

	public String getEmp_ref_name() {
		return emp_ref_name;
	}

	public void setEmp_ref_name(String emp_ref_name) {
		this.emp_ref_name = emp_ref_name;
	}

	public String getEmp_ref_address() {
		return emp_ref_address;
	}

	public void setEmp_ref_address(String emp_ref_address) {
		this.emp_ref_address = emp_ref_address;
	}

	public String getEmp_ref_mobile() {
		return emp_ref_mobile;
	}

	public void setEmp_ref_mobile(String emp_ref_mobile) {
		this.emp_ref_mobile = emp_ref_mobile;
	}

}
