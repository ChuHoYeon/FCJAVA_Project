package com.fcjava.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fcjava.dao.FootballDataDAO;
import com.fcjava.dto.football.FootballApiResponseLogDTO;
import com.fcjava.dto.football.FootballAreaDTO;
import com.fcjava.dto.football.FootballCompetitionDTO;
import com.fcjava.dto.football.FootballLeagueStandingDTO;
import com.fcjava.dto.football.FootballSeasonDTO;
import com.fcjava.dto.football.FootballStandingDTO;
import com.fcjava.dto.football.FootballStandingResponseDTO;
import com.fcjava.dto.football.FootballStandingViewDTO;
import com.fcjava.dto.football.FootballTableDTO;
import com.google.gson.Gson;

public class FootballDataService {
	
	private static final FootballDataService instance = new FootballDataService();

    private FootballDataDAO footballDataDAO = FootballDataDAO.getInstance();

    private static final String API_NAME = "FOOTBALL_DATA_STANDINGS";
    private static final String API_KEY = "08c6346796f3425192dcf8961f2aa2e7";
    private static final String API_BASE_URL = "http://api.football-data.org/v4/competitions/";

    private FootballDataService() {
    }

    public static FootballDataService getInstance() {
        return instance;
    }

    public List<FootballStandingViewDTO> getStandingList(String league) throws Exception {
        league = validateLeague(league);

        String seasonYear = String.valueOf(LocalDate.now().getYear());

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("leagueCode", league);
        paramMap.put("seasonYear", seasonYear);

        int count = footballDataDAO.countTodayStanding(paramMap);

        if (count == 0) {
            String apiUrl = API_BASE_URL + league + "/standings";
            String json = requestFootballDataApi(apiUrl);

            saveApiResponseLog(apiUrl, league, seasonYear, json);
            saveLeagueStandingList(league, seasonYear, json);
        }

        List<FootballLeagueStandingDTO> standingList =
                footballDataDAO.selectTodayStanding(paramMap);

        return convertToViewDTOList(standingList);
    }

    private String validateLeague(String league) {
        if (league == null || league.trim().isEmpty()) {
            return "PL";
        }

        List<String> allowedLeagues = Arrays.asList("PL", "BL1", "SA", "FL1", "DED");

        if (!allowedLeagues.contains(league)) {
            return "PL";
        }

        return league;
    }

    private String requestFootballDataApi(String apiUrl) throws Exception {
        URL url = new URL(apiUrl);

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("X-Auth-Token", API_KEY);

        int responseCode = conn.getResponseCode();

        if (responseCode != HttpURLConnection.HTTP_OK) {
            throw new RuntimeException("Football-Data API 요청 실패. responseCode=" + responseCode);
        }

        BufferedReader in = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), "UTF-8")
        );

        String inputLine;
        StringBuilder responseData = new StringBuilder();

        while ((inputLine = in.readLine()) != null) {
            responseData.append(inputLine);
        }

        in.close();

        return responseData.toString();
    }

    private void saveApiResponseLog(String apiUrl, String league, String seasonYear, String json) {
        FootballApiResponseLogDTO dto = new FootballApiResponseLogDTO();

        dto.setSnapshotDate(LocalDate.now());
        dto.setApiName(API_NAME);
        dto.setRequestUrl(apiUrl);
        dto.setLeagueCode(league);
        dto.setSeasonYear(seasonYear);
        dto.setResponseJson(json);

        footballDataDAO.insertApiResponseLog(dto);
    }

    private void saveLeagueStandingList(String league, String seasonYear, String json) {
        Gson gson = new Gson();

        FootballStandingResponseDTO responseDTO =
                gson.fromJson(json, FootballStandingResponseDTO.class);

        FootballAreaDTO area = responseDTO.getArea();
        FootballCompetitionDTO competition = responseDTO.getCompetition();
        FootballSeasonDTO season = responseDTO.getSeason();

        if (responseDTO.getStandings() == null || responseDTO.getStandings().isEmpty()) {
            return;
        }

        FootballStandingDTO standing = responseDTO.getStandings().get(0);

        if (standing.getTable() == null || standing.getTable().isEmpty()) {
            return;
        }

        for (FootballTableDTO table : standing.getTable()) {
            FootballLeagueStandingDTO dto = new FootballLeagueStandingDTO();

            dto.setSnapshotDate(LocalDate.now());

            if (season != null) {
                dto.setSeasonId(season.getId());
                dto.setSeasonYear(seasonYear);
                dto.setSeasonStartDate(parseLocalDate(season.getStartDate()));
                dto.setSeasonEndDate(parseLocalDate(season.getEndDate()));
                dto.setCurrentMatchday(season.getCurrentMatchday());
            } else {
                dto.setSeasonYear(seasonYear);
            }

            if (area != null) {
                dto.setAreaId(area.getId());
                dto.setAreaName(area.getName());
                dto.setAreaCode(area.getCode());
                dto.setAreaFlag(area.getFlag());
            }

            if (competition != null) {
                dto.setCompetitionId(competition.getId());
                dto.setCompetitionName(competition.getName());
                dto.setLeagueCode(league);
                dto.setCompetitionType(competition.getType());
                dto.setCompetitionEmblem(competition.getEmblem());
            } else {
                dto.setCompetitionName(league);
                dto.setLeagueCode(league);
            }

            dto.setStage(standing.getStage());
            dto.setStandingType(standing.getType());
            dto.setStandingGroup(standing.getGroup());

            if (table.getTeam() != null) {
                dto.setTeamId(table.getTeam().getId());
                dto.setTeamName(table.getTeam().getName());
                dto.setTeamShortName(table.getTeam().getShortName());
                dto.setTeamTla(table.getTeam().getTla());
                dto.setTeamCrest(table.getTeam().getCrest());
            }

            dto.setPosition(table.getPosition());
            dto.setPlayedGames(table.getPlayedGames());
            dto.setWon(table.getWon());
            dto.setDraw(table.getDraw());
            dto.setLost(table.getLost());
            dto.setPoints(table.getPoints());
            dto.setGoalsFor(table.getGoalsFor());
            dto.setGoalsAgainst(table.getGoalsAgainst());
            dto.setGoalDifference(table.getGoalDifference());
            dto.setForm(table.getForm());

            footballDataDAO.insertLeagueStanding(dto);
        }
    }

    private LocalDate parseLocalDate(String dateText) {
        if (dateText == null || dateText.trim().isEmpty()) {
            return null;
        }

        return LocalDate.parse(dateText);
    }

    private List<FootballStandingViewDTO> convertToViewDTOList(
            List<FootballLeagueStandingDTO> standingList
    ) {
        List<FootballStandingViewDTO> viewList = new ArrayList<>();

        for (FootballLeagueStandingDTO standing : standingList) {
            FootballStandingViewDTO view = new FootballStandingViewDTO();

            view.setPosition(standing.getPosition());
            view.setTeamName(standing.getTeamName());
            view.setTeamCrest(standing.getTeamCrest());
            view.setPlayedGames(standing.getPlayedGames());
            view.setWon(standing.getWon());
            view.setDraw(standing.getDraw());
            view.setLost(standing.getLost());
            view.setGoalsFor(standing.getGoalsFor());
            view.setGoalsAgainst(standing.getGoalsAgainst());
            view.setPoints(standing.getPoints());

            viewList.add(view);
        }

        return viewList;
    }

}
