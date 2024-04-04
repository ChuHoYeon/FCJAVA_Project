package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.PrdDTO;

public class PrdCreate {
	
	static PrdCreate createPrd = new PrdCreate();
	public static PrdCreate getCreatePrd( ) {
		return createPrd;
	}

	SqlSessionFactory prdDBcon=SqlDAO.getSqlSession();
	
	public void creatingPrd(String prd_no,String prd_category, String prd_name,String prd_price,String prd_image,String prd_memo,String prd_brand) {
		System.out.println("3");
		PrdDTO prd = new PrdDTO();
		prd.setPrd_no(Integer.parseInt(prd_no));
		prd.setPrd_category(prd_category);
		prd.setPrd_name(prd_name);
		prd.setPrd_price(prd_price);
		prd.setPrd_image(prd_image);
		prd.setPrd_memo(prd_memo);
		prd.setPrd_brand(prd_brand);
		
		SqlSession sql= prdDBcon.openSession();
		sql.insert("insertPrd",prd);
		sql.commit();
		sql.close();
	}
	
}
