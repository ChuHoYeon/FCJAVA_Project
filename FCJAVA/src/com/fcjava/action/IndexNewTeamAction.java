package com.fcjava.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.TeamDTO;
import com.fcjava.service.TeamService;
import com.google.gson.Gson;

public class IndexNewTeamAction implements Action{
	private static final IndexNewTeamAction instance = new IndexNewTeamAction();

	private final TeamService teamService = TeamService.getInstance();
	
	private IndexNewTeamAction() {}
	
	public static IndexNewTeamAction getInstance() {
		return instance;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		
		List<TeamDTO> indexteamList = teamService.findIndexTeamList();
		if(indexteamList != null) {
			response.setCharacterEncoding("UTF-8");
			String jsonTeam = new Gson().toJson(indexteamList);
	        PrintWriter out = response.getWriter();
	        out.println(jsonTeam);
		}
		return url;
	}

}
