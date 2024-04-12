package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.fcjava.action.GameAllSelectAction;
import com.fcjava.action.GameApplyAction;
import com.fcjava.action.GameApplyCancelAction;
import com.fcjava.action.GameDetailAction;
import com.fcjava.action.GameSearchAction;
import com.fcjava.controller.interfaces.DBinterface;

public class GameControll extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//파일1
		//어느 컨트롤러를 실행할지 정해주는 것.
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = "";

		if (pageNumber.equals("gameList")) {
			//대회 전체 리스트 불러오기
			connection = GameAllSelectAction.getGameControllSelect(); // [1] 파일2 객체 가져오기
			try {
				url = connection.DBconnection(request, response); // [10] 리턴값 담기 = [2] 파일2 메소드 실행
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher(url).forward(request, response); // [11]
		}
		else if (pageNumber.equals("gameSearch")) {
			//대회 검색
			GameSearchAction gameControll = GameSearchAction.getGameControllSearch();
			JSONArray jsonArray = null;
			try {
				jsonArray = gameControll.searchGame(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setCharacterEncoding("utf-8");
			response.getWriter().print(jsonArray.toJSONString());
		}
		else if (pageNumber.equals("2")) {
			//대회 상세정보 불러오기
			connection = GameDetailAction.getGameControllDetail();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if (pageNumber.equals("apply")) {
			//대회 신청
			connection = GameApplyAction.getGameControllApply();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect(url);
			//request.getRequestDispatcher(url).forward(request, response);
		}
		else if (pageNumber.equals("applyCancel")) {
			//대회 신청 취소
			connection = GameApplyCancelAction.getGameControllApplyCancel();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect(url);
			//request.getRequestDispatcher(url).forward(request, response);
		}
	}
}
