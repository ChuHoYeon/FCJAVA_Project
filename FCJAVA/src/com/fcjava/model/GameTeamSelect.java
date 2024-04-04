package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.GameApplyTeam;

public class GameTeamSelect {
	static GameTeamSelect gameTeamSelect = new GameTeamSelect();
	public static GameTeamSelect getGameTeamSelect() {
		return gameTeamSelect;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<GameApplyTeam> selectApplyTeam(String game_num) {
		GameApplyTeam gameApplyTeam = new GameApplyTeam();
		gameApplyTeam.setGame_num(Integer.parseInt(game_num));
		SqlSession getSql = sql.openSession();
		List<GameApplyTeam> applyTeamList = getSql.selectList("selectApplyTeam", gameApplyTeam);
		getSql.close();
		
		return applyTeamList;
	}
}
