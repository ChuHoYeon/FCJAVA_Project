package com.fcjava.dto.football;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballTeamDTO {
	
	private Integer id;
    private String name;
    private String shortName;
    private String tla;
    private String crest;

}
