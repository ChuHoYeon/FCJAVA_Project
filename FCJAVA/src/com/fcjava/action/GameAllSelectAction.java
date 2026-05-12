package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.GameDTO;
import com.fcjava.service.GameService;

public class GameAllSelectAction implements Action {
	private static final GameAllSelectAction instance = new GameAllSelectAction();

	private final GameService gameService = GameService.getInstance();

	private GameAllSelectAction() {}

	public static GameAllSelectAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<GameDTO> gameList = gameService.findAllGames();
		
		request.setAttribute("Games", gameList); 
		return "gameList.jsp";
	}

}
