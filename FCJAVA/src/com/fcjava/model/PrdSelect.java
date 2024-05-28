package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;

import com.fcjava.dto.PrdDTO;


public class PrdSelect {
	private static final PrdSelect prdSelect = new PrdSelect();
	private PrdSelect() {}
	public static PrdSelect getPrdSelect() {
		return prdSelect;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<PrdDTO> getSelect() {
		SqlSession getSql = sql.openSession(); //connection
		List<PrdDTO> prdList = getSql.selectList("prdSelect");
		getSql.close();
		return prdList;
	}
	
	public PrdDTO getOnePrd(String prdNum) {
		PrdDTO prd=null;
		SqlSession getSql = sql.openSession();
		prd = getSql.selectOne("onePrd", prdNum);
		getSql.close();
		return prd;
	}
}
