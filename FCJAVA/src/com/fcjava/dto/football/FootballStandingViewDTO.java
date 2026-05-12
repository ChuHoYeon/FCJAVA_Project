package com.fcjava.dto.football;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballStandingViewDTO {
	
	private Integer position;
    private String teamName;
    private String teamCrest;

    private Integer playedGames;
    private Integer won;
    private Integer draw;
    private Integer lost;
    private Integer goalsFor;
    private Integer goalsAgainst;
    private Integer points;

}
