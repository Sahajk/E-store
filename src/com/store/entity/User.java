package com.store.entity;

public class User {
private int s_no;
private String uid;
private String name;
private String address;
private String city;
private String pincode;
private String pass;
private String uimage;

public User(int s_no, String uid, String name, String address, String city, String pincode, String pass,
		String uimage) {
	super();
	this.s_no = s_no;
	this.uid = uid;
	this.name = name;
	this.address = address;
	this.city = city;
	this.pincode = pincode;
	this.pass = pass;
	this.uimage = uimage;
}
public String getUimage() {
	return uimage;
}
public void setUimage(String uimage) {
	this.uimage = uimage;
}
public User(String uimage) {
	super();
	this.uimage = uimage;
}
public User(String uid, String pass) {
	super();
	this.uid = uid;
	this.pass = pass;
}
public User(String uid, String name, String address, String city, String pincode, String pass) {
	super();
	this.uid = uid;
	this.name = name;
	this.address = address;
	this.city = city;
	this.pincode = pincode;
	this.pass = pass;
}
public User(int s_no, String uid, String name, String address, String city, String pincode, String pass) {
	super();
	this.s_no = s_no;
	this.uid = uid;
	this.name = name;
	this.address = address;
	this.city = city;
	this.pincode = pincode;
	this.pass = pass;
}
public User() {
	// TODO Auto-generated constructor stub
}
public int getS_no() {
	return s_no;
}
public void setS_no(int s_no) {
	this.s_no = s_no;
}
public String getUid() {
	return uid;
}
public void setUid(String uid) {
	this.uid = uid;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getPincode() {
	return pincode;
}
public void setPincode(String pincode) {
	this.pincode = pincode;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
}
