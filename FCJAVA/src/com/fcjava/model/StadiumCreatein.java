package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.StadiumDTO;

public class StadiumCreatein {
	
	static StadiumCreatein createStadium1 = new StadiumCreatein();
	public static StadiumCreatein getcreateStadium1() {
		return createStadium1;
	}


	SqlSessionFactory sql = SqlDAO.getSqlSession();

	public List<StadiumDTO> Stadiumin() {
		// TODO Auto-generated method stub 
		SqlSession session = sql.openSession();
		List<StadiumDTO> staList = session.selectList("sta_select");
		session.close();
		return staList;
	}
}
	