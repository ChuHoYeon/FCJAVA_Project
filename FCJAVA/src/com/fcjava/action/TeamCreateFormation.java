package com.fcjava.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.model.TeamFormation;

public class TeamCreateFormation implements DBinterface{
	static TeamCreateFormation teamCreateFormation = new TeamCreateFormation();
	public static TeamCreateFormation getTeamCreateFormation() {
		return teamCreateFormation;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String url = null;
		boolean checkFormationName = false;
		int t_num = Integer.parseInt(request.getParameter("t_num"));
		String formation = request.getParameter("formation");
		String formation_name = request.getParameter("formation_name");
		String player_id[] = request.getParameterValues("player_id");
		
		TeamFormation teamFormation = TeamFormation.getTeamFormation();
		//포메이션 이름 중복체크
		checkFormationName = teamFormation.isFormationName(t_num, formation_name);
		
		if(checkFormationName) {//true면 포메이션저장
			teamFormation.createFormation(t_num, formation, formation_name, player_id);
			url = "fcjava.team?page=detail&teamNumber="+t_num;
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('동일한 이름의 포메이션이 있습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		return url;
	}

}
