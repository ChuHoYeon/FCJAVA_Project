package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.PrdDTO;
import com.fcjava.service.ProductService;

public class PrdOveRideAction implements Action {
	private static final PrdOveRideAction instance = new PrdOveRideAction();
	
	private final ProductService productService = ProductService.getInstance();

	private PrdOveRideAction() {}

	public static PrdOveRideAction getInstance() {
		return instance;
	}
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String prd_no = request.getParameter("prd_no");
		String prd_category=request.getParameter("prd_category");
		String prd_name=request.getParameter("prd_name");
		String prd_price=request.getParameter("prd_price");
		String prd_image=request.getParameter("prd_image");
		String prd_memo=request.getParameter("prd_price");
		String prd_brand=request.getParameter("prd_brand");
		
		PrdDTO product = new PrdDTO();
		product.setPrd_no(Integer.parseInt(prd_no));
		product.setPrd_category(prd_category);
		product.setPrd_name(prd_name);
		product.setPrd_price(prd_price);
		product.setPrd_image(prd_image);
		product.setPrd_memo(prd_memo);
		product.setPrd_brand(prd_brand);
		
		
		productService.createProduct(product);
		
		return "shop_list1.jsp";
	}

	
}
