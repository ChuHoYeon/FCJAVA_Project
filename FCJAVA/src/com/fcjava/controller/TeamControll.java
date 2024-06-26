package com.fcjava.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.IndexNewTeamAction;
import com.fcjava.action.TeamApplyAction;
import com.fcjava.action.TeamApplyCheckAction;
import com.fcjava.action.TeamBoardWriteAction;
import com.fcjava.action.TeamCreateFormation;
import com.fcjava.action.TeamDetailAction;
import com.fcjava.action.TeamListAction;
import com.fcjava.action.TeamSearchAction;
import com.fcjava.action.TeamSecessionAction;
import com.fcjava.controller.interfaces.DBinterface;

public class TeamControll extends HttpServlet {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = null;
		
		if(pageNumber.equals("list")) {
			//팀 상세
			connection = TeamListAction.getTeamListAction();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(pageNumber.equals("teamSearch")) {
			//팀 검색
			TeamSearchAction teamSearchAction = TeamSearchAction.getTeamSearchAction();
			try {
				teamSearchAction.getTeamSearchList(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(pageNumber.equals("detail")) {
			//팀 상세
			connection = TeamDetailAction.getTeamDetailAction();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(pageNumber.equals("teamApplyCheck")) {
			//팀 가입확인
			TeamApplyCheckAction teamApplyCheckAction = TeamApplyCheckAction.getTeamApplyCheckAction();
			try {
				teamApplyCheckAction.goTeamApplyCheck(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(pageNumber.equals("apply")) {
			//팀 가입
			connection = TeamApplyAction.getTeamApplyAction();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(pageNumber.equals("secession")) {
			//팀 탈퇴
			connection = TeamSecessionAction.getTeamSecessionAction();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(pageNumber.equals("createFormation")) {
			//포메이션 생성
			connection = TeamCreateFormation.getTeamCreateFormation();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(pageNumber.equals("writeBoard")) {
			//팀 게시판 등록
			connection = TeamBoardWriteAction.getTeamBoardWriteAction();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(url != null) {
			request.getRequestDispatcher(url).forward(request, response);				
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		service(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		service(request,response);
	}
}
