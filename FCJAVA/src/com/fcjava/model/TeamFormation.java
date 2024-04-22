package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamFormationDTO;

public class TeamFormation {
	static TeamFormation teamFormation = new TeamFormation();
	public static TeamFormation getTeamFormation() {
		return teamFormation;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<TeamFormationDTO> getTeamFormations(String teamNumber) {
		TeamFormationDTO teamFormation = new TeamFormationDTO();
		teamFormation.setT_num(Integer.parseInt(teamNumber));
		
		SqlSession getSql = sql.openSession();
		List<TeamFormationDTO> teamFormations = getSql.selectList("selectFormations", teamFormation);
		getSql.close();
		
		return teamFormations;
	}
}
