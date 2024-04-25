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
	
	//포메이션이름 중복체크
	public boolean isFormationName(int t_num, String formation_name) {
		boolean check = false;
		TeamFormationDTO formation = new TeamFormationDTO();
		formation.setT_num(t_num);
		formation.setFormation_name(formation_name);
		
		SqlSession getSql = sql.openSession();
		List<TeamFormationDTO> formationList = getSql.selectList("isFormationName", formation);
		if(formationList.isEmpty()) {
			check = true;
		}
		getSql.close();
		
		return check;
	}
	//포메이션 생성
	public void createFormation(int t_num,String formation, String foramtion_name, String[] player_id) {
		SqlSession getSql = sql.openSession();
		for(int i=0; i<11; i++) {
			TeamFormationDTO teamForamtion = new TeamFormationDTO();
			teamForamtion.setT_num(t_num);
			teamForamtion.setFormation(formation);
			teamForamtion.setFormation_name(foramtion_name);
			teamForamtion.setPosition_num(i+1);
			teamForamtion.setPlayer_id(player_id[i]);
			getSql.insert("createFormation", teamForamtion);
		}
		getSql.commit();
		getSql.close();
	}
	//팀의 전체 포메이션 불러오기
	public List<TeamFormationDTO> getTeamFormations(String teamNumber) {
		TeamFormationDTO teamFormation = new TeamFormationDTO();
		teamFormation.setT_num(Integer.parseInt(teamNumber));
		
		SqlSession getSql = sql.openSession();
		List<TeamFormationDTO> teamFormations = getSql.selectList("selectFormations", teamFormation);
		getSql.close();
		
		return teamFormations;
	}
}
