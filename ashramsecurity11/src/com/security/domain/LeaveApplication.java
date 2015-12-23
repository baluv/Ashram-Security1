package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="LeaveApplication")

public class LeaveApplication {

 @Id
 @GeneratedValue
 @Column(name="id")
 private int id;
 
 @Column(name="emp_id")
 private String empid;
 
 
 @Column(name="emp_department")
 private String dept;
 
 @Column(name="emp_position")
 private String position;
 
 @Column(name="leave_fromdate")
 private String fromdate;
 
 @Column(name="leave_todate")
 private String todate;
 
 @Column(name="leave_type")
 private String leavetype;
 
 @Column(name="leave_reason")
 private String reason;
 
 @Column(name="address_duringleave")
 private String address_duringleave;
 
 @Column(name="number_duringleave")
 private String number_duringleave;
 
 @Column(name="lastleave_fromdate")
 private String last_fromdate;
 
 @Column(name="lastleave_todate")
 private String last_todate;
 
 @Column(name="ticket_givenbyAshram")
 private String ticket;
 
 @Column(name="department_head")
 private String dept_head;
 
 @Column(name="reason_refusal")
 private String reason_refusal;
 
 @Column(name="human_resources")
 private String resources;

 public int getId() {
  return id;
 }

 public void setId(int id) {
  this.id = id;
 }

 public String getEmpid() {
  return empid;
 }

 public void setEmpid(String empid) {
  this.empid = empid;
 }

 

 public String getDept() {
  return dept;
 }

 public void setDept(String dept) {
  this.dept = dept;
 }

 public String getPosition() {
  return position;
 }

 public void setPosition(String position) {
  this.position = position;
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

 public String getReason() {
  return reason;
 }

 public void setReason(String reason) {
  this.reason = reason;
 }

 public String getAddress_duringleave() {
  return address_duringleave;
 }

 public void setAddress_duringleave(String address_duringleave) {
  this.address_duringleave = address_duringleave;
 }

 public String getNumber_duringleave() {
  return number_duringleave;
 }

 public void setNumber_duringleave(String number_duringleave) {
  this.number_duringleave = number_duringleave;
 }

 public String getLast_fromdate() {
  return last_fromdate;
 }

 public void setLast_fromdate(String last_fromdate) {
  this.last_fromdate = last_fromdate;
 }

 public String getLast_todate() {
  return last_todate;
 }

 public void setLast_todate(String last_todate) {
  this.last_todate = last_todate;
 }

 public String getTicket() {
  return ticket;
 }

 public void setTicket(String ticket) {
  this.ticket = ticket;
 }

 public String getDept_head() {
  return dept_head;
 }

 public void setDept_head(String dept_head) {
  this.dept_head = dept_head;
 }

 public String getReason_refusal() {
  return reason_refusal;
 }

 public void setReason_refusal(String reason_refusal) {
  this.reason_refusal = reason_refusal;
 }

 public String getResources() {
  return resources;
 }

 public void setResources(String resources) {
  this.resources = resources;
 }
 
 
}