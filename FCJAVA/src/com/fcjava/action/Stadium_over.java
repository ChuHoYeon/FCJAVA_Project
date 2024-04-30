	package com.fcjava.action;
	
	import java.util.List;
	
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import com.fcjava.controller.interfaces.DBinterface;
	import com.fcjava.dto.StadiumDTO;
	import com.fcjava.model.StadiumCreatein;
	
	public class Stadium_over implements DBinterface{
		static Stadium_over stadiumselect = new Stadium_over();
		public static Stadium_over getStadium() {
			return stadiumselect;
		}
		
		@Override
		//구장 예약 
		public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
			// TODO Auto-generated method stub
			// 구장 리스트
			StadiumCreatein sta1 = StadiumCreatein.getcreateStadium1();
			List<StadiumDTO> stadiums = sta1.Stadiumin(); 
			request.setAttribute("stadiums", stadiums); 
//	        return "stadium_importall.jsp";
			 return "stadium_sv.jsp";
		}

	}
