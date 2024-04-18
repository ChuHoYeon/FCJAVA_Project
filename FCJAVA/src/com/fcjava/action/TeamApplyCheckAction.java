package com.fcjava.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.model.TeamApplyCheck;

public class TeamApplyCheckAction {
	static TeamApplyCheckAction teamApplyCheckAction = new TeamApplyCheckAction();
	public static TeamApplyCheckAction getTeamApplyCheckAction() {
		return teamApplyCheckAction;
	}
	
	public void goTeamApplyCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		TeamApplyCheck teamApplyCheck=TeamApplyCheck.getTeamApplyCheck();
		int count = teamApplyCheck.applyTeamCount(id);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(count >= 3){
			out.println("NO");
		} else {
			out.println("OK");
		}
	}
}
