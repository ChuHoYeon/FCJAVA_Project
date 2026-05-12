package com.fcjava.service;

import java.util.List;

import com.fcjava.dao.ProductDAO;
import com.fcjava.dto.ProductDTO;

public class ProductService {
	private static final ProductService instance = new ProductService();

	private final ProductDAO productDAO = ProductDAO.getInstance();

	private ProductService() {}

	public static ProductService getInstance() {
		return instance;
	}

	public List<ProductDTO> findProducts() {
		return productDAO.findAll();
	}

	public ProductDTO findProduct(String productId) {
		return productDAO.findById(productId);
	}

	public void createProduct(ProductDTO product) {
		productDAO.insertProduct(product);
	}
}
