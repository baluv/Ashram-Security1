package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vehicle_passes")

public class PassRegister {
	
	@Id
	 @GeneratedValue
	 @Column(name="id")
	 private int id;
	
	@Column (name="expire_date")
	private String expire_date;
	
	@Column (name="type_of_wheeler")
	private String type_of_wheeler;
	
	@Column (name="type_of_passes")
	private String type_of_passes;
	
	
	@Column (name="pass_no")
	private String pass_no;
	
	@Column (name="old_pass_no")
	private String old_pass_no;
	
	@Column (name="name") 
	private String name;
	
	@Column (name="department")
	private String department;
	
	@Column (name="address")
	private String address;
	
	@Column (name="mobile_no")
	private String mobile_no;
	
	@Column (name="email_id")
	private String email_id;
	
	@Column (name="vehicle_registration_no")
	private String vehicle_registration_no;
	
	@Column (name="model_colorl")
	private String model_color;
	
	@Column (name="signature")
	private String signature;
	
	@Column (name="renewal_pass_no")
	private String renewal_pass_no;
	
	@Column (name="date")
	private String date;
	
	@Column (name="remarks")
	private String remarks;
	

	

	public String getMobile_no() {
		return mobile_no;
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPass_no() {
		return pass_no;
	}

	public void setPass_no(String pass_no) {
		this.pass_no = pass_no;
	}

	public String getOld_pass_no() {
		return old_pass_no;
	}

	public void setOld_pass_no(String old_pass_no) {
		this.old_pass_no = old_pass_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getVehicle_registration_no() {
		return vehicle_registration_no;
	}

	public void setVehicle_registration_no(String vehicle_registration_no) {
		this.vehicle_registration_no = vehicle_registration_no;
	}

	

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getRenewal_pass_no() {
		return renewal_pass_no;
	}

	public void setRenewal_pass_no(String renewal_pass_no) {
		this.renewal_pass_no = renewal_pass_no;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getType_of_wheeler() {
		return type_of_wheeler;
	}

	public void setType_of_wheeler(String type_of_wheeler) {
		this.type_of_wheeler = type_of_wheeler;
	}

	public String getType_of_passes() {
		return type_of_passes;
	}

	public void setType_of_passes(String type_of_passes) {
		this.type_of_passes = type_of_passes;
	}

	public String getModel_color() {
		return model_color;
	}

	public void setModel_color(String model_color) {
		this.model_color = model_color;
	}

	public String getExpire_date() {
		return expire_date;
	}

	public void setExpire_date(String expire_date) {
		this.expire_date = expire_date;
	}
	
	
	

}
