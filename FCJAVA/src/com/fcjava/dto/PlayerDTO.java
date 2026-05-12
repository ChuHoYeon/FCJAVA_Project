package com.fcjava.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	
}
