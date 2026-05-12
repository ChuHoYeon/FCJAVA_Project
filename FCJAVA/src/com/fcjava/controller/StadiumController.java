package com.fcjava.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.Action;
import com.fcjava.action.StadiumCreateAction;
import com.fcjava.action.StadiumBookingFormAction;
import com.fcjava.action.StadiumBookingAction;
import com.fcjava.action.StadiumListAction;

public class StadiumController extends HttpServlet {
	private final Map<String, Action> actions = new HashMap<>();

	@Override
	public void init() throws ServletException {
		actions.put("create", StadiumCreateAction.getInstance());
		actions.put("list", StadiumListAction.getInstance());
		actions.put("bookingForm", StadiumBookingFormAction.getInstance());
		actions.put("booking", StadiumBookingAction.getInstance());
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
