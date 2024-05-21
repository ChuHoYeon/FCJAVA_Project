package com.fcjava.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.GameDTO;

public class GameSearch {
	
	static GameSearch gameSelect = new GameSearch();
	public static GameSearch getGameSelect() {
		return gameSelect;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<GameDTO> getGameSelect(String type, String text) {
		Map<String, Object> select = new HashMap<>();
		select.put("text", text);
		select.put("type", type);
        
		SqlSession getSql = sql.openSession(); //connection
		List<GameDTO> gameList = getSql.selectList("gameSelect", select);
		for(GameDTO game : gameList) {
			game.setGame_apply(getSql.selectOne("gameApplyCount", game.getGame_num()));
		}
		getSql.close();
		return gameList;
	}
}
