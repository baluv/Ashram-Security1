package com.security.dto;

public class AgencyDto {
	
	Integer id;
	Integer emp_id;
	String empname;
	String g4s_securitypost;
	String g4s_shift;
	String g4s_rank;
	String g4s_date;
	
	public AgencyDto(Integer id, Integer emp_id, String empname, String g4s_securitypost, String g4s_shift, String g4s_rank, String g4s_date){
	
		super();
	
	this.id = id;
	this.emp_id = emp_id;
	this.empname = empname; 
	this.g4s_securitypost = g4s_securitypost;
	this.g4s_shift = g4s_shift;
	this.g4s_rank = g4s_rank;
	this.g4s_date = g4s_date;
			
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(Integer emp_id) {
		this.emp_id = emp_id;
	}

	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getG4s_securitypost() {
		return g4s_securitypost;
	}

	public void setG4s_securitypost(String g4s_securitypost) {
		this.g4s_securitypost = g4s_securitypost;
	}

	public String getG4s_shift() {
		return g4s_shift;
	}

	public void setG4s_shift(String g4s_shift) {
		this.g4s_shift = g4s_shift;
	}

	public String getG4s_rank() {
		return g4s_rank;
	}

	public void setG4s_rank(String g4s_rank) {
		this.g4s_rank = g4s_rank;
	}

	public String getG4s_date() {
		return g4s_date;
	}

	public void setG4s_date(String g4s_date) {
		this.g4s_date = g4s_date;
	}
	
	
	
}
