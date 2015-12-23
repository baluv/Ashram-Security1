package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="salary")

public class Salary {
	
	@Id
	@GeneratedValue
	@Column(name="id")
	private int id;
	
	@Column(name="emp_id")
	private int emp_id;
	
	@Column(name="salary_month")
	private int salary_month;
	
	@Column(name="working_days")
	private int working_days;
	
	@Column(name="basic_salary")
	private double basic_salary;
	
	@Column(name="gross_salary")
	private double gross_salary;
	
	@Column(name="pf")
	private double pf;
	
	@Column(name="esi")
	private double esi;
	
	@Column(name="uniform")
	private int uniform;
	
	@Column(name="advance")
	private int advance;
	
	@Column(name="total_deduction")
	private double total_deduction;
	
	@Column(name="net_pay")
	private double net_pay;
	
	@Column(name="Entry_date")
	private String entry_date;
	
	@Column(name="entered_by")
	private String entered_by;
	
	@Column(name="security_type")
	private String security_type;

	public String getSecurity_type() {
		return security_type;
	}

	public void setSecurity_type(String security_type) {
		this.security_type = security_type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public int getSalary_month() {
		return salary_month;
	}

	public void setSalary_month(int salary_month) {
		this.salary_month = salary_month;
	}

	public int getWorking_days() {
		return working_days;
	}

	public void setWorking_days(int working_days) {
		this.working_days = working_days;
	}

	

	public double getBasic_salary() {
		return basic_salary;
	}

	public void setBasic_salary(double basic_salary) {
		this.basic_salary = basic_salary;
	}

	public double getGross_salary() {
		return gross_salary;
	}

	public void setGross_salary(double gross_salary) {
		this.gross_salary = gross_salary;
	}

	

	public double getPf() {
		return pf;
	}

	public void setPf(double pf) {
		this.pf = pf;
	}

	public double getEsi() {
		return esi;
	}

	public void setEsi(double esi) {
		this.esi = esi;
	}

	public int getUniform() {
		return uniform;
	}

	public void setUniform(int uniform) {
		this.uniform = uniform;
	}

	public int getAdvance() {
		return advance;
	}

	public void setAdvance(int advance) {
		this.advance = advance;
	}

	

	public double getTotal_deduction() {
		return total_deduction;
	}

	public void setTotal_deduction(double total_deduction) {
		this.total_deduction = total_deduction;
	}

	public double getNet_pay() {
		return net_pay;
	}

	public void setNet_pay(double net_pay) {
		this.net_pay = net_pay;
	}

	public String getEntry_date() {
		return entry_date;
	}

	public void setEntry_date(String entry_date) {
		this.entry_date = entry_date;
	}

	public String getEntered_by() {
		return entered_by;
	}

	public void setEntered_by(String entered_by) {
		this.entered_by = entered_by;
	}

	public int getEmp_id() {
		return emp_id;
	}

	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	

}
