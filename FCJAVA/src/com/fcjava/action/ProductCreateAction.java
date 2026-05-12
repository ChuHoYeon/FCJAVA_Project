package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.ProductDTO;
import com.fcjava.service.ProductService;

public class ProductCreateAction implements Action {
	private static final ProductCreateAction instance = new ProductCreateAction();
	
	private final ProductService productService = ProductService.getInstance();

	private ProductCreateAction() {}

	public static ProductCreateAction getInstance() {
		return instance;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productNo = request.getParameter("productNo");
		String category = request.getParameter("category");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String image = request.getParameter("image");
		String memo = request.getParameter("memo");
		String brand = request.getParameter("brand");
		
		ProductDTO product = new ProductDTO();
		product.setProductNo(Integer.parseInt(productNo));
		product.setCategory(category);
		product.setName(name);
		product.setPrice(price);
		product.setImage(image);
		product.setMemo(memo);
		product.setBrand(brand);
		
		
		productService.createProduct(product);
		
		return "redirect:fcjava.product?page=list";
	}

	
}
