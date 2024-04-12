package com.fcjava.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.PrdDTO;
import com.fcjava.model.PrdSelect;

public class PrdDeControll implements DBinterface {
	static PrdDeControll prdDeControll = new PrdDeControll();
	public static PrdDeControll getPrdDeControll() {
		return prdDeControll;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String prdNum = request.getParameter("PrdNum");
		PrdSelect prdSelect = PrdSelect.getPrdSelect();
		List<PrdDTO> prdList = prdSelect.getSelect();
		
		request.setAttribute("Prd", prdList);
		return "shop_de.jsp?PrdNum="+prdNum;
	}

}
