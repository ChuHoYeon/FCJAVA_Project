package com.fcjava.dto;

import java.util.Date;

public class PlayerDTO {
	
	private int pl_num;
	private int t_num;
	private String id;
	private String pl_pic;
	private String back_num;
	private String position;
	private String pl_memo;
	private String height;
	private String weight;
	private Date pl_ap_date;
	private String b_day;
	private String gender;
	
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
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPl_memo() {
		return pl_memo;
	}
	public void setPl_memo(String pl_memo) {
		this.pl_memo = pl_memo;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public Date getPl_ap_date() {
		return pl_ap_date;
	}
	public void setPl_ap_date(Date pl_ap_date) {
		this.pl_ap_date = pl_ap_date;
	}
	public String getB_day() {
		return b_day;
	}
	public void setB_day(String b_day) {
		this.b_day = b_day;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
