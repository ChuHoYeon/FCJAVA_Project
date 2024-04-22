package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.PlayerDTO;
import com.fcjava.dto.TeamDTO;
import com.fcjava.dto.TeamFormationDTO;
import com.fcjava.model.TeamDetail;
import com.fcjava.model.TeamFormation;
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
			request.setAttribute("team", team);
			
			//팀 선수 목록
			TeamPlayersList teamPlayersList = TeamPlayersList.getTeamPlayersList();
			List<PlayerDTO> playerList = teamPlayersList.getPlayerList(teamNumber);
			request.setAttribute("playerList", playerList);
			
			// 성별, 나이, 포지션 정보 카운트
			TeamCountPlayerInfo playerInfoCounter = new TeamCountPlayerInfo();
			for(PlayerDTO player : playerList) {
				playerInfoCounter.countGender(player.getGender());
                playerInfoCounter.countAge(player.getB_day());
                playerInfoCounter.countPosition(player.getPosition());
			};
			request.setAttribute("genders", playerInfoCounter.getGenders());
			request.setAttribute("ages", playerInfoCounter.getAges());
			request.setAttribute("positions", playerInfoCounter.getPositions());
			
			//포메이션 목록
			TeamFormation teamFormation = TeamFormation.getTeamFormation();
			List<TeamFormationDTO> teamFormations = teamFormation.getTeamFormations(teamNumber);
			request.setAttribute("teamFormations", teamFormations);

			url = "teamDetail.jsp";
		} else {
			url = "index.jsp";
		}
		return url;
	}

}
