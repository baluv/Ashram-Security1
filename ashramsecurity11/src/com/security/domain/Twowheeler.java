package com.security.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="twowheeler")

public class Twowheeler {
 @Id
 @GeneratedValue
 @Column(name="id")
 private Integer id;
 
 @Column(name="vehicle_type")
 private String vehicletype;
 
 @Column(name="from_sno")
 private String fromsno;
 
 @Column(name="date")
 private String date;
 
 
 @Column(name="to_sno")
 private String tosno;
 
 @Column(name="quantity")
 private String quantity;
 
 @Column(name="amount")
 private String amount;
 
 
 @Column(name="machine")
 private String machine;
 

 public String getMachine() {
  return machine;
 }

 public void setMachine(String machine) {
  this.machine = machine;
 }

 public Integer getId() {
  return id;
 }

 public void setId(Integer id) {
  this.id = id;
 }

 public String getFromsno() {
  return fromsno;
 }

 public void setFromsno(String fromsno) {
  this.fromsno = fromsno;
 }

 public String getDate() {
  return date;
 }

 public void setDate(String date) {
  this.date = date;
 }

 public String getTosno() {
  return tosno;
 }

 public void setTosno(String tosno) {
  this.tosno = tosno;
 }

 public String getQuantity() {
  return quantity;
 }

 public void setQuantity(String quantity) {
  this.quantity = quantity;
 }

 public String getAmount() {
  return amount;
 }

 public void setAmount(String amount) {
  this.amount = amount;
 }

 public String getVehicletype() {
  return vehicletype;
 }

 public void setVehicletype(String vehicletype) {
  this.vehicletype = vehicletype;
 }
}