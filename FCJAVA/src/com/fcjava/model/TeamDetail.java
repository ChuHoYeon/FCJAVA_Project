package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamDTO;

public class TeamDetail {
	static TeamDetail teamDetail = new TeamDetail();
	public static TeamDetail getTeamDetail() {
		return teamDetail;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public TeamDTO getTeam(String t_num) {
		TeamDTO team = new TeamDTO();
		team.setT_num(Integer.parseInt(t_num));
		
		SqlSession getSql = sql.openSession();
		team = getSql.selectOne("selectTeam", team);
		getSql.close();
		
		return team;
	}
}
