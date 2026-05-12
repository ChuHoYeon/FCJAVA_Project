package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.StadiumDTO;
import com.fcjava.service.StadiumService;

public class Stadium_Nextboo implements Action{
	private static final Stadium_Nextboo instance = new Stadium_Nextboo();

	private final StadiumService stadiumService = StadiumService.getInstance();
	
	private Stadium_Nextboo() {}
	
	public static Stadium_Nextboo getInstance() {
		return instance;
		
	} 

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String str_num = request.getParameter("sta_num");
		String id = request.getParameter("id");
		
		StadiumDTO stadium = stadiumService.findStadium(str_num);
		List<StadiumDTO> team_name = stadiumService.findTeamNames(id);
		
		request.setAttribute("stadium", stadium);
		request.setAttribute("team_name", team_name);
		
		return "stadium_booking.jsp";  
	}
	

}
