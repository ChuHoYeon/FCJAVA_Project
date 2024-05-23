package com.fcjava.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;

public class FootballDataAction implements DBinterface {
	private static final FootballDataAction footballDataAction = new FootballDataAction();
	private FootballDataAction() {};
	public static FootballDataAction getFootballDataAction() {
		return footballDataAction;
	};

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String league = request.getParameter("league");
		String apiUrl = "http://api.football-data.org/v4/competitions/"+league+"/standings";
		String apiKey = "08c6346796f3425192dcf8961f2aa2e7";
		URL url = new URL(apiUrl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("X-Auth-Token", apiKey);
		int responseCode = conn.getResponseCode();
		response.setContentType("application/json");	
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		if (responseCode == HttpURLConnection.HTTP_OK) {
			BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String inputLine;
			StringBuilder plData = new StringBuilder();
			while ((inputLine = in.readLine()) != null) {
				plData.append(inputLine);
			}
			in.close();
			out.println(plData);
		} else {
			out.println("API 호출 실패: " + responseCode);
		}
		return null;
	}

}
