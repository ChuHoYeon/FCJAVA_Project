package com.fcjava.dto;

import java.util.Date;

public class StadiumBookingDTO {
    int booking_no; // 예약번호
    public int getBooking_no() {
		return booking_no;
	}
	public void setBooking_no(int booking_no) {
		this.booking_no = booking_no;
	}
	public int getB_ground_no() {
		return b_ground_no;
	}
	public void setB_ground_no(int b_ground_no) {
		this.b_ground_no = b_ground_no;
	}
	public int getB_team_no() {
		return b_team_no;
	}
	public void setB_team_no(int b_team_no) {
		this.b_team_no = b_team_no;
	}
	public Date getB_bk_time() {
		return b_bk_time;
	}
	public void setB_bk_time(Date b_bk_time) {
		this.b_bk_time = b_bk_time;
	}
	public int getB_vs_team() {
		return b_vs_team;
	}
	public void setB_vs_team(int b_vs_team) {
		this.b_vs_team = b_vs_team;
	}
	public String getB_won() {
		return b_won;
	}
	public void setB_won(String b_won) {
		this.b_won = b_won;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_time() {
		return b_time;
	}
	public void setB_time(String b_time) {
		this.b_time = b_time;
	}
	int b_ground_no; // 구장번호
    int b_team_no; // 팀번호 
    Date b_bk_time; // 예약확정 시간
    int b_vs_team; // 친선경기 여부
    String b_won; // 예약금액
    String b_date; // 예약 날짜(이용 날짜)
    String b_time; // 예약시간 (사용시간)

}
