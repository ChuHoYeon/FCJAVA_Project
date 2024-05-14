package com.fcjava.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamBoardDTO;

public class TeamBoard {
	static TeamBoard teamBoard = new TeamBoard();
	public static TeamBoard getTeamBoard() {
		return teamBoard;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public int getBoardCount(String teamNumber) {
		int count = 0;
		SqlSession getSql = sql.openSession();
		count = getSql.selectOne("teamBoardCount", teamNumber);
		getSql.close();
		return count;
	}
	
	public List<TeamBoardDTO> getBoardList(String t_num,int page, int limit) {
		List<TeamBoardDTO> teamBoardList = null;
		Map<String, Object> params = new HashMap<>();
		int startrow=(page-1)*limit; 
		params.put("t_num", t_num);
		params.put("startrow", startrow);
		params.put("endrow", limit);
		SqlSession getSql = sql.openSession();
		teamBoardList = getSql.selectList("selectTeamBoardList", params);
		getSql.close();
		
		return teamBoardList;
	}
}
