package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.PlayerDTO;

public class TeamSecession {
	static TeamSecession teamSecession = new TeamSecession();
	public static TeamSecession getTeamSecession() {
		return teamSecession;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public void deleteTeamSecession(String t_num, String id) {
		PlayerDTO player = new PlayerDTO();
		player.setT_num(Integer.parseInt(t_num));
		player.setId(id);
		
		SqlSession getSql = sql.openSession();
		getSql.delete("deleteTeamSecession", player);
		getSql.commit();
		getSql.close();
	}
}
