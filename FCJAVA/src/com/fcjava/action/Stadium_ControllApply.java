package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.StadiumDTO;
import com.fcjava.service.StadiumService;

public class Stadium_ControllApply  implements Action{
	private static final Stadium_ControllApply instance = new Stadium_ControllApply();
	
	private final StadiumService stadiumService = StadiumService.getInstance();

	private Stadium_ControllApply() {}

	public static Stadium_ControllApply getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//구장 등록 컨트롤러 - stadium_import
		String g_no = request.getParameter("no");
		String gmem_id = request.getParameter("id");
		String g_name = request.getParameter("name");
		String g_time = request.getParameter("time");
		String g_size = request.getParameter("size");
		String g_add = request.getParameter("add");
		String g_memo = request.getParameter("memo");
		String g_img = "hi";
		
		StadiumDTO stadium = new StadiumDTO();
		stadium.setG_no(g_no);
		stadium.setGmem_id(gmem_id);
		stadium.setG_name(g_name);
		stadium.setG_time(g_time);
		stadium.setG_size(g_size);
		stadium.setG_add(g_add);
		stadium.setG_memo(g_memo);
		stadium.setG_img(g_img);
		
		stadiumService.createStadium(stadium);
		
		return "redirect:aa.stadium1?page=2";
	}


}
