package com.store.entity;


public class Subcategory {
private int s_no;
private int mc_id;
private String sc_name;
public Subcategory(String sc_name) {
	super();
	this.sc_name = sc_name;
}
public Subcategory(int mc_id, String sc_name) {
	super();
	this.mc_id = mc_id;
	this.sc_name = sc_name;
}
public Subcategory(int s_no, int mc_id, String sc_name) {
	super();
	this.s_no = s_no;
	this.mc_id = mc_id;
	this.sc_name = sc_name;
}
public int getS_no() {
	return s_no;
}
public void setS_no(int s_no) {
	this.s_no = s_no;
}
public int getMc_id() {
	return mc_id;
}
public void setMc_id(int mc_id) {
	this.mc_id = mc_id;
}
public String getSc_name() {
	return sc_name;
}
public void setSc_name(String sc_name) {
	this.sc_name = sc_name;
}
}
