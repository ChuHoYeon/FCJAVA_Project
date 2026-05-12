package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.TeamDTO;
import com.fcjava.service.TeamService;

public class TeamListAction implements Action{
	
	private static final TeamListAction instance = new TeamListAction();

	private final TeamService teamService = TeamService.getInstance();
	
	private TeamListAction() {}
	
	public static TeamListAction getInstance() {
		return instance;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		List<TeamDTO> teamList = teamService.findTeamList();
		if (!teamList.isEmpty()) {
			request.setAttribute("teamList", teamList);
			url = "teamlist.jsp";
		}
		return url;
	}

}
