package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employee_extracurricular")

public class EmployeeActivities {
	
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="emp_id")
	private int empid;
	
	
	
	@Column(name="emp_activitytype")
	private String activitytype;
	
	@Column(name="emp_atschool")
	private String emp_atschool;
	
	@Column(name="emp_atcollege")
	private String emp_atcollege;
	
	@Column(name="emp_later")
	private String emp_later;

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

	public String getActivitytype() {
		return activitytype;
	}

	public void setActivitytype(String activitytype) {
		this.activitytype = activitytype;
	}

	public String getEmp_atschool() {
		return emp_atschool;
	}

	public void setEmp_atschool(String emp_atschool) {
		this.emp_atschool = emp_atschool;
	}

	public String getEmp_atcollege() {
		return emp_atcollege;
	}

	public void setEmp_atcollege(String emp_atcollege) {
		this.emp_atcollege = emp_atcollege;
	}

	public String getEmp_later() {
		return emp_later;
	}

	public void setEmp_later(String emp_later) {
		this.emp_later = emp_later;
	}
	

}
