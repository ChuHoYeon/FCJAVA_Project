package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class FreeBoardDeleteAction implements Action {
	private static final FreeBoardDeleteAction instance = new FreeBoardDeleteAction();

	private final BoardService boardService = BoardService.getInstance();

	private FreeBoardDeleteAction() {}

	public static FreeBoardDeleteAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boardService.deleteFreeBoard(request.getParameter("number"));
		return "redirect:fcjava.board?page=list";
	}
}
