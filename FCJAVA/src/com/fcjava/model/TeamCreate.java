package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamDTO;

public class TeamCreate {
	
	static TeamCreate createTeam = new TeamCreate();
	public static TeamCreate getCreateTeam() {
		return createTeam;
	}
	
	SqlSessionFactory teamDBcon = SqlDAO.getSqlSession();
	
	public void creatingTeam(String id, String name, String logo, String city, String week, String info, String maxNum, String skill, String sns, String age) {
		System.out.println("3번");
		TeamDTO team = new TeamDTO();
		team.setId(id);
		team.setName(name);
		team.setLogo(logo);
		team.setCity(city);
		team.setTime(week);
		team.setInfo(info);
		team.setMaxNum(Integer.parseInt(maxNum));
		team.setSkill(skill);
		team.setSns(sns);
		team.setAge(age);
		SqlSession sql = teamDBcon.openSession();
		/*
		 * sql.insert("insertTeam", team); sql.commit();
		 */
		sql.close();
	}
}
