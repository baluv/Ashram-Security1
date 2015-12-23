package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="g4s_security")

public class G4SSecurity {
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="g4s_securitypost")
	private String g4s_securitypost;
	
	@Column(name="emp_id")
	private int emp_id;
	
	@Column(name="g4s_shift")
	private String g4s_shift;
	
	@Column(name="g4s_rank")
	private String g4s_rank;
	
	@Column(name="g4s_date")
	private String g4s_date;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getG4s_securitypost() {
		return g4s_securitypost;
	}

	public void setG4s_securitypost(String g4s_securitypost) {
		this.g4s_securitypost = g4s_securitypost;
	}



	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
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
