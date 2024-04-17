package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.GameDTO;
import com.fcjava.model.GameApply;

public class GameApplyAction implements DBinterface {
	
	static GameApplyAction gameControllApply = new GameApplyAction();
	public static GameApplyAction getGameControllApply() {
		return gameControllApply;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String team_num = request.getParameter("team_num");
		String game_num = request.getParameter("game_num");
		
		GameApply gameApply = GameApply.getApplyGame();
		gameApply.applyGame(team_num, game_num);
		
		String url = "fcjava.game?page=2&game_num="+game_num;
		return url;
	}

}
