package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.StadiumDTO;

public class StadiumNewOne {
	private static final StadiumNewOne stadiumNewOne = new StadiumNewOne();
	private StadiumNewOne() {}
	
	public static StadiumNewOne getStadiumNewOne() {
		return stadiumNewOne;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public StadiumDTO getNewStadiumOne() {
		StadiumDTO stadium = null;
		SqlSession db = sql.openSession();
		stadium = db.selectOne("randomStadium");
		db.close();
		return stadium;
	}
}
