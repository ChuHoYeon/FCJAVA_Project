package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fcjava.dto.TeamDTO;
import com.fcjava.service.TeamService;

public class TeamSecessionAction implements Action{
	
	private static final TeamSecessionAction instance = new TeamSecessionAction();

	private final TeamService teamService = TeamService.getInstance();
	
	private TeamSecessionAction() {}
	
	public static TeamSecessionAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String t_num = request.getParameter("t_num");
		String id = request.getParameter("id");
		
		teamService.secedeTeam(t_num, id);
		
		List<TeamDTO> myTeamList = teamService.findMyTeamList(id);
		session.setAttribute("MyTeamList", myTeamList);
		
		String url = "redirect:fcjava.team?page=detail&teamNumber="+t_num;
		return url;
	}

}
