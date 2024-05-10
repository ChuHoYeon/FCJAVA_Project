package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamBoardDTO;

public class TeamBoardWrite {
	static TeamBoardWrite teamBoardWrite = new TeamBoardWrite();
	public static TeamBoardWrite getTeamBoardWrite() {
		return teamBoardWrite;
	}
	
	public void insertTeamBoard(TeamBoardDTO teamBoard) {
		SqlSessionFactory sql = SqlDAO.getSqlSession();
		SqlSession getSql = sql.openSession();
		int i = getSql.insert("insertTeamBoard", teamBoard);
		if(i>=1) {getSql.commit();}
		getSql.close();
	}
}
