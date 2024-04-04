package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.StadiumDTO;

public class StadiumCreate {
	
	static StadiumCreate createStadium = new StadiumCreate();
	public static StadiumCreate getcreateStadium() {
		return createStadium;
	}


	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public void createStadium(String g_no, String gmem_id, String g_name, String g_time, String g_size, String g_add, String g_memo, String g_img) {
		System.out.println("3");
		System.out.println(g_no);
		System.out.println(gmem_id);
		System.out.println(g_name);
		System.out.println(g_time);
		System.out.println(g_size);
		System.out.println(g_add);
		System.out.println(g_memo);
		System.out.println(g_img);
		StadiumDTO stadium = new StadiumDTO();
		stadium.setG_no(g_no);
		stadium.setGmem_id(gmem_id);
		stadium.setG_name(g_name);
		stadium.setG_time(g_time);
		stadium.setG_size(g_size);
		stadium.setG_add(g_add);
		stadium.setG_memo(g_memo);
		stadium.setG_img(g_img);
		SqlSession stadiumA =sql.openSession();
		
		stadiumA.insert("str_insert", stadium);
		stadiumA.commit();
		
		stadiumA.close();
	}
	
}
	