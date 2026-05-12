package com.fcjava.dto.football;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballSeasonDTO {
	
	private Integer id;
    private String startDate;
    private String endDate;
    private Integer currentMatchday;
    private Object winner;

}
