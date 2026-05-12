package com.fcjava.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.dto.StadiumDTO;
import com.fcjava.service.StadiumService;
import com.google.gson.Gson;

public class IndexNewStadiumAction implements Action{
	private static final IndexNewStadiumAction instance = new IndexNewStadiumAction();

	private final StadiumService stadiumService = StadiumService.getInstance();

	private IndexNewStadiumAction() {};
	public static IndexNewStadiumAction getInstance() {
		return instance;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		StadiumDTO stadium = stadiumService.findNewStadiumOne();
		if(stadium != null) {
			response.setCharacterEncoding("UTF-8");
			String jsonStadium = new Gson().toJson(stadium);
	        PrintWriter out = response.getWriter();
	        out.println(jsonStadium);
		}
		return null;
	}

}
