package com.security.domain;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="lostitem_register")
public class LostItems {
	
	
	@Id
	@GeneratedValue
	@Column(name="sno")
	private int sno;
	
	@Column(name="date")
	private String date;
	
	@Column(name="address")
	private String name_address;
	
	@Column(name="contact_no")
	private String contact_no;
	
	@Column(name="date_timeoflost")
	private String date_timeoflost;
	
	@Column(name="reporting_date_time")
	private String reporting_date_time;
	
	@Column(name="itemslost")
	private String itemslost;
	
	@Column(name="placeoflost")
	private String placeoflost;
	
	@Column(name="approx_value")
	private String approx_value;
	
	@Column(name="receipt_no")
	private String receipt_no;
	
	@Column(name="remarks")
	private String remarks;

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getName_address() {
		return name_address;
	}

	public void setName_address(String name_address) {
		this.name_address = name_address;
	}

	
	

	public String getContact_no() {
		return contact_no;
	}

	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}

	public String getDate_timeoflost() {
		return date_timeoflost;
	}

	public void setDate_timeoflost(String date_timeoflost) {
		this.date_timeoflost = date_timeoflost;
	}

	public String getReporting_date_time() {
		return reporting_date_time;
	}

	public void setReporting_date_time(String reporting_date_time) {
		this.reporting_date_time = reporting_date_time;
	}

	public String getItemslost() {
		return itemslost;
	}

	public void setItemslost(String itemslost) {
		this.itemslost = itemslost;
	}

	public String getPlaceoflost() {
		return placeoflost;
	}

	public void setPlaceoflost(String placeoflost) {
		this.placeoflost = placeoflost;
	}

	public String getApprox_value() {
		return approx_value;
	}

	public void setApprox_value(String approx_value) {
		this.approx_value = approx_value;
	}

	public String getReceipt_no() {
		return receipt_no;
	}

	public void setReceipt_no(String receipt_no) {
		this.receipt_no = receipt_no;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	
	
	
	
	
	
	

}
