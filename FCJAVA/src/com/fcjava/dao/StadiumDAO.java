package com.fcjava.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.StadiumBookingDTO;
import com.fcjava.dto.StadiumDTO;
import com.fcjava.util.MyBatisUtil;

public class StadiumDAO {
	private static final StadiumDAO instance = new StadiumDAO();
	
	private StadiumDAO() {}
	
	public static StadiumDAO getInstance() {
		return instance;
	}
	
	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();
	
    public List<StadiumDTO> getStadiumList() {
    	try (SqlSession session = sqlSessionFactory.openSession()) {
    		return session.selectList("stadium.sta_select");
    	}
	}
    
    public List<StadiumDTO> getTeamName(String id) {
    	StadiumDTO t_name2 = new StadiumDTO();
    	t_name2.setId(id);
    	try (SqlSession session = sqlSessionFactory.openSession()) {
    		return session.selectList("stadium.selecteam_name", t_name2);    		
    	}
    }
    
    public StadiumDTO getNewStadiumOne() {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("stadium.randomStadium");
		}
	}
    
	public StadiumDTO getStadiums(String str_num) {
		StadiumDTO nextboo = new StadiumDTO();
		nextboo.setG_no(str_num);
		try (SqlSession session = sqlSessionFactory.openSession()) {
			nextboo = session.selectOne("stadium.selectsta", nextboo);			
		}
	    
	    return nextboo;
    }
    
	public void booking1(StadiumBookingDTO goboo) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
        	int count = session.insert("stadium.booking",goboo);
        	if (count > 0) {
        		session.commit();
        	}
        }
	}
    
    public void createStadium(StadiumDTO stadium) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("stadium.str_insert", stadium);
			if (count > 0) {
				session.commit();
			}
		}
	}

}
