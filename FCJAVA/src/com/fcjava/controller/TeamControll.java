package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;

public class TeamControll extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = "";
		
		if(pageNumber.equals("1")) {
			System.out.println("1번");
			connection = TeamControllCreate.getTeamControllCreate();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect(url);
		}
	}
}
