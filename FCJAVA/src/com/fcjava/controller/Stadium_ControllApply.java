package com.fcjava.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.model.StadiumCreate;

public class Stadium_ControllApply  implements DBinterface{
	
	static Stadium_ControllApply gameControllApply = new Stadium_ControllApply();
	public static Stadium_ControllApply getStadium() {
		return gameControllApply;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//구장 등록
		StadiumCreate sta = StadiumCreate.getcreateStadium();
		String g_no = request.getParameter("no");
		String gmem_id = request.getParameter("id");
		String g_name = request.getParameter("name");
		String g_time = request.getParameter("time");
		String g_size = request.getParameter("size");
		String g_add = request.getParameter("add");
		String g_memo = request.getParameter("memo");
		String g_img = "hi";
		System.out.println("value"+g_memo);
		sta.createStadium(g_no, gmem_id, g_name, g_time, g_size, g_add, g_memo, g_img);
		return "aa.stadium1?page=2";
	}


}
