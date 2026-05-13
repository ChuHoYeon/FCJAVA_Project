package com.fcjava.service;

import java.util.List;

import com.fcjava.dao.GameDAO;
import com.fcjava.dto.GameApplyTeamDTO;
import com.fcjava.dto.GameDTO;
import com.fcjava.dto.GameResultDTO;

public class GameService {
	private static final GameService instance = new GameService();

	private final GameDAO gameDAO = GameDAO.getInstance();

	private GameService() {}

	public static GameService getInstance() {
		return instance;
	}

	public List<GameDTO> findAllGames() {
		return gameDAO.getAllSelect();
	}

	public List<GameDTO> searchGames(String type, String text) {
		return gameDAO.getGameSelect(type, text);
	}

	public GameDTO findGame(String gameNum) {
		return gameDAO.getSelectGame(gameNum);
	}

	public List<GameApplyTeamDTO> findApplyTeams(String gameNum) {
		return gameDAO.selectApplyTeam(gameNum);
	}

	public List<GameResultDTO> findGameResults(String gameNum) {
		return gameDAO.GameResultList(gameNum);
	}

	public void applyGame(String teamNum, String gameNum) {
		gameDAO.applyGame(teamNum, gameNum);
	}

	public void cancelGameApply(String gameNum, String teamNum) {
		gameDAO.applyCancelGame(gameNum, teamNum);
	}
}
