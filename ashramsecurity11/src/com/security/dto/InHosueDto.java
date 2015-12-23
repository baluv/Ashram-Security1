package com.security.dto;

public class InHosueDto {
	
	
	Integer id;
	Integer emp_id;
	String empname;
	String inhouse_securitypost;
	String inhouse_shift;
	String inhouse_rank;
	String inhouse_date;
	
	public InHosueDto(Integer id, Integer emp_id, String empname, String inhouse_securitypost, String inhouse_shift, String inhouse_rank, String inhouse_date){
		
		super();
	
	this.id = id;
	this.emp_id = emp_id;
	this.empname = empname; 
	this.inhouse_securitypost = inhouse_securitypost;
	this.inhouse_shift = inhouse_shift;
	this.inhouse_rank = inhouse_rank;
	this.inhouse_date = inhouse_date;
	

	}

	public String getInhouse_date() {
		return inhouse_date;
	}

	public void setInhouse_date(String inhouse_date) {
		this.inhouse_date = inhouse_date;
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

	public String getInhouse_securitypost() {
		return inhouse_securitypost;
	}

	public void setInhouse_securitypost(String inhouse_securitypost) {
		this.inhouse_securitypost = inhouse_securitypost;
	}

	public String getInhouse_shift() {
		return inhouse_shift;
	}

	public void setInhouse_shift(String inhouse_shift) {
		this.inhouse_shift = inhouse_shift;
	}

	public String getInhouse_rank() {
		return inhouse_rank;
	}

	public void setInhouse_rank(String inhouse_rank) {
		this.inhouse_rank = inhouse_rank;
	}
}
