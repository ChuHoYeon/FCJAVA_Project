package com.fcjava.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.fcjava.dto.GameDTO;
import com.fcjava.model.GameSearch;

public class GameControllSearch {

	static GameControllSearch gameControllSearch = new GameControllSearch();
	public static GameControllSearch getGameControllSearch() {
		return gameControllSearch;
	}
	
	public JSONArray searchGame(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String text = request.getParameter("search-text");
		String type = request.getParameter("status-tab");
		GameSearch gameSearch = GameSearch.getGameSelect();
		List<GameDTO> gameList = gameSearch.getGameSelect(type, text);
		
		JSONArray jsonArray = new JSONArray();

		for(GameDTO game : gameList) {
			JSONObject json = new JSONObject();
			json.put("num", game.getGame_num());
			json.put("name", game.getGame_name());
			json.put("type", game.getGame_type());
			json.put("place", game.getGame_place());
			json.put("img", game.getGame_img());
			json.put("memo", game.getGame_memo());
			json.put("subst_date", game.getGame_subst_date());
			json.put("subfn_date", game.getGame_subfn_date());
			json.put("st_date", game.getGame_st_date());
			json.put("fn_date", game.getGame_fn_date());
			
			jsonArray.add(json);
		}
		
		return jsonArray;
	}

}
