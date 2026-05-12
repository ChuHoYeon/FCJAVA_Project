package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class FreeBoardEditFormAction implements Action {
	private static final FreeBoardEditFormAction instance = new FreeBoardEditFormAction();

	private final BoardService boardService = BoardService.getInstance();

	private FreeBoardEditFormAction() {}

	public static FreeBoardEditFormAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("board", boardService.findFreeBoard(request.getParameter("number")));
		return "freeBorderEdit.jsp";
	}
}
