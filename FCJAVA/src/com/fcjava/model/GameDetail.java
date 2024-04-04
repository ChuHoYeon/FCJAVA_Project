package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.GameDTO;

public class GameDetail {
	static GameDetail gameDetail = new GameDetail();
	public static GameDetail getGameDetail() {
		return gameDetail;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public GameDTO getSelectGame(String gameNum) {
		GameDTO game = new GameDTO();
		game.setGame_num(Integer.parseInt(gameNum));
		
		SqlSession getSql = sql.openSession();
		game = getSql.selectOne("selectGame", game);
		getSql.close();
		
		return game;
	}
}
