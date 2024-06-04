package com.fcjava.dto;

import java.util.Date;

public class TeamScheduleDTO {
	
	private Date reserdate;
	private String resertime;
	private String groundname;
	private String groundaddr;
	private Date receiptdate;
	private int vs_team;
	private Integer vs_team_num;
	private String vs_team_logo;
	private String vs_team_name;
	
	public Date getReserdate() {
		return reserdate;
	}
	public void setReserdate(Date reserdate) {
		this.reserdate = reserdate;
	}
	public String getResertime() {
		return resertime;
	}
	public void setResertime(String resertime) {
		this.resertime = resertime;
	}
	public String getGroundname() {
		return groundname;
	}
	public void setGroundname(String groundname) {
		this.groundname = groundname;
	}
	public String getGroundaddr() {
		return groundaddr;
	}
	public void setGroundaddr(String groundaddr) {
		this.groundaddr = groundaddr;
	}
	public Date getReceiptdate() {
		return receiptdate;
	}
	public void setReceiptdate(Date receiptdate) {
		this.receiptdate = receiptdate;
	}
	public int getVs_team() {
		return vs_team;
	}
	public void setVs_team(int vs_team) {
		this.vs_team = vs_team;
	}
	public Integer getVs_team_num() {
		return vs_team_num;
	}
	public void setVs_team_num(Integer vs_team_num) {
		this.vs_team_num = vs_team_num;
	}
	public String getVs_team_logo() {
		return vs_team_logo;
	}
	public void setVs_team_logo(String vs_team_logo) {
		this.vs_team_logo = vs_team_logo;
	}
	public String getVs_team_name() {
		return vs_team_name;
	}
	public void setVs_team_name(String vs_team_name) {
		this.vs_team_name = vs_team_name;
	}

}
