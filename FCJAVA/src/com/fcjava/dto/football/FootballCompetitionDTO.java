package com.fcjava.dto.football;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballCompetitionDTO {
	
	private Integer id;
    private String name;
    private String code;
    private String type;
    private String emblem;

}
