package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.FootballDataAction;
import com.fcjava.controller.interfaces.DBinterface;

public class IndexControll extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = null;
		
		if(pageNumber.equals("footballData")) {
			connection = FootballDataAction.getFootballDataAction();
			try {
				connection.DBconnection(request, response);
			} catch (Exception e) {
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
