package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.PrdDTO;
import com.fcjava.model.PrdSelect;

public class PrdDetailAction implements DBinterface {
	private static final PrdDetailAction prdDetailAction = new PrdDetailAction();
	private PrdDetailAction() {}
	public static PrdDetailAction getPrdDetailAction() {
		return prdDetailAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String prdNum = request.getParameter("PrdNum");
		String url = null;
		PrdDTO prd = null;
		
		PrdSelect prdSelect = PrdSelect.getPrdSelect();
		prd = prdSelect.getOnePrd(prdNum);
		
		request.setAttribute("prd", prd);
		url = "shop_de.jsp?PrdNum="+prdNum;
		return url;
	}

}
