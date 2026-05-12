package com.fcjava.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.Action;
import com.fcjava.action.TeamApplyAction;
import com.fcjava.action.TeamApplyCheckAction;
import com.fcjava.action.TeamBoardWriteAction;
import com.fcjava.action.TeamCreateAction;
import com.fcjava.action.TeamCreateFormationAction;
import com.fcjava.action.TeamDetailAction;
import com.fcjava.action.TeamListAction;
import com.fcjava.action.TeamNameCheckAction;
import com.fcjava.action.TeamSearchAction;
import com.fcjava.action.TeamSecessionAction;

public class TeamController extends HttpServlet {
	
	private final Map<String, Action> actions = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		actions.put("list", TeamListAction.getInstance());
		actions.put("teamSearch", TeamSearchAction.getInstance());
        actions.put("detail", TeamDetailAction.getInstance());
        actions.put("teamApplyCheck", TeamApplyCheckAction.getInstance());
        actions.put("apply", TeamApplyAction.getInstance());
        actions.put("secession", TeamSecessionAction.getInstance());
        actions.put("createFormation", TeamCreateFormationAction.getInstance());
        actions.put("writeBoard", TeamBoardWriteAction.getInstance());
        actions.put("teamNameCheck", TeamNameCheckAction.getInstance());
        actions.put("create", TeamCreateAction.getInstance());
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		
		String page = request.getParameter("page");
		
		Action action = actions.get(page);
		
		if (action == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		try {
			String viewPath = action.execute(request, response);
			
			if (viewPath == null) {
				return;
			}
			if (viewPath.startsWith("redirect:")) {
				response.sendRedirect(viewPath.substring("redirect:".length()));
				return;
			}
			request.getRequestDispatcher(viewPath).forward(request, response);
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
	}
}
