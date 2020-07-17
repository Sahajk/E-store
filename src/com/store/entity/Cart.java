package com.store.entity;

public class Cart {
 private int s_no;
 private int pid;
 private String sid;
 private int qty;
 private String uid;
 private String pname;
 private int pmrp;
 private String pimage;


public String getPimage() {
	return pimage;
}



public void setPimage(String pimage) {
	this.pimage = pimage;
}



public Cart(int s_no, int qty) {
	super();
	this.s_no = s_no;
	this.qty = qty;
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



public Cart(int pid, String sid, int qty, String uid) {
	super();
	this.pid = pid;
	this.sid = sid;
	this.qty = qty;
	this.uid = uid;
}



public String getUid() {
	return uid;
}



public void setUid(String uid) {
	this.uid = uid;
}



public int getPid() {
	return pid;
}



public void setPid(int pid) {
	this.pid = pid;
}



public Cart(int pid, String sid, int qty) {
	super();
	this.pid = pid;
	this.sid = sid;
	this.qty = qty;
}



public Cart(int s_no, int pid, String sid, int qty) {
	super();
	this.s_no = s_no;
	this.pid = pid;
	this.sid = sid;
	this.qty = qty;
}



public String getSid() {
	return sid;
}

public void setSid(String sid) {
	this.sid = sid;
}

public int getQty() {
	return qty;
}

public void setQty(int qty) {
	this.qty = qty;
}

public int getS_no() {
	return s_no;
}

public Cart() {
	super();
}

public void setS_no(int s_no) {
	this.s_no = s_no;
}

public Cart(int s_no) {
	super();
	this.s_no = s_no;
}
}
