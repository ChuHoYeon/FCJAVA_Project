package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class FreeBoardWriteAction implements Action {
	private static final FreeBoardWriteAction instance = new FreeBoardWriteAction();

	private final BoardService boardService = BoardService.getInstance();

	private FreeBoardWriteAction() {}

	public static FreeBoardWriteAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String) request.getSession().getAttribute("ID");
		boardService.writeFreeBoard(id, request.getParameter("title"), request.getParameter("content"));
		return "redirect:fcjava.board?page=list";
	}
}
