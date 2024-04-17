package com.fcjava.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.GameApplyTeam;
import com.fcjava.dto.GameDTO;
import com.fcjava.dto.GameResultDTO;
import com.fcjava.model.GameDetail;
import com.fcjava.model.GameResult;
import com.fcjava.model.GameTeamSelect;

public class GameDetailAction implements DBinterface {
	static GameDetailAction gameControllDetail = new GameDetailAction();
	public static GameDetailAction getGameControllDetail() {
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
		
		//현재날짜가 대회기간이후일 경우 실행
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date targetDate = dateFormat.parse(game.getGame_fn_date());
		Date currentDate = new Date();
		List<GameResultDTO> gameResultList = null;
		if (currentDate.after(targetDate)) {
            GameResult gameResult = GameResult.getGameResult();
            gameResultList = gameResult.GameResultList(gameNum);
            request.setAttribute("gameResultList", gameResultList);
        }
		return "gameDetail.jsp";
	}

}
