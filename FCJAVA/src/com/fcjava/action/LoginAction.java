package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.TeamDTO;
import com.fcjava.dto.UserDTO;
import com.fcjava.service.TeamService;
import com.fcjava.service.UserService;

public class LoginAction implements Action {
	private static final LoginAction instance = new LoginAction();

	private final UserService userService = UserService.getInstance();
	private final TeamService teamService = TeamService.getInstance();

	private LoginAction() {}

	public static LoginAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		response.setContentType("text/plain;charset=UTF-8");

		if (!userService.existsUser(id)) {
			response.getWriter().print("id");
			return null;
		}

		UserDTO user = userService.login(id, pw);
		if (user == null) {
			response.getWriter().print("pw");
			return null;
		}

		List<TeamDTO> myTeamList = teamService.findMyTeamList(id);
		request.getSession().setAttribute("ID", id);
		request.getSession().setAttribute("MyTeamList", myTeamList);
		response.getWriter().print("OK");
		return null;
	}
}
