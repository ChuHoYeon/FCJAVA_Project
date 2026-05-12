package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.FreeBoardDTO;
import com.fcjava.service.BoardService;

public class FreeBoardDetailAction implements Action {
	private static final FreeBoardDetailAction instance = new FreeBoardDetailAction();

	private final BoardService boardService = BoardService.getInstance();

	private FreeBoardDetailAction() {}

	public static FreeBoardDetailAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String number = request.getParameter("number");
		String sessionId = (String) request.getSession().getAttribute("ID");
		FreeBoardDTO board = boardService.findFreeBoard(number);

		request.setAttribute("board", board);
		request.setAttribute("like", boardService.existsFreeBoardLike(sessionId, number));
		request.setAttribute("owner", board != null && board.getId().equals(sessionId));
		return "freeBoardDetail.jsp";
	}
}
