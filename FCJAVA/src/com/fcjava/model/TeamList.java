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
	
	public List<TeamDTO> selectTeamList() { //팀 전체 리스트
		SqlSession getSql = sql.openSession();
		List<TeamDTO> teamList = getSql.selectList("selectTeamList");
		getSql.close();
		
		return teamList;
	}
	
	public List<TeamDTO> indexTeamList() { //인덱스용 팀3개 리스트
		SqlSession getSql = sql.openSession();
		List<TeamDTO> indexteamList = getSql.selectList("indexTeamList");
		getSql.close();
		
		return indexteamList;
	}
}
