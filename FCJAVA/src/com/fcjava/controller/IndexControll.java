package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.FootballDataAction;
import com.fcjava.action.IndexNewStadiumAction;
import com.fcjava.action.IndexNewTeamAction;
import com.fcjava.controller.interfaces.DBinterface;

public class IndexControll extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = null;
		
		if(pageNumber.equals("footballData")) {
			//리그 순위 api
			connection = FootballDataAction.getFootballDataAction();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		else if(pageNumber.equals("newTeamList")) {
			//인덱스 새로운팀3개
			connection = IndexNewTeamAction.getIndexNewTeamAction();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(pageNumber.equals("oneStadium")) {
			//인덱스 구장 1개
			connection = IndexNewStadiumAction.getIndexNewStadiumAction();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
