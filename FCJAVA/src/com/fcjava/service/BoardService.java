package com.fcjava.service;

import java.util.List;

import com.fcjava.dao.BoardDAO;
import com.fcjava.dto.FreeBoardDTO;
import com.fcjava.dto.FreeBoardLikeDTO;
import com.fcjava.dto.ProductReviewDTO;
import com.fcjava.dto.StadiumQnaDTO;

public class BoardService {
	private static final BoardService instance = new BoardService();

	private final BoardDAO boardDAO = BoardDAO.getInstance();

	private BoardService() {}

	public static BoardService getInstance() {
		return instance;
	}

	public List<FreeBoardDTO> findFreeBoards(String selectText, String searchText) {
		return boardDAO.findFreeBoards(selectText, searchText);
	}

	public FreeBoardDTO findFreeBoard(String number) {
		return boardDAO.findFreeBoard(number);
	}

	public List<FreeBoardLikeDTO> findFreeBoardLikesByUser(String id) {
		return boardDAO.findFreeBoardLikesByUser(id);
	}

	public boolean existsFreeBoardLike(String id, String number) {
		return boardDAO.existsFreeBoardLike(id, number);
	}

	public void writeFreeBoard(String id, String title, String memo) {
		FreeBoardDTO board = new FreeBoardDTO();
		board.setId(id);
		board.setTitle(title);
		board.setMemo(memo);
		boardDAO.insertFreeBoard(board);
	}

	public void updateFreeBoard(String number, String title, String memo) {
		FreeBoardDTO board = new FreeBoardDTO();
		board.setNumber(Integer.parseInt(number));
		board.setTitle(title);
		board.setMemo(memo);
		boardDAO.updateFreeBoard(board);
	}

	public void deleteFreeBoard(String number) {
		boardDAO.deleteFreeBoard(number);
	}

	public void likeFreeBoard(String id, String number) {
		boardDAO.insertFreeBoardLike(id, number);
	}

	public void unlikeFreeBoard(String id, String number) {
		boardDAO.deleteFreeBoardLike(id, number);
	}

	public List<ProductReviewDTO> findProductReviews() {
		return boardDAO.findProductReviews();
	}

	public void writeProductReview(String title, String content) {
		ProductReviewDTO review = new ProductReviewDTO();
		review.setTitle(title);
		review.setContent(content);
		boardDAO.insertProductReview(review);
	}

	public List<StadiumQnaDTO> findStadiumQnaList() {
		return boardDAO.findStadiumQnaList();
	}
}
