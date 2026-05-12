package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.StadiumBookingDTO;
import com.fcjava.service.StadiumService;

public class Stadium_booking implements Action {
	private static final Stadium_booking instance = new Stadium_booking();

	private final StadiumService stadiumService = StadiumService.getInstance();
	
	private Stadium_booking() {}
	
	public static Stadium_booking getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int b_team_no = Integer.parseInt(request.getParameter("t_num"));
		int b_ground_no = Integer.parseInt(request.getParameter("b_ground_no"));
		String b_won = request.getParameter("b_won");
		String b_date = request.getParameter("b_date");
		String b_time = request.getParameter("b_time");
		int b_vs_team = Integer.parseInt(request.getParameter("ck_vs"));
		
		StadiumBookingDTO goboo = new StadiumBookingDTO();
	 	goboo.setB_ground_no(b_ground_no);
        goboo.setB_team_no(b_team_no);
        goboo.setB_vs_team(b_vs_team);
        goboo.setB_won(b_won); 
        goboo.setB_date(b_date);
        goboo.setB_time(b_time);
		
		stadiumService.bookStadium(goboo);
		
		return "redirect:fcjava.team?page=detail&teamNumber="+b_team_no;  
	}	
	
	

}
 
