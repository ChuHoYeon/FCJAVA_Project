package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamGameResultDTO;

public class TeamGameResult {
	static TeamGameResult teamGameResult = new TeamGameResult();
	public static TeamGameResult getTeamGameResult() {
		return teamGameResult;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<TeamGameResultDTO> getTeamGameAllResult(String teamNumber) {
		SqlSession getSql = sql.openSession();
		List<TeamGameResultDTO> teamGameResultList = getSql.selectList("selectTeamGameAllResult", teamNumber);
		getSql.close();
		
		return teamGameResultList;
	}
}
