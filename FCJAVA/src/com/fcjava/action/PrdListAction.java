package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.PrdDTO;
import com.fcjava.service.ProductService;

public class PrdListAction implements Action {
	private static final PrdListAction instance = new PrdListAction();

	private final ProductService productService = ProductService.getInstance();

	private PrdListAction() {}

	public static PrdListAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<PrdDTO> prdList = productService.findProducts();
		
		request.setAttribute("Prd", prdList);
		return "shop_list1.jsp";
	}

}
