package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.GameApplyDTO;

public class GameApplyCancel {
	static GameApplyCancel gameApplyCancel = new GameApplyCancel();
	public static GameApplyCancel getGameApplyCancel() {
		return gameApplyCancel;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public void applyCancelGame(String game_num, String team_num) {
		SqlSession dbConnection = sql.openSession();
		
		GameApplyDTO gameApply = new GameApplyDTO();
		gameApply.setGame_num(Integer.parseInt(game_num));
		gameApply.setTeam_num(Integer.parseInt(team_num));
		
		dbConnection.delete("applyCancelGame", gameApply);
		dbConnection.commit();
		
		dbConnection.close();
	}
}
