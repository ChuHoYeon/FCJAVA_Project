package com.fcjava.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.GameDTO;
import com.fcjava.model.GameAllSelect;

public class GameControllAllSelect implements DBinterface {
	//����2
	static GameControllAllSelect gameControllAllSelect = new GameControllAllSelect(); //����2 ��ü
	public static GameControllAllSelect getGameControllSelect() {
		return gameControllAllSelect;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception { //����2 �޼ҵ�
		// TODO Auto-generated method stub
		GameAllSelect gameAllSelect = GameAllSelect.getGameAllSelect(); // [3] ����3 ��ü ��������
		List<GameDTO> gameList = gameAllSelect.getAllSelect(); // [7] ���ϰ� ��� = [4] ����3 �޼ҵ� ���� 
		
		request.setAttribute("Games", gameList); // [8] 
		return "gameList.jsp"; //[9]
	}

}
