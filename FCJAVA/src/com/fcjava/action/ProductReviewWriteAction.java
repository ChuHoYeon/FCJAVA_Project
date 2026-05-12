package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class ProductReviewWriteAction implements Action {
	private static final ProductReviewWriteAction instance = new ProductReviewWriteAction();

	private final BoardService boardService = BoardService.getInstance();

	private ProductReviewWriteAction() {}

	public static ProductReviewWriteAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");
		String content = request.getParameter("bon");

		if (title == null || title.trim().isEmpty() || content == null || content.trim().isEmpty()) {
			request.setAttribute("message", "제목과 내용을 모두 입력하세요.");
			return "reviewResult.jsp";
		}

		boardService.writeProductReview(title, content);
		request.setAttribute("message", "후기가 성공적으로 등록되었습니다.");
		return "reviewResult.jsp";
	}
}
