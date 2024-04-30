package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.StadiumBookingDTO;
import com.fcjava.dto.StadiumDTO;
import com.fcjava.model.BookingStadium;
import com.fcjava.model.StadiumBoonext;

public class Stadium_booking implements DBinterface {
	static Stadium_booking stadium_booking = new Stadium_booking();
	public static Stadium_booking getStadium_booking() {
		return stadium_booking;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int b_team_no = Integer.parseInt(request.getParameter("t_num"));
		int b_ground_no = Integer.parseInt(request.getParameter("b_ground_no"));
		String b_won = request.getParameter("b_won");
		String b_date = request.getParameter("b_date");
		String b_time = request.getParameter("b_time");
		int b_vs_team = Integer.parseInt(request.getParameter("ck_vs"));
		
		BookingStadium bk1 = BookingStadium.getBookingStadium();
		bk1.booking1(b_ground_no, b_team_no,b_vs_team,b_won,b_date,b_time);
		
		return "fcjava.team?page=detail&teamNumber="+b_team_no;  
	}	
	
	

}
 