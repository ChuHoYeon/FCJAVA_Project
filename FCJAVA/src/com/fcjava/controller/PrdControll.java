package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.PrdDetailAction;
import com.fcjava.action.PrdListAction;
import com.fcjava.action.PrdOveRideAction;
import com.fcjava.controller.interfaces.DBinterface;

public class PrdControll extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = "";

		if(pageNumber.equals("6")) {
			//쇼핑몰 등록
			connection=PrdOveRideAction.getPrdOveRide();
			try {
				url=connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);

		}
		if(pageNumber.equals("prdUniform")) {
			//쇼핑몰 리스트 불러오기 
			connection=PrdListAction.getPrdControllSelect();
			try {
				url=connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);

		}		
		
		if(pageNumber.equals("prdDetail")) {
			//쇼핑몰 상세 불러오기 
			connection=PrdDetailAction.getPrdDetailAction();
			try {
				url=connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);

		}
	}


}
