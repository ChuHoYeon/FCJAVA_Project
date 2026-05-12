package com.fcjava.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fcjava.dao.TeamDAO;
import com.fcjava.dto.PlayerDTO;
import com.fcjava.dto.TeamBoardDTO;
import com.fcjava.dto.TeamDTO;
import com.fcjava.dto.TeamFormationDTO;
import com.fcjava.dto.TeamGameResultDTO;
import com.fcjava.dto.TeamScheduleDTO;

public class TeamService {
	
	private static final TeamService instance = new TeamService();

    private final TeamDAO teamDAO = TeamDAO.getInstance();

    private TeamService() {}

    public static TeamService getInstance() {
        return instance;
    }

    public TeamDTO findTeam(String teamNumber) {
    	return teamDAO.getTeam(teamNumber);
    }

    public List<TeamDTO> findTeamList() {
    	return teamDAO.selectTeamList();
    }

    public List<TeamDTO> findIndexTeamList() {
    	return teamDAO.indexTeamList();
    }

    public boolean isTeamName(String teamName) {
    	return teamDAO.isTeamName(teamName);
    }

    public void createTeam(TeamDTO team) {
    	teamDAO.insertTeam(team);
    }

    public String findLatestTeamNumByUser(String id) {
    	return teamDAO.getLatestTeamNumByUser(id);
    }

    public void createTeamBoardTable(String teamNumber) {
    	teamDAO.createTeamBoardTable(teamNumber);
    }
    
    public void applyTeam(String teamNumber, String id, String playerPhoto, String backNumber, String position, String playerMemo, String height, String weight) {

        teamDAO.insertTeamApply(teamNumber, id, playerPhoto, backNumber, position, playerMemo, height, weight);
    }

    public int countApplyTeam(String id) {
    	return teamDAO.applyTeamCount(id);
    }

    public int countTeamBoards(String teamNumber) {
    	return teamDAO.getBoardCount(teamNumber);
    }

    public List<TeamBoardDTO> findTeamBoardList(String teamNumber, int page, int limit) {
    	return teamDAO.getBoardList(teamNumber, page, limit);
    }

    public void writeTeamBoard(TeamBoardDTO teamBoard) {
    	teamDAO.insertTeamBoard(teamBoard);
    }

    public boolean isAvailableFormationName(int teamNumber, String formationName) {
    	return teamDAO.isFormationName(teamNumber, formationName);
    }

    public void createFormation(int teamNumber, String formation, String formationName, String[] playerIds) {
    	teamDAO.createFormation(teamNumber, formation, formationName, playerIds);
    }

    public List<TeamFormationDTO> findTeamFormations(String teamNumber) {
    	return teamDAO.getTeamFormations(teamNumber);
    }

    public List<TeamGameResultDTO> findTeamGameResults(String teamNumber) {
    	return teamDAO.getTeamGameAllResult(teamNumber);
    }

    public List<PlayerDTO> findPlayerList(String teamNumber) {
    	return teamDAO.getPlayerList(teamNumber);
    }

    public List<TeamScheduleDTO> findScheduleList(String teamNumber) {
    	return teamDAO.getScheduleList(teamNumber);
    }

    public void secedeTeam(String teamNumber, String id) {
    	teamDAO.deleteTeamSecession(teamNumber, id);
    }

    public List<TeamDTO> findMyTeamList(String id) {
        return teamDAO.refrashMyTeamList(id);
    }
    
    public List<TeamDTO> findSearchTeamList(String t_name, String[] hom_city, String[] week_time, String[] t_skill) {
    	Map<String, Object> params = new HashMap<>();
        params.put("t_name", t_name);
        params.put("hom_city", hom_city);
        params.put("t_skill", t_skill);
        
        if(week_time != null && week_time.length > 0) {
	        StringBuilder regexPatternBuilder = new StringBuilder();
	        
	        for (String combination : week_time) {
	        	if (combination == null || combination.isEmpty()) {
	        		continue;
	        	}
	        	
	            if (regexPatternBuilder.length() > 0) {
	                regexPatternBuilder.append("|");
	            }
	            
	            regexPatternBuilder.append(combination);
	        }
	        
	        String regexPattern = regexPatternBuilder.toString();
	        params.put("week_time", regexPattern.isEmpty() ? null : regexPattern);
        } else {
        	params.put("week_time", null);
        }
    	
    	return teamDAO.searchTeamList(params);
    }

}
