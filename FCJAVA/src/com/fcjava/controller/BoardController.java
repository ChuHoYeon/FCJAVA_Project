package com.fcjava.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.Action;
import com.fcjava.action.FreeBoardDeleteAction;
import com.fcjava.action.FreeBoardDetailAction;
import com.fcjava.action.FreeBoardEditFormAction;
import com.fcjava.action.FreeBoardLikeAction;
import com.fcjava.action.FreeBoardListAction;
import com.fcjava.action.FreeBoardUnlikeAction;
import com.fcjava.action.FreeBoardUpdateAction;
import com.fcjava.action.FreeBoardWriteAction;

public class BoardController extends HttpServlet {
	private final Map<String, Action> actions = new HashMap<>();

	@Override
	public void init() throws ServletException {
		actions.put("list", FreeBoardListAction.getInstance());
		actions.put("detail", FreeBoardDetailAction.getInstance());
		actions.put("edit", FreeBoardEditFormAction.getInstance());
		actions.put("write", FreeBoardWriteAction.getInstance());
		actions.put("update", FreeBoardUpdateAction.getInstance());
		actions.put("delete", FreeBoardDeleteAction.getInstance());
		actions.put("like", FreeBoardLikeAction.getInstance());
		actions.put("unlike", FreeBoardUnlikeAction.getInstance());
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		Action action = actions.get(request.getParameter("page"));

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
