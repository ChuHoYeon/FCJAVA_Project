package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamDTO;

public class MyTeamList {
	private static final MyTeamList myTeamList = new MyTeamList();
	private MyTeamList() {}
	public static MyTeamList getMyTeamList() {
		return myTeamList;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<TeamDTO> refrashMyTeamList(String id) {
		List<TeamDTO> myTeamList = null;
		SqlSession getSql = sql.openSession();
		myTeamList = getSql.selectList("refrashMyTeamList", id);
		getSql.close();
		return myTeamList;
	}
}
