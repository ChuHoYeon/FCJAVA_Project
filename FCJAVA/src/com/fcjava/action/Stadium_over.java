package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.StadiumDTO;
import com.fcjava.service.StadiumService;
	
public class Stadium_over implements Action{
	private static final Stadium_over instance = new Stadium_over();

	private final StadiumService stadiumService = StadiumService.getInstance();

	private Stadium_over() {}

	public static Stadium_over getInstance() {
		return instance;
	}
	
	//구장 예약 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// 구장 리스트
	List<StadiumDTO> stadiums = stadiumService.findStadiums();
	
	request.setAttribute("stadiums", stadiums);
	
//	return "stadium_importall.jsp";
	return "stadium_sv.jsp";
	}

}
