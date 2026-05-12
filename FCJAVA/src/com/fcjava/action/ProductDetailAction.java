package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.ProductDTO;
import com.fcjava.service.ProductService;

public class ProductDetailAction implements Action {
	private static final ProductDetailAction instance = new ProductDetailAction();

	private final ProductService productService = ProductService.getInstance();

	private ProductDetailAction() {}

	public static ProductDetailAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		String url = null;

		ProductDTO product = productService.findProduct(productId);

		request.setAttribute("product", product);
		url = "productDetail.jsp?productId="+productId;
		return url;
	}

}
