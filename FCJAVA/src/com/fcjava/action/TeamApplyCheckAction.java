package com.fcjava.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.TeamService;

public class TeamApplyCheckAction implements Action {
	private final static TeamApplyCheckAction instance = new TeamApplyCheckAction();

	private final TeamService teamService = TeamService.getInstance();
	
	private TeamApplyCheckAction() {}
	
	public static TeamApplyCheckAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		int count = teamService.countApplyTeam(id);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(count >= 3){
			out.println("NO");
		} else {
			out.println("OK");
		}
		
		return null;
	}
}
