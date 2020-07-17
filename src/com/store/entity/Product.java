package com.store.entity;

public class Product {
	private int s_no;
	private String p_name;
	private String p_des;
	private int p_mrp;
	private int sc_id;
	private String p_type;
	private String p_image;
	private String s_id;
	private int mc_id;
	int qty;
	
	public int getMc_id() {
		return mc_id;
	}
	public void setMc_id(int mc_id) {
		this.mc_id = mc_id;
	}
	public Product(String p_name, String p_des, int p_mrp, int sc_id, String p_type, String p_image, String s_id,int mc_id) {
		super();
		this.p_name = p_name;
		this.p_des = p_des;
		this.p_mrp = p_mrp;
		this.sc_id = sc_id;
		this.p_type = p_type;
		this.p_image = p_image;
		this.s_id = s_id;
		this.mc_id = mc_id;
	}
	public Product(int s_no, String p_name, String p_des, int p_mrp, int sc_id, String p_type, String p_image,
			String s_id ,int mc_id) {
		super();
		this.s_no = s_no;
		this.p_name = p_name;
		this.p_des = p_des;
		this.p_mrp = p_mrp;
		this.sc_id = sc_id;
		this.p_type = p_type;
		this.p_image = p_image;
		this.s_id = s_id;
		this.mc_id = mc_id;
	}
	public Product(int s_no, String p_name, String p_des, int p_mrp, String p_type) {
		super();
		this.s_no = s_no;
		this.p_name = p_name;
		this.p_des = p_des;
		this.p_mrp = p_mrp;
		this.p_type = p_type;
	}
	public Product(String p_image) {
		super();
		this.p_image = p_image;
	}
	public Product() {
		// TODO Auto-generated constructor stub
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_des() {
		return p_des;
	}
	public void setP_des(String p_des) {
		this.p_des = p_des;
	}
	public int getP_mrp() {
		return p_mrp;
	}
	public void setP_mrp(int p_mrp) {
		this.p_mrp = p_mrp;
	}
	public int getSc_id() {
		return sc_id;
	}
	public void setSc_id(int sc_id) {
		this.sc_id = sc_id;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	
	
}
