package com.fcjava.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.StadiumDTO;
import com.fcjava.model.StadiumNewOne;
import com.google.gson.Gson;

public class IndexNewStadiumAction implements DBinterface{
	private static final IndexNewStadiumAction indexNewStadiumAction = new IndexNewStadiumAction();
	private IndexNewStadiumAction() {};
	public static IndexNewStadiumAction getIndexNewStadiumAction() {
		return indexNewStadiumAction;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		StadiumDTO stadium = null;
		StadiumNewOne stadiumNewOne = StadiumNewOne.getStadiumNewOne();
		stadium = stadiumNewOne.getNewStadiumOne();
		if(stadium != null) {
			response.setCharacterEncoding("UTF-8");
			String jsonStadium = new Gson().toJson(stadium);
	        PrintWriter out = response.getWriter();
	        out.println(jsonStadium);
		}
		return null;
	}

}
