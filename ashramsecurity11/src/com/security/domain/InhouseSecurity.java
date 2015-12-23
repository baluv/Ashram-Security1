package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="inhouse_security")
public class InhouseSecurity {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="inhouse_securitypost")
	private String inhouse_securitypost;
	
	@Column(name="emp_id")
	private int emp_id;
	
	@Column(name="inhouse_shift")
	private String inhouse_shift;
	
	@Column(name="inhouse_rank")
	private String inhouse_rank;
	
	@Column(name="inhouse_date")
	private String inhouse_date;
	
	



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getInhouse_securitypost() {
		return inhouse_securitypost;
	}

	public void setInhouse_securitypost(String inhouse_securitypost) {
		this.inhouse_securitypost = inhouse_securitypost;
	}

	

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
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

	public String getInhouse_date() {
		return inhouse_date;
	}

	public void setInhouse_date(String inhouse_date) {
		this.inhouse_date = inhouse_date;
	}
}
