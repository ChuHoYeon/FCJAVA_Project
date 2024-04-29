package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.TeamDTO;
import com.fcjava.model.TeamSearch;
import com.google.gson.Gson;

public class TeamSearchAction {
	static TeamSearchAction teamSearchAction = new TeamSearchAction();
	public static TeamSearchAction getTeamSearchAction() {
		return teamSearchAction;
	}
	
	public void getTeamSearchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String t_name = request.getParameter("t_name");
		String[] hom_city = request.getParameterValues("hom_city[]");
		String[] week_time = request.getParameterValues("week_time[]");
		String[] t_skill = request.getParameterValues("t_skill[]");
		
		TeamSearch teamSearch =TeamSearch.getTeamSearch();
		List<TeamDTO> teamList = teamSearch.searchTeamList(t_name, hom_city, week_time, t_skill);
		if(teamList != null) {
			Gson gson = new Gson();
	        String jsonResult = gson.toJson(teamList);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(jsonResult);
		}
	}
}
