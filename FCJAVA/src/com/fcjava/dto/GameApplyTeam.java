package com.fcjava.dto;

public class GameApplyTeam {
	
	private int game_num;
	private int t_num;
	private String t_name;
	private String t_logo;
	private String game_apply_date;
	
	public int getGame_num() {
		return game_num;
	}
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_logo() {
		return t_logo;
	}
	public void setT_logo(String t_logo) {
		this.t_logo = t_logo;
	}
	public String getGame_apply_date() {
		return game_apply_date;
	}
	public void setGame_apply_date(String game_apply_date) {
		this.game_apply_date = game_apply_date;
	}
	
}
