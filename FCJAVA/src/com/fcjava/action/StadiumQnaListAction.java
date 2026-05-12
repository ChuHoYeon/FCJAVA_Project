package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class StadiumQnaListAction implements Action {
	private static final StadiumQnaListAction instance = new StadiumQnaListAction();

	private final BoardService boardService = BoardService.getInstance();

	private StadiumQnaListAction() {}

	public static StadiumQnaListAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("qnaList", boardService.findStadiumQnaList());
		return "str_qa.jsp";
	}
}
