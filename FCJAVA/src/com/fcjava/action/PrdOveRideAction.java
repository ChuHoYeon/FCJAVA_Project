package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.model.PrdCreate;

public class PrdOveRideAction implements DBinterface {
	
	static PrdOveRideAction prdOveRide = new PrdOveRideAction();
	public static PrdOveRideAction getPrdOveRide() {
		return prdOveRide;
	}
	
	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String prd_no = request.getParameter("prd_no");
		String prd_category=request.getParameter("prd_category");
		String prd_name=request.getParameter("prd_name");
		String prd_price=request.getParameter("prd_price");
		String prd_image=request.getParameter("prd_image");
		String prd_memo=request.getParameter("prd_price");
		String prd_brand=request.getParameter("prd_brand");
		
		PrdCreate prdCreate=PrdCreate.getCreatePrd();
		prdCreate.creatingPrd(prd_no, prd_category, prd_name, prd_price, prd_image, prd_memo, prd_brand);
		
		
		return "shop_list1.jsp";
	}

	
}
