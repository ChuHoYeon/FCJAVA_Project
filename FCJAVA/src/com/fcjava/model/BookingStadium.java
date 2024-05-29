package com.fcjava.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.StadiumBookingDTO;

public class BookingStadium {
	static BookingStadium bookingStadium = new BookingStadium();
	public static BookingStadium getBookingStadium() {
		// TODO Auto-generated method stub
		return bookingStadium;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public void booking1(int b_ground_no, int b_team_no, int b_vs_team, String b_won, String b_date, String b_time) {
		StadiumBookingDTO goboo = new StadiumBookingDTO();
		 goboo.setB_ground_no(b_ground_no);
	        goboo.setB_team_no(b_team_no);
	        goboo.setB_vs_team(b_vs_team);
	        goboo.setB_won(b_won); 
	        goboo.setB_date(b_date);
	        goboo.setB_time(b_time);
	        
	        SqlSession session = sql.openSession();
	        session.insert("booking",goboo);
	        session.commit();
	        session.close();
	        
	}
}
