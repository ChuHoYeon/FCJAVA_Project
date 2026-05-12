package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.PrdDTO;
import com.fcjava.service.ProductService;

public class PrdDetailAction implements Action {
	private static final PrdDetailAction instance = new PrdDetailAction();

	private final ProductService productService = ProductService.getInstance();

	private PrdDetailAction() {}

	public static PrdDetailAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String prdNum = request.getParameter("PrdNum");
		String url = null;
		
		PrdDTO prd = productService.findProduct(prdNum);
		
		request.setAttribute("prd", prd);
		url = "shop_de.jsp?PrdNum="+prdNum;
		return url;
	}

}
