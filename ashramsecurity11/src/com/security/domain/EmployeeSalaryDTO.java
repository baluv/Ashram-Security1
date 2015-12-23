package com.security.domain;

public class EmployeeSalaryDTO {
	
	private int empid;
	private String empname;
	private String emp_designation;
	private int working_days;
	private double basic_salary;
	private double gross_salary;
	private double pf;
	private double esi;
	private int uniform;
	private int advance;
	private double total_deduction;
	private double net_pay;
	private String entered_by;
	public EmployeeSalaryDTO(int empid, String empname, String emp_designation,
			int working_days, double basic_salary, double gross_salary,
			double pf, double esi, int uniform, int advance,
			double total_deduction, double net_pay, String entered_by) {
		super();
		this.empid = empid;
		this.empname = empname;
		this.emp_designation = emp_designation;
		this.working_days = working_days;
		this.basic_salary = basic_salary;
		this.gross_salary = gross_salary;
		this.pf = pf;
		this.esi = esi;
		this.uniform = uniform;
		this.advance = advance;
		this.total_deduction = total_deduction;
		this.net_pay = net_pay;
		this.entered_by = entered_by;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public String getEmp_designation() {
		return emp_designation;
	}
	public void setEmp_designation(String emp_designation) {
		this.emp_designation = emp_designation;
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
	public String getEntered_by() {
		return entered_by;
	}
	public void setEntered_by(String entered_by) {
		this.entered_by = entered_by;
	}
	}