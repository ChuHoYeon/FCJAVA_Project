package com.fcjava.action;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.GameApplyTeamDTO;
import com.fcjava.dto.GameDTO;
import com.fcjava.dto.GameResultDTO;
import com.fcjava.service.GameService;

public class GameDetailAction implements Action {
	private static final GameDetailAction instance = new GameDetailAction();

	private final GameService gameService = GameService.getInstance();

	private GameDetailAction() {}

	public static GameDetailAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String gameNum = request.getParameter("game_num");
		
		GameDTO game = gameService.findGame(gameNum);		
		List<GameApplyTeamDTO> applyTeamList = gameService.findApplyTeams(gameNum);
		
		//현재날짜가 대회기간이후일 경우
		LocalDateTime targetDateTime = game.getGame_fn_date();
		LocalDateTime currentDateTime = LocalDateTime.now();
		
		if (targetDateTime != null && currentDateTime.isAfter(targetDateTime)) {
			List<GameResultDTO> gameResultList = gameService.findGameResults(gameNum);
			request.setAttribute("gameResultList", gameResultList);
		}
		
		request.setAttribute("game", game);
		request.setAttribute("applyTeamList", applyTeamList);
		return "gameDetail.jsp";
	}

}
