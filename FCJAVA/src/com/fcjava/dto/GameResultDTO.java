package com.fcjava.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameResultDTO {
	
	private int game_num;
	private int game_type;
	private int team1_num;
	private int team1_score;
	private int team2_num;
	private int team2_score;
	private String game_date;
	
}
