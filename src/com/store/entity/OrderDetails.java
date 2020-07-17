package com.store.entity;

public class OrderDetails {
private int sno;
private String username;
private String address;
private String contact;
private String paymode;
private int pid;
private int qty;
private String uid;
private String sid;
private String pname;
private int pmrp;
private String pimage;


public OrderDetails() {

}
public OrderDetails(String username, String address, String contact, String paymode) {
	super();
	this.username = username;
	this.address = address;
	this.contact = contact;
	this.paymode = paymode;
}
public OrderDetails(String username, String address, String contact, String paymode, String uid, String sellerId) {
	super();
	this.username = username;
	this.address = address;
	this.contact = contact;
	this.paymode = paymode;
	this.uid = uid;
	this.sid = sellerId;
}
public int getSno() {
	return sno;
}
public void setSno(int sno) {
	this.sno = sno;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getPaymode() {
	return paymode;
}
public void setPaymode(String paymode) {
	this.paymode = paymode;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}
public String getUid() {
	return uid;
}
public void setUid(String uid) {
	this.uid = uid;
}
public String getSid() {
	return sid;
}
public void setSid(String sid) {
	this.sid = sid;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public int getPmrp() {
	return pmrp;
}
public void setPmrp(int pmrp) {
	this.pmrp = pmrp;
}
public String getPimage() {
	return pimage;
}
public void setPimage(String pimage) {
	this.pimage = pimage;
}

}