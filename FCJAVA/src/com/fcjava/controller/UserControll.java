package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;

public class UserControll {
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = "";
		
		if(pageNumber.equals("1")) {
			
		}
	}

}
