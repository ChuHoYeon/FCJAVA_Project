package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamScheduleDTO;

public class TeamSchedule {
	private static final TeamSchedule teamSchedule = new TeamSchedule();
	private TeamSchedule() {}
	public static TeamSchedule getTeamSchedule() {
		return teamSchedule;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<TeamScheduleDTO> getScheduleList(String teamNumber) {
		List<TeamScheduleDTO> teamScheduleList = null;
		SqlSession getSql = sql.openSession();
		teamScheduleList = getSql.selectList("selectScheduleList", teamNumber);
		getSql.close();
		return teamScheduleList;
	}
}
