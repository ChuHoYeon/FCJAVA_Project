package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.GameService;

public class GameApplyAction implements Action {
	private static final GameApplyAction instance = new GameApplyAction();
	
	private final GameService gameService = GameService.getInstance();

	private GameApplyAction() {}

	public static GameApplyAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String team_num = request.getParameter("team_num");
		String game_num = request.getParameter("game_num");
		
		gameService.applyGame(team_num, game_num);
		
		String url = "redirect:fcjava.game?page=detail&game_num="+game_num;
		return url;
	}

}
