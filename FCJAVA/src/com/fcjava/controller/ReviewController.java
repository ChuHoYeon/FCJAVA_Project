package com.fcjava.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.Action;
import com.fcjava.action.ProductReviewListAction;
import com.fcjava.action.ProductReviewWriteAction;

public class ReviewController extends HttpServlet {
	private final Map<String, Action> actions = new HashMap<>();

	@Override
	public void init() throws ServletException {
		actions.put("list", ProductReviewListAction.getInstance());
		actions.put("write", ProductReviewWriteAction.getInstance());
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
			if (viewPath != null) {
				request.getRequestDispatcher(viewPath).forward(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
