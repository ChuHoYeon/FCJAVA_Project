package com.fcjava.dto;

import java.util.Date;

public class TeamGameResultDTO {
	
	private String game_name;
	private int game_type;
	private Date game_date;
	private String game_place;
	private String team1_logo;
	private String team1_name;
	private int team1_score;
	private String team2_logo;
	private String team2_name;
	private int team2_score;
	
	public String getGame_name() {
		return game_name;
	}
	public void setGame_name(String game_name) {
		this.game_name = game_name;
	}
	public int getGame_type() {
		return game_type;
	}
	public void setGame_type(int game_type) {
		this.game_type = game_type;
	}
	public Date getGame_date() {
		return game_date;
	}
	public void setGame_date(Date game_date) {
		this.game_date = game_date;
	}
	public String getGame_place() {
		return game_place;
	}
	public void setGame_place(String game_place) {
		this.game_place = game_place;
	}
	public String getTeam1_logo() {
		return team1_logo;
	}
	public void setTeam1_logo(String team1_logo) {
		this.team1_logo = team1_logo;
	}
	public String getTeam1_name() {
		return team1_name;
	}
	public void setTeam1_name(String team1_name) {
		this.team1_name = team1_name;
	}
	public int getTeam1_score() {
		return team1_score;
	}
	public void setTeam1_score(int team1_score) {
		this.team1_score = team1_score;
	}
	public String getTeam2_logo() {
		return team2_logo;
	}
	public void setTeam2_logo(String team2_logo) {
		this.team2_logo = team2_logo;
	}
	public String getTeam2_name() {
		return team2_name;
	}
	public void setTeam2_name(String team2_name) {
		this.team2_name = team2_name;
	}
	public int getTeam2_score() {
		return team2_score;
	}
	public void setTeam2_score(int team2_score) {
		this.team2_score = team2_score;
	}
	
}
