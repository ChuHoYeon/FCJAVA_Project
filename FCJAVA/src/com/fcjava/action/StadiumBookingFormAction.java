package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.StadiumDTO;
import com.fcjava.service.StadiumService;

public class StadiumBookingFormAction implements Action{
	private static final StadiumBookingFormAction instance = new StadiumBookingFormAction();

	private final StadiumService stadiumService = StadiumService.getInstance();

	private StadiumBookingFormAction() {}

	public static StadiumBookingFormAction getInstance() {
		return instance;

	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String stadiumNumber = request.getParameter("stadiumNumber");
		String id = request.getParameter("id");

		StadiumDTO stadium = stadiumService.findStadium(stadiumNumber);
		List<StadiumDTO> teamNames = stadiumService.findTeamNames(id);

		request.setAttribute("stadium", stadium);
		request.setAttribute("teamNames", teamNames);

		return "stadiumBookingForm.jsp";
	}


}
