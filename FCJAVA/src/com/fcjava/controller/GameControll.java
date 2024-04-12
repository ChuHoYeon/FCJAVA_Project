package com.fcjava.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.fcjava.controller.interfaces.DBinterface;

public class GameControll extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//파일1
		//어느 컨트롤러를 실행할지 정해주는 것.
		String pageNumber = request.getParameter("page");
		DBinterface connection;
		String url = "";

		if (pageNumber.equals("gameList")) {
			//��ȸ ��ü ����Ʈ �ҷ�����
			connection = GameControllAllSelect.getGameControllSelect(); // [1] ����2 ��ü ��������
			try {
				url = connection.DBconnection(request, response); // [10] ���ϰ� ��� = [2] ����2 �޼ҵ� ����
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher(url).forward(request, response); // [11]
		}
		else if (pageNumber.equals("gameSearch")) {
			//��ȸ �˻�
			GameControllSearch gameControll = GameControllSearch.getGameControllSearch();
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
			//��ȸ ������ �ҷ�����
			connection = GameControllDetail.getGameControllDetail();
			try {
				url = connection.DBconnection(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.getRequestDispatcher(url).forward(request, response);
		}
		else if (pageNumber.equals("apply")) {
			//��ȸ ��û
			connection = GameControllApply.getGameControllApply();
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
			//��ȸ ��û ���
			connection = GameControllApplyCancel.getGameControllApplyCancel();
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
