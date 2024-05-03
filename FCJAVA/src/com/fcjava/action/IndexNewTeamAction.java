package com.fcjava.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.TeamDTO;
import com.fcjava.model.TeamList;
import com.google.gson.Gson;

public class IndexNewTeamAction implements DBinterface{
	static IndexNewTeamAction indexNewTeamAction = new IndexNewTeamAction();
	public static IndexNewTeamAction getIndexNewTeamAction() {
		return indexNewTeamAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url = null;
		
		TeamList teamList = TeamList.getTeamList();
		List<TeamDTO> indexteamList = teamList.indexTeamList();
		if(indexteamList != null) {
			response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
	        String jsonTeam = new Gson().toJson(indexteamList);
	        out.println(jsonTeam);
		}
		return url;
	}

}
