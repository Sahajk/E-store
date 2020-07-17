package com.store.entity;

public class Seller {
	private int s_no;
	private String sid;
	private String sname;
	private String saddress;
	private String scity;
	private String spass;
	private String sellerImage;
	
	public Seller(String sid, String sname, String saddress, String scity, String spass, String sellerImage) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.saddress = saddress;
		this.scity = scity;
		this.spass = spass;
		this.sellerImage = sellerImage;
	}
	public Seller(int s_no, String sid, String sname, String saddress, String scity, String spass, String sellerImage) {
		super();
		this.s_no = s_no;
		this.sid = sid;
		this.sname = sname;
		this.saddress = saddress;
		this.scity = scity;
		this.spass = spass;
		this.sellerImage = sellerImage;
	}
	public Seller(String sellerImage) {
		super();
		this.sellerImage =sellerImage;
	}
	public String getSellerImage() {
		return sellerImage;
	}
	public void setSellerImage(String sellerImage) {
		this.sellerImage = sellerImage;
	}
	public Seller(int s_no, String sid, String sname, String saddress, String scity) {
		super();
		this.s_no = s_no;
		this.sid = sid;
		this.sname = sname;
		this.saddress = saddress;
		this.scity = scity;
	}
	public Seller(String sid, String spass) {
		super();
		this.sid = sid;
		this.spass = spass;
	}
	public Seller(String sid, String sname, String saddress, String scity, String spass) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.saddress = saddress;
		this.scity = scity;
		this.spass = spass;
	}
	public Seller(int s_no, String sid, String sname, String saddress, String scity, String spass) {
		super();
		this.s_no = s_no;
		this.sid = sid;
		this.sname = sname;
		this.saddress = saddress;
		this.scity = scity;
		this.spass = spass;
	}
	public Seller() {
		// TODO Auto-generated constructor stub
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}
	public String getScity() {
		return scity;
	}
	public void setScity(String scity) {
		this.scity = scity;
	}
	public String getSpass() {
		return spass;
	}
	public void setSpass(String spass) {
		this.spass = spass;
	}
}
