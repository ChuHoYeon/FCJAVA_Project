package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.TeamDTO;
import com.fcjava.model.MyTeamList;
import com.fcjava.model.TeamSecession;

public class TeamSecessionAction implements DBinterface{
	static TeamSecessionAction teamSecessionAction = new TeamSecessionAction();
	public static TeamSecessionAction getTeamSecessionAction() {
		return teamSecessionAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String t_num = request.getParameter("t_num");
		String id = request.getParameter("id");
		
		TeamSecession teamSecession = TeamSecession.getTeamSecession();
		teamSecession.deleteTeamSecession(t_num, id);
		
		MyTeamList myList = MyTeamList.getMyTeamList();
		List<TeamDTO> myTeamList = myList.refrashMyTeamList(id);
		session.setAttribute("MyTeamList", myTeamList);
		
		String url = "fcjava.team?page=detail&teamNumber="+t_num;
		return url;
	}

}
