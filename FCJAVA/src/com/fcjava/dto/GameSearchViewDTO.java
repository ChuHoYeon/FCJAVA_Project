package com.fcjava.dto;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class GameSearchViewDTO {

	private int num;
	private String name;
	private int type;
	private String place;
	private String img;
	private String memo;
	private int game_apply;
	private LocalDateTime subst_date;
	private LocalDateTime subfn_date;
	private LocalDateTime st_date;
	private LocalDateTime fn_date;

	public GameSearchViewDTO(GameDTO game) {
		this.num = game.getGame_num();
		this.name = game.getGame_name();
		this.type = game.getGame_type();
		this.place = game.getGame_place();
		this.img = game.getGame_img();
		this.memo = game.getGame_memo();
		this.subst_date = game.getGame_subst_date();
		this.subfn_date = game.getGame_subfn_date();
		this.st_date = game.getGame_st_date();
		this.fn_date = game.getGame_fn_date();
		this.game_apply = game.getGame_apply();
	}
}
