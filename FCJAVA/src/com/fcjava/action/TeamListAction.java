package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.TeamDTO;
import com.fcjava.model.TeamList;

public class TeamListAction implements DBinterface{
	
	static TeamListAction teamListAction = new TeamListAction();
	public static TeamListAction getTeamListAction() {
		return teamListAction;
	}
	
	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url = null;
		TeamList team = TeamList.getTeamList();
		List<TeamDTO> teamList = team.selectTeamList();
		if(teamList != null) {
			request.setAttribute("teamList", teamList);
			url = "teamlist.jsp";
		}
		return url;
	}

}
