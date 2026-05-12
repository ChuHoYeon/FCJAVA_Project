package com.fcjava.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.StadiumBookingDTO;
import com.fcjava.service.StadiumService;

public class StadiumBookingAction implements Action {
	private static final StadiumBookingAction instance = new StadiumBookingAction();

	private final StadiumService stadiumService = StadiumService.getInstance();

	private StadiumBookingAction() {}

	public static StadiumBookingAction getInstance() {
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

		StadiumBookingDTO booking = new StadiumBookingDTO();
		booking.setB_ground_no(b_ground_no);
        booking.setB_team_no(b_team_no);
        booking.setB_vs_team(b_vs_team);
        booking.setB_won(b_won);
        booking.setB_date(b_date);
        booking.setB_time(b_time);

		stadiumService.bookStadium(booking);

		return "redirect:fcjava.team?page=detail&teamNumber="+b_team_no;
	}



}

