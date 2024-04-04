package com.fcjava.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.model.TeamCreate;

public class TeamControllCreate implements DBinterface {
	static TeamControllCreate teamControllCreate = new TeamControllCreate();
	public static TeamControllCreate getTeamControllCreate() {
		return teamControllCreate;
	}
	
	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("2번");
		String id = request.getParameter("id");
		System.out.println(id);
		String name = request.getParameter("teamName");
		String logo = "img";
		String city = request.getParameter("city");
		String week = "";
		String[] weeks = request.getParameterValues("week");
		for(String str : weeks) {
			week = week + str;
		}
		String info = request.getParameter("teamInfo");
		String maxNum = request.getParameter("maxNum");
		String skill = request.getParameter("skill");
		String sns = request.getParameter("teamSns");
		String age = request.getParameter("age");
		TeamCreate teamCreate = TeamCreate.getCreateTeam();
		
		teamCreate.creatingTeam(id, name, logo, city, week, info, maxNum, skill, sns, age);
		
		return "teamlist.jsp";
	}
	
	
}
