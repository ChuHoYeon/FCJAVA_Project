package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.UserService;

public class JoinIdCheckAction implements Action {
	private static final JoinIdCheckAction instance = new JoinIdCheckAction();

	private final UserService userService = UserService.getInstance();

	private JoinIdCheckAction() {}

	public static JoinIdCheckAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("ID");
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(userService.existsUser(id) ? "1" : "0");
		return null;
	}
}
