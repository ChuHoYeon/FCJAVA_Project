package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.PlayerDTO;

public class TeamApply {
	static TeamApply teamApply = new TeamApply();
	public static TeamApply getTeamApply() {
		return teamApply;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public void insertTeamApply(String t_num, String id, String pl_pic, String back_num, String pl_memo, String height, String weight) {
		PlayerDTO player = new PlayerDTO();
		player.setT_num(Integer.parseInt(t_num));
		player.setId(id);
		player.setPl_pic(pl_pic);
		player.setBack_num(back_num);
		if(!pl_memo.isEmpty() || !pl_memo.equals("")) {
			player.setPl_memo(pl_memo);
		}
		if(!height.isEmpty() || !height.equals("")) {
			player.setHeight(height);
		}
		if(!weight.isEmpty() || !weight.equals("")) {
			player.setWeight(weight);
		}
		System.out.println("T_num"+player.getT_num());
		System.out.println("Id"+player.getId());
		System.out.println("Pl_pic"+player.getPl_pic());
		System.out.println("Back_num"+player.getBack_num());
		System.out.println("memo"+player.getPl_memo());
		System.out.println("Height"+player.getHeight());
		System.out.println("Weight"+player.getWeight());
		
		SqlSession getSql = sql.openSession();
		
		getSql.insert("insertPlayerApply", player);
		getSql.commit();
		
		getSql.close();
	}
}
