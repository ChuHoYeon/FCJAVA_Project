package com.fcjava.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.football.FootballStandingViewDTO;
import com.fcjava.service.FootballDataService;
import com.google.gson.Gson;

public class FootballDataAction implements Action {

	private static final FootballDataAction instance = new FootballDataAction();

	private FootballDataService footballDataService = FootballDataService.getInstance();

	private FootballDataAction() {};

	public static FootballDataAction getInstance() {
		return instance;
	};

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String league = request.getParameter("league");

		if (league == null || league.trim().isEmpty()) {
		    league = "PL";
		}

		List<FootballStandingViewDTO> standingList = footballDataService.getStandingList(league);

		Gson gson = new Gson();
		String json = gson.toJson(standingList);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();

		return null;
	}

}
