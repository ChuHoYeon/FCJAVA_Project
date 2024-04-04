package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.GameApplyDTO;

public class GameApply {
	
	static GameApply applyGame = new GameApply();
	public static GameApply getApplyGame() {
		return applyGame;
	}
		
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public void applyGame(String team_num, String game_num) {
		SqlSession dbConnection = sql.openSession();
		
		GameApplyDTO gameApply = new GameApplyDTO();
		gameApply.setGame_num(Integer.parseInt(game_num));
		gameApply.setTeam_num(Integer.parseInt(team_num));
		dbConnection.insert("applyGame", gameApply);
		dbConnection.commit();
		
		dbConnection.close();
	}
}
