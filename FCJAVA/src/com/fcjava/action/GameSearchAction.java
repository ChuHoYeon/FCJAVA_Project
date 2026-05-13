package com.fcjava.action;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.GameDTO;
import com.fcjava.dto.GameSearchViewDTO;
import com.fcjava.service.GameService;
import com.google.gson.Gson;

public class GameSearchAction implements Action {
	private static final GameSearchAction instance = new GameSearchAction();

	private final GameService gameService = GameService.getInstance();

	private GameSearchAction() {
	}

	public static GameSearchAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String text = request.getParameter("search-text");
		String type = request.getParameter("status-tab");

		List<GameDTO> gameList = gameService.searchGames(type, text);
		
		List<GameSearchViewDTO> viewList = gameList.stream()
				.map(GameSearchViewDTO::new)
				.collect(Collectors.toList());

		Gson gson = new Gson();
		String json = gson.toJson(viewList);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(json);

		return null;
	}

}
