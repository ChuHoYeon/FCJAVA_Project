package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class FreeBoardLikeAction implements Action {
	private static final FreeBoardLikeAction instance = new FreeBoardLikeAction();

	private final BoardService boardService = BoardService.getInstance();

	private FreeBoardLikeAction() {}

	public static FreeBoardLikeAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boardService.likeFreeBoard(request.getParameter("ID"), request.getParameter("Num"));
		return null;
	}
}
