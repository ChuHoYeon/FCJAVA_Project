package com.fcjava.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.FreeBoardDTO;
import com.fcjava.dto.FreeBorderLikesDTO;
import com.fcjava.dto.PrdBbsDTO;
import com.fcjava.dto.StadiumBbsDTO;
import com.fcjava.util.MyBatisUtil;

public class BoardDAO {
	private static final BoardDAO instance = new BoardDAO();
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();
	
	//자유게시판 - 전체
	public List<FreeBoardDTO> findFreeBoards(String selectText, String searchText) {
		Map<String, Object> params = new HashMap<>();
		params.put("selectText", selectText);
		params.put("searchText", searchText);

		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("board.findFreeBoards", params);
		}
	}

	public FreeBoardDTO findFreeBoard(String number) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("board.findFreeBoard", number);
		}
	}

	public List<FreeBorderLikesDTO> findFreeBoardLikesByUser(String id) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("board.findFreeBoardLikesByUser", id);
		}
	}

	public boolean existsFreeBoardLike(String id, String number) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("number", number);

		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.selectOne("board.existsFreeBoardLike", params);
			return count > 0;
		}
	}

	public void insertFreeBoard(FreeBoardDTO board) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("board.insertFreeBoard", board);
			if (count > 0) {
				session.commit();
			}
		}
	}

	public void updateFreeBoard(FreeBoardDTO board) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.update("board.updateFreeBoard", board);
			if (count > 0) {
				session.commit();
			}
		}
	}

	public void deleteFreeBoard(String number) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.delete("board.deleteFreeBoard", number);
			if (count > 0) {
				session.commit();
			}
		}
	}

	public void insertFreeBoardLike(String id, String number) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("number", number);

		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("board.insertFreeBoardLike", params);
			if (count > 0) {
				session.commit();
			}
		}
	}

	public void deleteFreeBoardLike(String id, String number) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("number", number);

		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.delete("board.deleteFreeBoardLike", params);
			if (count > 0) {
				session.commit();
			}
		}
	}

	public List<PrdBbsDTO> findProductReviews() {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("board.findProductReviews");
		}
	}

	public void insertProductReview(PrdBbsDTO review) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("board.insertProductReview", review);
			if (count > 0) {
				session.commit();
			}
		}
	}

	public List<StadiumBbsDTO> findStadiumQnaList() {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("board.findStadiumQnaList");
		}
	}

}
