package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;


public class TeamApplyCheck {
	static TeamApplyCheck teamApplyCheck = new TeamApplyCheck();
	public static TeamApplyCheck getTeamApplyCheck() {
		return teamApplyCheck;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public int applyTeamCount(String id) {
		SqlSession getSql = sql.openSession();
		int count = getSql.selectOne("countTeam", id);
		getSql.close();
		return count;
	}
}
