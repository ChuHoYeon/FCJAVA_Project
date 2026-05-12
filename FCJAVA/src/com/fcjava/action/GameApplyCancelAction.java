package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.GameService;

public class GameApplyCancelAction implements Action{
	private static final GameApplyCancelAction instance = new GameApplyCancelAction();

	private final GameService gameService = GameService.getInstance();

	private GameApplyCancelAction() {}

	public static GameApplyCancelAction getInstance() {
		return instance;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String game_num = request.getParameter("game_num");
		String team_num = request.getParameter("team_num");
		
		gameService.cancelGameApply(game_num, team_num);
		
		String url = "redirect:fcjava.game?page=2&game_num="+ game_num ;
		return url;
	}

}
