package com.fcjava.dto;

public class TeamFormationDTO {
	private int formation_num;
    private int t_num;
    private String formation;
    private String formation_name;
    private int position_num;
    private String player_id;
    
	public int getFormation_num() {
		return formation_num;
	}
	public void setFormation_num(int formation_num) {
		this.formation_num = formation_num;
	}
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public String getFormation() {
		return formation;
	}
	public void setFormation(String formation) {
		this.formation = formation;
	}
	public String getFormation_name() {
		return formation_name;
	}
	public void setFormation_name(String formation_name) {
		this.formation_name = formation_name;
	}
	public int getPosition_num() {
		return position_num;
	}
	public void setPosition_num(int position_num) {
		this.position_num = position_num;
	}
	public String getPlayer_id() {
		return player_id;
	}
	public void setPlayer_id(String player_id) {
		this.player_id = player_id;
	}

}
