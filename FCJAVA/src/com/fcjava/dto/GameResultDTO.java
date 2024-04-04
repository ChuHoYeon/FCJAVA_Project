package com.fcjava.dto;

public class GameResultDTO {
	
	private int game_num;
	private int game_type;
	private int team1_num;
	private int team1_score;
	private int team2_num;
	private int team2_score;
	private String game_date;
	
	public int getGame_num() {
		return game_num;
	}
	public void setGame_num(int game_num) {
		this.game_num = game_num;
	}
	public int getGame_type() {
		return game_type;
	}
	public void setGame_type(int game_type) {
		this.game_type = game_type;
	}
	public int getTeam1_num() {
		return team1_num;
	}
	public void setTeam1_num(int team1_num) {
		this.team1_num = team1_num;
	}
	public int getTeam1_score() {
		return team1_score;
	}
	public void setTeam1_score(int team1_score) {
		this.team1_score = team1_score;
	}
	public int getTeam2_num() {
		return team2_num;
	}
	public void setTeam2_num(int team2_num) {
		this.team2_num = team2_num;
	}
	public int getTeam2_score() {
		return team2_score;
	}
	public void setTeam2_score(int team2_score) {
		this.team2_score = team2_score;
	}
	public String getGame_date() {
		return game_date;
	}
	public void setGame_date(String game_date) {
		this.game_date = game_date;
	}

}
