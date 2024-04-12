package com.fcjava.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.PrdDTO;
import com.fcjava.model.PrdSelect;

public class PrdControllSelect implements DBinterface {
	static PrdControllSelect prdControllSelect = new PrdControllSelect();
	public static PrdControllSelect getPrdControllSelect() {
		return prdControllSelect;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		PrdSelect prdSelect = PrdSelect.getPrdSelect();
		List<PrdDTO> prdList = prdSelect.getSelect();
		
		request.setAttribute("Prd", prdList);
		return "shop_list1.jsp";
	}

}
