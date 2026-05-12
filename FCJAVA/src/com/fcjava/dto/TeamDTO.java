package com.fcjava.dto;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class TeamDTO {
	
	private int t_num;
	private String id;
	private String t_name;
	private String t_logo;
	private String hom_city;
	private String week_time;
	private String t_info;
	private Date t_c_day;
	private int max_p_num;
	private String t_skill;
	private String t_sns;
	private String t_age;
	
}
