package com.fcjava.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.GameApplyDTO;
import com.fcjava.dto.GameApplyTeamDTO;
import com.fcjava.dto.GameDTO;
import com.fcjava.dto.GameResultDTO;
import com.fcjava.util.MyBatisUtil;

public class GameDAO {
	private static final GameDAO instance = new GameDAO();
	
	private GameDAO() {}
	
	public static GameDAO getInstance() {
		return instance;
	}
	
	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();
	
	public List<GameDTO> getAllSelect() {
		List<GameDTO> gameList = null;
		try (SqlSession session = sqlSessionFactory.openSession()) {
			gameList = session.selectList("allSelectGame");
			for(GameDTO game : gameList) {
				game.setGame_apply(session.selectOne("game.gameApplyCount", game.getGame_num()));
			}			
		}
		
		return gameList;
	}
	
	public void applyGame(String team_num, String game_num) {
		GameApplyDTO gameApply = new GameApplyDTO();
		gameApply.setGame_num(Integer.parseInt(game_num));
		gameApply.setTeam_num(Integer.parseInt(team_num));
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("game.applyGame", gameApply);
			if (count > 0) {
				session.commit();	
			}			
		}		
	}
	
	public void applyCancelGame(String game_num, String team_num) {
		GameApplyDTO gameApply = new GameApplyDTO();
		gameApply.setGame_num(Integer.parseInt(game_num));
		gameApply.setTeam_num(Integer.parseInt(team_num));
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.delete("game.applyCancelGame", gameApply);
			session.commit();
		}
	}
	
	public GameDTO getSelectGame(String gameNum) {
		GameDTO game = new GameDTO();
		game.setGame_num(Integer.parseInt(gameNum));
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("game.selectGame", game);			
		}
	}
	
	public List<GameResultDTO> GameResultList(String gameNum) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("game.getGameResult", gameNum);			
		}
	}
	
	public List<GameDTO> getGameSelect(String type, String text) {
		Map<String, Object> select = new HashMap<>();
		select.put("text", text);
		select.put("type", type);
		List<GameDTO> gameList = null;
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			gameList = session.selectList("game.gameSelect", select);
			for(GameDTO game : gameList) {
				game.setGame_apply(session.selectOne("game.gameApplyCount", game.getGame_num()));
			}			
		}
		return gameList;
	}
	
	public List<GameApplyTeamDTO> selectApplyTeam(String game_num) {
		GameApplyTeamDTO gameApplyTeam = new GameApplyTeamDTO();
		gameApplyTeam.setGame_num(Integer.parseInt(game_num));

		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("game.selectApplyTeam", gameApplyTeam);			
		}
	}

}
