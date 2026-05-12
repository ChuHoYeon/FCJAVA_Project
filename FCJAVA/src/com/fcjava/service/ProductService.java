package com.fcjava.service;

import java.util.List;

import com.fcjava.dao.ProductDAO;
import com.fcjava.dto.PrdDTO;

public class ProductService {
	private static final ProductService instance = new ProductService();

	private final ProductDAO productDAO = ProductDAO.getInstance();

	private ProductService() {}

	public static ProductService getInstance() {
		return instance;
	}

	public List<PrdDTO> findProducts() {
		return productDAO.getSelect();
	}

	public PrdDTO findProduct(String prdNum) {
		return productDAO.getOnePrd(prdNum);
	}

	public void createProduct(PrdDTO product) {
		productDAO.creatingPrd(product);
	}
}
