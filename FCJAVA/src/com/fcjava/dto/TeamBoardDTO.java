package com.fcjava.dto;

import java.util.Date;

public class TeamBoardDTO {
	
	private int t_num;
	private int board_num;
	private String board_id;
	private String board_title;
	private String board_content;
	private String board_file;
	private int board_readcount;
	private Date board_createdate;
	private Date board_lastupdate;
	
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public Date getBoard_createdate() {
		return board_createdate;
	}
	public void setBoard_createdate(Date board_createdate) {
		this.board_createdate = board_createdate;
	}
	public Date getBoard_lastupdate() {
		return board_lastupdate;
	}
	public void setBoard_lastupdate(Date board_lastupdate) {
		this.board_lastupdate = board_lastupdate;
	}
	
}
