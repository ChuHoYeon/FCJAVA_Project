package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.StadiumDTO;
import com.fcjava.model.StadiumBoonext;

public class Stadium_Nextboo implements DBinterface{
	static Stadium_Nextboo sta_nextboo = new Stadium_Nextboo();
	public static Stadium_Nextboo getstadium() {
		return sta_nextboo;
		
	} 

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String str_num=request.getParameter("sta_num");
		String id=request.getParameter("id");
		StadiumBoonext boo1 = StadiumBoonext.getStadiumBoonext();
		
		StadiumDTO stadium = boo1.getStadiums(str_num);
		List<StadiumDTO> team_name = boo1.getTeamName(id);
		request.setAttribute("stadium", stadium);
		request.setAttribute("team_name", team_name);
		return "stadium_booking.jsp";  
	}
	

}
