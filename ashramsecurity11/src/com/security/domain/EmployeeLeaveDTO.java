package com.security.domain;

public class EmployeeLeaveDTO {
private int emp_id;
private String empname;
private String dept;
private String fromdate;
private String todate;
private String leavetype;
private String number_duringleave;
public EmployeeLeaveDTO(int emp_id, String empname, String dept,
		String fromdate, String todate, String leavetype,
		String number_duringleave) {
	super();
	this.emp_id = emp_id;
	this.empname = empname;
	this.dept = dept;
	this.fromdate = fromdate;
	this.todate = todate;
	this.leavetype = leavetype;
	this.number_duringleave = number_duringleave;
}
public int getEmp_id() {
	return emp_id;
}
public void setEmp_id(int emp_id) {
	this.emp_id = emp_id;
}
public String getEmpname() {
	return empname;
}
public void setEmpname(String empname) {
	this.empname = empname;
}
public String getDept() {
	return dept;
}
public void setDept(String dept) {
	this.dept = dept;
}
public String getFromdate() {
	return fromdate;
}
public void setFromdate(String fromdate) {
	this.fromdate = fromdate;
}
public String getTodate() {
	return todate;
}
public void setTodate(String todate) {
	this.todate = todate;
}
public String getLeavetype() {
	return leavetype;
}
public void setLeavetype(String leavetype) {
	this.leavetype = leavetype;
}
public String getNumber_duringleave() {
	return number_duringleave;
}
public void setNumber_duringleave(String number_duringleave) {
	this.number_duringleave = number_duringleave;
}
	
	
}
