package com.fcjava.dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameDTO {

	private int game_num;
	private String game_name;
	private int game_type;
	private String game_place;
	private String game_img;
	private String game_memo;
	private int game_apply;
	private LocalDateTime game_subst_date;
	private LocalDateTime game_subfn_date;
	private LocalDateTime game_st_date;
	private LocalDateTime game_fn_date;

}
