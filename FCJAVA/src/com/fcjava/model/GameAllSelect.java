package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.GameDTO;

public class GameAllSelect {
	//파일3
	static GameAllSelect gameAllSelect = new GameAllSelect(); //파일3 객체
	public static GameAllSelect getGameAllSelect() {
		return gameAllSelect;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<GameDTO> getAllSelect() { //파일3 메소드
		SqlSession getSql = sql.openSession(); //connection
		List<GameDTO> gameList = getSql.selectList("allSelectGame"); // [5] DB검색 후 결과 가져오기
		for(GameDTO game : gameList) {
			game.setGame_apply(getSql.selectOne("gameApplyCount", game.getGame_num()));
		}
		getSql.close();
		return gameList; // [6] 가져온 결과 리턴
	}
}
