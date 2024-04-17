package com.fcjava.dto;

import java.util.Date;

public class PlayerDTO {
	
	private int pl_num;
	private int t_num;
	private String id;
	private String pl_pic;
	private String back_num;
	private String pl_memo;
	private double height;
	private double weight;
	private Date pl_ap_date;
	
	public int getPl_num() {
		return pl_num;
	}
	public void setPl_num(int pl_num) {
		this.pl_num = pl_num;
	}
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPl_pic() {
		return pl_pic;
	}
	public void setPl_pic(String pl_pic) {
		this.pl_pic = pl_pic;
	}
	public String getBack_num() {
		return back_num;
	}
	public void setBack_num(String back_num) {
		this.back_num = back_num;
	}
	public String getPl_memo() {
		return pl_memo;
	}
	public void setPl_memo(String pl_memo) {
		this.pl_memo = pl_memo;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public Date getPl_ap_date() {
		return pl_ap_date;
	}
	public void setPl_ap_date(Date pl_ap_date) {
		this.pl_ap_date = pl_ap_date;
	}
}