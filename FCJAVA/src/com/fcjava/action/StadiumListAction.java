package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.StadiumDTO;
import com.fcjava.service.StadiumService;
	
public class StadiumListAction implements Action{
	private static final StadiumListAction instance = new StadiumListAction();

	private final StadiumService stadiumService = StadiumService.getInstance();

	private StadiumListAction() {}

	public static StadiumListAction getInstance() {
		return instance;
	}
	
	//구장 예약 
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	// 구장 리스트
	List<StadiumDTO> stadiums = stadiumService.findStadiums();
	
	request.setAttribute("stadiums", stadiums);
	
//	return "stadium_importall.jsp";
	return "stadiumList.jsp";
	}

}
