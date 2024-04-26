package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamDTO;

public class TeamList {

	static TeamList teamList = new TeamList();
	public static TeamList getTeamList() {
		return teamList;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<TeamDTO> selectTeamList() {
		SqlSession getSql = sql.openSession();
		List<TeamDTO> teamList = getSql.selectList("selectTeamList");
		getSql.close();
		
		return teamList;
	}
}
