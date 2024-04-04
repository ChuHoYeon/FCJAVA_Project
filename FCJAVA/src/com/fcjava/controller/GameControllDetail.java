package com.fcjava.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.GameApplyTeam;
import com.fcjava.dto.GameDTO;
import com.fcjava.dto.GameResultDTO;
import com.fcjava.model.GameAllSelect;
import com.fcjava.model.GameDetail;
import com.fcjava.model.GameResult;
import com.fcjava.model.GameTeamSelect;

public class GameControllDetail implements DBinterface {
	static GameControllDetail gameControllDetail = new GameControllDetail();
	public static GameControllDetail getGameControllDetail() {
		return gameControllDetail;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String gameNum = request.getParameter("game_num");
		
		GameDetail gameDetail = GameDetail.getGameDetail();
		GameDTO game = gameDetail.getSelectGame(gameNum);
		request.setAttribute("game", game);
		
		GameTeamSelect gameTeamSelect = GameTeamSelect.getGameTeamSelect();
		List<GameApplyTeam> applyTeamList = gameTeamSelect.selectApplyTeam(gameNum);
		request.setAttribute("applyTeamList", applyTeamList);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date targetDate = dateFormat.parse(game.getGame_fn_date());
		Date currentDate = new Date();
		if (currentDate.after(targetDate)) {
            System.out.println("경기끝났음");
            GameResult gameResult = GameResult.getGameResult();
            List<GameResultDTO> gameResultList = gameResult.GameResultList(gameNum);
            request.setAttribute("gameResultList", gameResultList);
        }
		return "gameDetail.jsp";
	}

}
