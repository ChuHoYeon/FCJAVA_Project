package com.fcjava.dto.football;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballApiResponseLogDTO {

    private Long logId;

    private LocalDate snapshotDate;

    private String apiName;
    private String requestUrl;

    private String leagueCode;
    private String seasonYear;

    private String responseJson;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}