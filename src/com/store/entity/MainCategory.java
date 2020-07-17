package com.store.entity;

import java.util.ArrayList;

public class MainCategory {
private int s_no;
private String c_name;


ArrayList<Subcategory> subList;
public MainCategory(String c_name) {
	super();
	this.c_name = c_name;
}
public MainCategory(int s_no, String c_name) {
	super();
	this.s_no = s_no;
	this.c_name = c_name;
}

public MainCategory(int s_no, String c_name, ArrayList<Subcategory> subList) {
	super();
	this.s_no = s_no;
	this.c_name = c_name;
	this.subList = subList;
}
public int getS_no() {
	return s_no;
}
public void setS_no(int s_no) {
	this.s_no = s_no;
}
public String getC_name() {
	return c_name;
}
public void setC_name(String c_name) {
	this.c_name = c_name;
}
}
