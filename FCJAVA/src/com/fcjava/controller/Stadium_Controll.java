
package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.action.Stadium_ControllApply;
import com.fcjava.action.Stadium_Nextboo;
import com.fcjava.action.Stadium_booking;
import com.fcjava.action.Stadium_over;
import com.fcjava.controller.interfaces.DBinterface;

public class Stadium_Controll extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = "";
		
		if (pageNumber.equals("1")) {
			//구장 등록
			connection = Stadium_ControllApply.getStadium();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if (pageNumber.equals("2")) {
			//구장 리스트
			connection = Stadium_over.getStadium();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if (pageNumber.equals("3")) {
			//구장 상세 -booking
			connection = Stadium_Nextboo.getstadium();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if (pageNumber.equals("4")) {
			//구장 상세 -booking
			connection = Stadium_booking.getStadium_booking();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch blockxx`
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	
}
