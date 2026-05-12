package com.fcjava.dto.football;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballStandingDTO {
	
	private String stage;
    private String type;
    private String group;
    private List<FootballTableDTO> table;

}
