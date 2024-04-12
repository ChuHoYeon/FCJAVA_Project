package com.fcjava.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fcjava.controller.interfaces.DBinterface;
import com.fcjava.dto.GameDTO;
import com.fcjava.model.GameAllSelect;

public class GameAllSelectAction implements DBinterface {
	//파일2
	static GameAllSelectAction gameControllAllSelect = new GameAllSelectAction(); //파일2 객체
	public static GameAllSelectAction getGameControllSelect() {
		return gameControllAllSelect;
	}

	@Override
	public String DBconnection(HttpServletRequest request, HttpServletResponse response) throws Exception { //파일2 메소드
		// TODO Auto-generated method stub
		GameAllSelect gameAllSelect = GameAllSelect.getGameAllSelect(); // [3] 파일3 객체 가져오기
		List<GameDTO> gameList = gameAllSelect.getAllSelect(); // [7] 리턴값 담기 = [4] 파일3 메소드 실행 
		
		request.setAttribute("Games", gameList); // [8] 
		return "gameList.jsp"; //[9]
	}

}
