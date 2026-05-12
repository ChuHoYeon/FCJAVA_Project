package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.TeamService;

public class TeamNameCheckAction implements Action {
	private static final TeamNameCheckAction instance = new TeamNameCheckAction();

	private final TeamService teamService = TeamService.getInstance();

	private TeamNameCheckAction() {}

	public static TeamNameCheckAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String teamName = request.getParameter("teamName");
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().println(teamService.isTeamName(teamName) ? "있음" : "없음");
		return null;
	}
}
