package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.service.BoardService;

public class ProductReviewListAction implements Action {
	private static final ProductReviewListAction instance = new ProductReviewListAction();

	private final BoardService boardService = BoardService.getInstance();

	private ProductReviewListAction() {}

	public static ProductReviewListAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("reviews", boardService.findProductReviews());
		return "board_1.jsp";
	}
}
