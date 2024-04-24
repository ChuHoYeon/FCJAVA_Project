package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;

public class TeamCreateFormation implements DBinterface{
	static TeamCreateFormation teamCreateFormation = new TeamCreateFormation();
	public static TeamCreateFormation getTeamCreateFormation() {
		return teamCreateFormation;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url = null;
		String t_num = request.getParameter("t_num");
		String formation = request.getParameter("formation");
		String formation_name = request.getParameter("formation_name");
		String player_id[] = request.getParameterValues("player_id");
		
		url = "fcjava.team?page=detail&teamNumber="+t_num;
		return url;
	}

}
