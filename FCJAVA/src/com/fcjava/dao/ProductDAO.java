package com.fcjava.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.ProductDTO;
import com.fcjava.util.MyBatisUtil;

public class ProductDAO {
	private static final ProductDAO instance = new ProductDAO();

	private ProductDAO() {}

	public static ProductDAO getInstance() {
		return instance;
	}

	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();

	public List<ProductDTO> findAll() {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("product.findAll");
		}
	}

	public ProductDTO findById(String productId) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("product.findById", productId);
		}
	}

	public void insertProduct(ProductDTO product) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("product.insertProduct", product);
			if (count > 0) {
				session.commit();
			}
		}
	}

	public void deleteProduct(String productId) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.delete("product.deleteProduct", productId);
			if (count > 0) {
				session.commit();
			}
		}
	}

}
