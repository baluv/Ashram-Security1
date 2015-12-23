package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee_workexp")
public class EmployeeWork {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="emp_id")
	private int empid;
	
	@Column(name="emp_company_name")
	private String emp_company_name;
	
	@Column(name="emp_designation")
	private String emp_designation;
	
	@Column(name="emp_sal")
	private String emp_sal;
	
	@Column(name="emp_period")
	private String emp_period;
	
	@Column(name="emp_leavejob")
	private String emp_leavejob;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getEmp_company_name() {
		return emp_company_name;
	}

	public void setEmp_company_name(String emp_company_name) {
		this.emp_company_name = emp_company_name;
	}

	public String getEmp_designation() {
		return emp_designation;
	}

	public void setEmp_designation(String emp_designation) {
		this.emp_designation = emp_designation;
	}

	public String getEmp_sal() {
		return emp_sal;
	}

	public void setEmp_sal(String emp_sal) {
		this.emp_sal = emp_sal;
	}

	public String getEmp_period() {
		return emp_period;
	}

	public void setEmp_period(String emp_period) {
		this.emp_period = emp_period;
	}

	public String getEmp_leavejob() {
		return emp_leavejob;
	}

	public void setEmp_leavejob(String emp_leavejob) {
		this.emp_leavejob = emp_leavejob;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

}
