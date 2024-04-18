package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.model.TeamSecession;

public class TeamSecessionAction implements DBinterface{
	static TeamSecessionAction teamSecessionAction = new TeamSecessionAction();
	public static TeamSecessionAction getTeamSecessionAction() {
		return teamSecessionAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String t_num = request.getParameter("t_num");
		String id = request.getParameter("id");
		
		TeamSecession teamSecession = TeamSecession.getTeamSecession();
		teamSecession.deleteTeamSecession(t_num, id);
		
		String url = "fcjava.team?page=detail&teamNumber="+t_num;
		return url;
	}

}
