package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.FreeBoardDTO;
import com.fcjava.dto.FreeBoardLikeDTO;
import com.fcjava.service.BoardService;

public class FreeBoardListAction implements Action {
	private static final FreeBoardListAction instance = new FreeBoardListAction();

	private final BoardService boardService = BoardService.getInstance();

	private FreeBoardListAction() {}

	public static FreeBoardListAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String selectText = request.getParameter("selectText");
		String searchText = request.getParameter("searchText");
		String sessionId = (String) request.getSession().getAttribute("ID");

		List<FreeBoardDTO> freeBoardList = boardService.findFreeBoards(selectText, searchText);
		List<FreeBoardLikeDTO> freeBoardLikes = boardService.findFreeBoardLikesByUser(sessionId);

		request.setAttribute("freeBoardList", freeBoardList);
		request.setAttribute("freeBoardLikes", freeBoardLikes);
		return "freeBoardList.jsp";
	}
}
