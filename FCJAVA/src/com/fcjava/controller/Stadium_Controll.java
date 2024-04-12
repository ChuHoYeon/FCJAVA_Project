package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;

public class Stadium_Controll extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = "";
		
		if (pageNumber.equals("1")) {
			//구장 등록
			System.out.println("1번 성공");
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
			System.out.println("2번 성공");
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
			System.out.println("3번 성공");
			connection = Stadium_Nextboo.getstadium();//
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
