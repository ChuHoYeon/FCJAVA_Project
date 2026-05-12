package com.fcjava.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.PrdDTO;
import com.fcjava.util.MyBatisUtil;

public class ProductDAO {
	private static final ProductDAO instance = new ProductDAO();
	
	private ProductDAO() {}
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();
	
	public List<PrdDTO> getSelect() {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("product.findAll");			
		}
	}

	public PrdDTO getOnePrd(String prdNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("product.onePrd", prdNum);			
		}
	}
	
	public void creatingPrd(PrdDTO prd) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("product.insertPrd",prd);
			if (count > 0) {
				session.commit();
			}
		}
	}
	
	public void deleteProduct(String prdNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("product.deletePrd",prdNum);
			if (count > 0) {
				session.commit();
			}
		}
	}

}
