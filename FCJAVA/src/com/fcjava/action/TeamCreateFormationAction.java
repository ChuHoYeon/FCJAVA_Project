package com.fcjava.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.TeamService;

public class TeamCreateFormationAction implements Action{
	
	private static final TeamCreateFormationAction instance = new TeamCreateFormationAction();

	private final TeamService teamService = TeamService.getInstance();
	
	private TeamCreateFormationAction() {}
	
	public static TeamCreateFormationAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = null;
		boolean checkFormationName = false;
		int t_num = Integer.parseInt(request.getParameter("t_num"));
		String formation = request.getParameter("formation");
		String formation_name = request.getParameter("formation_name");
		String player_id[] = request.getParameterValues("player_id");
		
		//포메이션 이름 중복체크
		checkFormationName = teamService.isAvailableFormationName(t_num, formation_name);
		
		if(checkFormationName) {//true면 포메이션저장
			teamService.createFormation(t_num, formation, formation_name, player_id);
			url = "redirect:fcjava.team?page=detail&teamNumber="+t_num;
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
