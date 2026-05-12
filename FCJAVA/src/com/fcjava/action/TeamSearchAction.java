package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.TeamDTO;
import com.fcjava.service.TeamService;
import com.google.gson.Gson;

public class TeamSearchAction implements Action {
	
	private static final TeamSearchAction instance = new TeamSearchAction();
	
	private final TeamService teamService = TeamService.getInstance();
	
	private TeamSearchAction() {}
	
	public static TeamSearchAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String t_name = request.getParameter("t_name");
		String[] hom_city = request.getParameterValues("hom_city[]");
		String[] week_time = request.getParameterValues("week_time[]");
		String[] t_skill = request.getParameterValues("t_skill[]");
		
		List<TeamDTO> teamList = teamService.findSearchTeamList(t_name, hom_city, week_time, t_skill);
		
		if(teamList != null) {
			Gson gson = new Gson();
	        String jsonResult = gson.toJson(teamList);
	        
	        response.setContentType("application/json; charset=UTF-8");
	        response.getWriter().write(jsonResult);
		}
		
		return null;
	}
}
