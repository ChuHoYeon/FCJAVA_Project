package com.fcjava.dto.football;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballTableDTO {
	
	private Integer position;
    private FootballTeamDTO team;
    private Integer playedGames;
    private String form;
    private Integer won;
    private Integer draw;
    private Integer lost;
    private Integer points;
    private Integer goalsFor;
    private Integer goalsAgainst;
    private Integer goalDifference;

}
