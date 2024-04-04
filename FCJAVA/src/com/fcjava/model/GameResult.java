package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.GameResultDTO;


public class GameResult {
	static GameResult gameResult = new GameResult();
	public static GameResult getGameResult() {
		return gameResult;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<GameResultDTO> GameResultList(String gameNum) {
		SqlSession dbConnection = sql.openSession();
		
		List<GameResultDTO> gameResultList = dbConnection.selectList("getGameResult", gameNum);
		dbConnection.close();
		
		return gameResultList;
	}
}
