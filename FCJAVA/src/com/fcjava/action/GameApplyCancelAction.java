package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.model.GameApplyCancel;

public class GameApplyCancelAction implements DBinterface{

	static GameApplyCancelAction gameControllApplyCancel = new GameApplyCancelAction();
	public static GameApplyCancelAction getGameControllApplyCancel() {
		return gameControllApplyCancel;
	}
	
	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String game_num = request.getParameter("game_num");
		String team_num = request.getParameter("team_num");
		
		GameApplyCancel gameApplyCancel = GameApplyCancel.getGameApplyCancel();
		gameApplyCancel.applyCancelGame(game_num, team_num);
		
		String url = "fcjava.game?page=2&game_num="+ game_num ;
		return url;
	}

}
