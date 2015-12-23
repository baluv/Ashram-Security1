package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="founditem_register")

public class FoundItems {
	
	@Id
	@GeneratedValue
	@Column(name="sno")
	private int sno;
	
	@Column(name="date_timeoffound")
	private String date_time_offound;
	
	@Column(name="place_of_found")
	private String place_of_found;
	
	@Column(name="details_found_items")
	private String details_found_items;
	
	@Column(name="approx_value")
	private String approx_value;
	
	@Column(name="name_whofounditem")
	private String name_whofounditem;
	
	@Column(name="contact_no")
	private String contact_no;
	
	@Column(name="signature_offound_person")
	private String signature_offound_person;
	
	@Column(name="receipt_no")
	private String receipt_no;
	
	@Column(name="items_received_by")
	private String items_received_by;
	
	@Column(name="action_taken")
	private String action_taken;

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getDate_time_offound() {
		return date_time_offound;
	}

	public void setDate_time_offound(String date_time_offound) {
		this.date_time_offound = date_time_offound;
	}

	public String getPlace_of_found() {
		return place_of_found;
	}

	public void setPlace_of_found(String place_of_found) {
		this.place_of_found = place_of_found;
	}

	public String getDetails_found_items() {
		return details_found_items;
	}

	public void setDetails_found_items(String details_found_items) {
		this.details_found_items = details_found_items;
	}

	public String getApprox_value() {
		return approx_value;
	}

	public void setApprox_value(String approx_value) {
		this.approx_value = approx_value;
	}

	public String getName_whofounditem() {
		return name_whofounditem;
	}

	public void setName_whofounditem(String name_whofounditem) {
		this.name_whofounditem = name_whofounditem;
	}

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getSignature_offound_person() {
		return signature_offound_person;
	}

	public void setSignature_offound_person(String signature_offound_person) {
		this.signature_offound_person = signature_offound_person;
	}

	public String getReceipt_no() {
		return receipt_no;
	}

	public void setReceipt_no(String receipt_no) {
		this.receipt_no = receipt_no;
	}

	public String getItems_received_by() {
		return items_received_by;
	}

	public void setItems_received_by(String items_received_by) {
		this.items_received_by = items_received_by;
	}

	public String getAction_taken() {
		return action_taken;
	}

	public void setAction_taken(String action_taken) {
		this.action_taken = action_taken;
	}
	
	
	

}
