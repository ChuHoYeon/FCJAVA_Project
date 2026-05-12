package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class FreeBoardUpdateAction implements Action {
	private static final FreeBoardUpdateAction instance = new FreeBoardUpdateAction();

	private final BoardService boardService = BoardService.getInstance();

	private FreeBoardUpdateAction() {}

	public static FreeBoardUpdateAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = request.getParameter("number");
		boardService.updateFreeBoard(number, request.getParameter("title"), request.getParameter("memo"));
		return "redirect:fcjava.board?page=detail&number=" + number;
	}
}
