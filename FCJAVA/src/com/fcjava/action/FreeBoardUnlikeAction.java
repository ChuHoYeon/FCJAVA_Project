package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class FreeBoardUnlikeAction implements Action {
	private static final FreeBoardUnlikeAction instance = new FreeBoardUnlikeAction();

	private final BoardService boardService = BoardService.getInstance();

	private FreeBoardUnlikeAction() {}

	public static FreeBoardUnlikeAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boardService.unlikeFreeBoard(request.getParameter("ID"), request.getParameter("Num"));
		return null;
	}
}
