package com.fcjava.action;

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
//
	@Override
	//booking.jsp
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String str_num=request.getParameter("sta_num");
		StadiumBoonext boo1 = StadiumBoonext.getStadiumBoonext();
		StadiumDTO stadium = boo1.getStadiums(str_num);
		request.setAttribute("stadium", stadium);
		return "stadium_booking.jsp";  
	}
	

}
