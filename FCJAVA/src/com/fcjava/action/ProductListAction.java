package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.ProductDTO;
import com.fcjava.service.ProductService;

public class ProductListAction implements Action {
	private static final ProductListAction instance = new ProductListAction();

	private final ProductService productService = ProductService.getInstance();

	private ProductListAction() {}

	public static ProductListAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<ProductDTO> productList = productService.findProducts();
		
		request.setAttribute("products", productList);
		return "productList.jsp";
	}

}
