package com.fcjava.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.GameDTO;

public class GameAllSelect {
	//����3
	static GameAllSelect gameAllSelect = new GameAllSelect(); //����3 ��ü
	public static GameAllSelect getGameAllSelect() {
		return gameAllSelect;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<GameDTO> getAllSelect() { //����3 �޼ҵ�
		SqlSession getSql = sql.openSession(); //connection
		List<GameDTO> gameList = getSql.selectList("allSelectGame"); // [5] DB�˻� �� ��� ��������
		getSql.close();
		return gameList; // [6] ������ ��� ����
	}
}
