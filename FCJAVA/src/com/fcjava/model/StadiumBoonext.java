package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.StadiumDTO;

public class StadiumBoonext {
	
	static StadiumBoonext nextboo = new StadiumBoonext();
	public static StadiumBoonext getStadiumBoonext() { 
		return nextboo;
	}

	  SqlSessionFactory sql = SqlDAO.getSqlSession();
	  
	    public StadiumDTO getStadiums(String str_num) {
	    SqlSession session = sql.openSession();
	    
	    StadiumDTO nextboo = new StadiumDTO();
	    nextboo.setG_no(str_num);
	    nextboo = session.selectOne("selectsta", nextboo);
	    
	    session.close();
	    return nextboo;
	    }
}