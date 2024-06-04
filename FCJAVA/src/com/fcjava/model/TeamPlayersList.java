package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.PlayerDTO;

public class TeamPlayersList {
	private static final TeamPlayersList teamPlayersList = new TeamPlayersList();
	private TeamPlayersList() {}
	public static TeamPlayersList getTeamPlayersList() {
		return teamPlayersList;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<PlayerDTO> getPlayerList(String teamNumber) {
		int t_num = Integer.parseInt(teamNumber);
		
		SqlSession getSql = sql.openSession();
		List<PlayerDTO> playerList = getSql.selectList("selectPlayerList", t_num);
		getSql.close();
		
		return playerList;
	}
	
}
