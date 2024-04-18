package com.fcjava.action;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.PlayerDTO;
import com.fcjava.dto.TeamDTO;
import com.fcjava.model.TeamDetail;
import com.fcjava.model.TeamPlayersList;

public class TeamDetailAction implements DBinterface{
	static TeamDetailAction teamDetailAction = new TeamDetailAction();
	public static TeamDetailAction getTeamDetailAction() {
		return teamDetailAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String teamNumber = request.getParameter("teamNumber");
		String url = null;
		if(teamNumber != null) {
			//팀 정보
			TeamDetail teamDetail = TeamDetail.getTeamDetail();
			TeamDTO team = teamDetail.getTeam(teamNumber);
			
			//팀 선수 목록
			TeamPlayersList teamPlayersList = TeamPlayersList.getTeamPlayersList();
			//선수 정보
			List<PlayerDTO> playerList = teamPlayersList.getPlayerList(teamNumber);
			// 성별, 나이, 포지션 정보 카운트
			TeamCountPlayerInfo playerInfoCounter = new TeamCountPlayerInfo();
			for(PlayerDTO player : playerList) {
				playerInfoCounter.countGender(player.getGender());
                playerInfoCounter.countAge(player.getB_day());
                playerInfoCounter.countPosition(player.getPosition());
			};

			request.setAttribute("playerList", playerList);
			request.setAttribute("team", team);
			request.setAttribute("genders", playerInfoCounter.getGenders());
            request.setAttribute("ages", playerInfoCounter.getAges());
            request.setAttribute("positions", playerInfoCounter.getPositions());
            
			url = "teamDetail.jsp";
		} else {
			url = "index.jsp";
		}
		return url;
	}

}
