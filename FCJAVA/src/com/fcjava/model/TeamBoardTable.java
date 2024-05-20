package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;

public class TeamBoardTable {
	static TeamBoardTable teamBoardTable = new TeamBoardTable();
	public static TeamBoardTable getTeamBoardTable() {
		return teamBoardTable;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public void createTeamBoardTable(String t_num) {
		SqlSession getSql = sql.openSession();
		getSql.update("createTeamBoardTable", Integer.parseInt(t_num));
		getSql.commit();
		getSql.close();
	}
}
