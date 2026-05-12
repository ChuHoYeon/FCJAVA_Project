package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.UserDTO;
import com.fcjava.service.UserService;

public class JoinAction implements Action {
	private static final JoinAction instance = new JoinAction();

	private final UserService userService = UserService.getInstance();

	private JoinAction() {}

	public static JoinAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String emailDomain = request.getParameter("email1");
		if (emailDomain != null && emailDomain.contains("@")) {
			email += emailDomain;
		}

		UserDTO user = new UserDTO();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		user.setName(request.getParameter("name"));
		user.setB_day(request.getParameter("bir"));
		user.setP_num(request.getParameter("cell"));
		user.setGender(request.getParameter("gender"));
		user.setEmail(email);
		user.setAdd(request.getParameter("addr1") + " " + request.getParameter("addr2"));

		userService.join(user);
		return "redirect:index.jsp";
	}
}
