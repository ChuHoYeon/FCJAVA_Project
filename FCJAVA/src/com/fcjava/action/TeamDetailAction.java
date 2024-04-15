package com.fcjava.action;

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
		
		TeamDetail teamDetail = TeamDetail.getTeamDetail();
		TeamDTO team = teamDetail.getTeam(teamNumber);
		
		TeamPlayersList teamPlayersList = TeamPlayersList.getTeamPlayersList();
		List<PlayerDTO> playerList = teamPlayersList.getPlayerList(teamNumber);
		
		request.setAttribute("playerList", playerList);
		request.setAttribute("team", team);
		String url = "teamDetail.jsp";
		return url;
	}

}
