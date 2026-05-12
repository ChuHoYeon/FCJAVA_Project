package com.fcjava.dto.football;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballStandingResponseDTO {
	
	private FootballFiltersDTO filters;
    private FootballAreaDTO area;
    private FootballCompetitionDTO competition;
    private FootballSeasonDTO season;
    private List<FootballStandingDTO> standings;

}
