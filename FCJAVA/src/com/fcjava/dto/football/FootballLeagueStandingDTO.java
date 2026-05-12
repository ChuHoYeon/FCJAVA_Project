package com.fcjava.dto.football;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FootballLeagueStandingDTO {

    private Long standingId;

    private LocalDate snapshotDate;

    private Integer seasonId;
    private String seasonYear;
    private LocalDate seasonStartDate;
    private LocalDate seasonEndDate;
    private Integer currentMatchday;

    private Integer areaId;
    private String areaName;
    private String areaCode;
    private String areaFlag;

    private Integer competitionId;
    private String competitionName;
    private String leagueCode;
    private String competitionType;
    private String competitionEmblem;

    private String stage;
    private String standingType;
    private String standingGroup;

    private Integer teamId;
    private String teamName;
    private String teamShortName;
    private String teamTla;
    private String teamCrest;

    private Integer position;
    private Integer playedGames;
    private Integer won;
    private Integer draw;
    private Integer lost;
    private Integer points;
    private Integer goalsFor;
    private Integer goalsAgainst;
    private Integer goalDifference;

    private String form;

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}
