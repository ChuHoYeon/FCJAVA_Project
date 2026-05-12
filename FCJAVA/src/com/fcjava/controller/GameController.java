package com.fcjava.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.Action;
import com.fcjava.action.GameAllSelectAction;
import com.fcjava.action.GameApplyAction;
import com.fcjava.action.GameApplyCancelAction;
import com.fcjava.action.GameDetailAction;
import com.fcjava.action.GameSearchAction;

public class GameController extends HttpServlet {
	private final Map<String, Action> actions = new HashMap<>();

	@Override
	public void init() throws ServletException {
		actions.put("gameList", GameAllSelectAction.getInstance());
		actions.put("gameSearch", GameSearchAction.getInstance());
		actions.put("detail", GameDetailAction.getInstance());
		actions.put("apply", GameApplyAction.getInstance());
		actions.put("applyCancel", GameApplyCancelAction.getInstance());
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
