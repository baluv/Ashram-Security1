package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="employee_language")
public class EmployeeLanguage {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="emp_id")
	private int empid;
	
	@Column(name="emp_lang_known")
	private String emp_lang_known;
	
	@Column(name="emp_lang_speak")
	private String emp_lang_speak;
	
	@Column(name="emp_lang_read")
	private String emp_lang_read;
	
	@Column(name="emp_lang_write")
	private String emp_lang_write;
	
	@Column(name="emp_lang_level")
	private String emp_lang_level;

	

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public String getEmp_lang_known() {
		return emp_lang_known;
	}

	public void setEmp_lang_known(String emp_lang_known) {
		this.emp_lang_known = emp_lang_known;
	}

	public String getEmp_lang_speak() {
		return emp_lang_speak;
	}

	public void setEmp_lang_speak(String emp_lang_speak) {
		this.emp_lang_speak = emp_lang_speak;
	}

	public String getEmp_lang_read() {
		return emp_lang_read;
	}

	public void setEmp_lang_read(String emp_lang_read) {
		this.emp_lang_read = emp_lang_read;
	}

	public String getEmp_lang_write() {
		return emp_lang_write;
	}

	public void setEmp_lang_write(String emp_lang_write) {
		this.emp_lang_write = emp_lang_write;
	}

	public String getEmp_lang_level() {
		return emp_lang_level;
	}

	public void setEmp_lang_level(String emp_lang_level) {
		this.emp_lang_level = emp_lang_level;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	

}
