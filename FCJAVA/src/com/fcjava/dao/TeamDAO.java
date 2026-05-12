package com.fcjava.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.PlayerDTO;
import com.fcjava.dto.TeamBoardDTO;
import com.fcjava.dto.TeamDTO;
import com.fcjava.dto.TeamFormationDTO;
import com.fcjava.dto.TeamGameResultDTO;
import com.fcjava.dto.TeamScheduleDTO;
import com.fcjava.util.MyBatisUtil;

public class TeamDAO {
	private static final TeamDAO instance = new TeamDAO();
	
	private TeamDAO() {}
	
	public static TeamDAO getInstance() {
		return instance;
	}
	
	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();
	
	public TeamDTO getTeam(String t_num) {
		TeamDTO team = TeamDTO.builder()
				.t_num(Integer.parseInt(t_num))
				.build();
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("team.selectTeam", team);			
		}
	}
	
	public List<TeamDTO> selectTeamList() { //팀 전체 리스트
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("team.selectTeamList");			
		}
	}

	public boolean isTeamName(String teamName) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.selectOne("team.existsTeamName", teamName);
			return count > 0;
		}
	}

	public void insertTeam(TeamDTO team) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("team.insertTeam", team);
			if (count > 0) {
				session.commit();
			}
		}
	}

	public String getLatestTeamNumByUser(String id) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("team.selectLatestTeamNumByUser", id);
		}
	}
	
	public List<TeamDTO> indexTeamList() { //인덱스용 팀3개 리스트
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("team.indexTeamList");			
		}
	}
	
	public void insertTeamApply(String t_num, String id, String pl_pic, String back_num, String position, String pl_memo, String height, String weight) {
		PlayerDTO player = new PlayerDTO();
		player.setT_num(Integer.parseInt(t_num));
		player.setId(id);
		
		if(pl_pic != null) {
			player.setPl_pic(pl_pic);
		}
		
		player.setBack_num(back_num);
		player.setPosition(position);
		
		if (pl_memo != null && !pl_memo.isEmpty()) {
		    player.setPl_memo(pl_memo);
		}
		
		if (height != null && !height.isEmpty()) {
		    player.setHeight(height);
		}

		if (weight != null && !weight.isEmpty()) {
		    player.setWeight(weight);
		}

		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("team.insertPlayerApply", player);
			if (count > 0) {
				session.commit();
			}
		}
	}
	
	public int applyTeamCount(String id) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("team.countTeam", id);
		}

	}
	
	public int getBoardCount(String teamNumber) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("team.teamBoardCount", teamNumber);
		}
	}
	
	public List<TeamBoardDTO> getBoardList(String t_num,int page, int limit) {
		Map<String, Object> params = new HashMap<>();
		int startrow=(page-1)*limit; 
		params.put("t_num", t_num);
		params.put("startrow", startrow);
		params.put("endrow", limit);
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("team.selectTeamBoardList", params);
		}
		
	}
	
	public List<TeamDTO> refrashMyTeamList(String id) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("team.refrashMyTeamList", id);
		}
	}
	
	public void createTeamBoardTable(String t_num) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			session.update("team.createTeamBoardTable", Integer.parseInt(t_num));
			session.commit();			
		}
	}
	
	public void insertTeamBoard(TeamBoardDTO teamBoard) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("team.insertTeamBoard", teamBoard);
			if (count>=1) {
				session.commit();
			}			
		}
	}
	
	//포메이션이름 중복체크
	public boolean isFormationName(int t_num, String formation_name) {
		TeamFormationDTO formation = new TeamFormationDTO();
		formation.setT_num(t_num);
		formation.setFormation_name(formation_name);
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			List<TeamFormationDTO> formationList = session.selectList("team.isFormationName", formation);
			if(formationList.isEmpty()) {
				return true;
			}				
		}
		
		return false;
	}
	
	//포메이션 생성
	public void createFormation(int t_num,String formation, String foramtion_name, String[] player_id) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			for(int i=0; i<11; i++) {
				TeamFormationDTO teamForamtion = new TeamFormationDTO();
				teamForamtion.setT_num(t_num);
				teamForamtion.setFormation(formation);
				teamForamtion.setFormation_name(foramtion_name);
				teamForamtion.setPosition_num(i+1);
				teamForamtion.setPlayer_id(player_id[i]);
				session.insert("team.createFormation", teamForamtion);
			}
			session.commit();
		}
	}
	
	//팀의 전체 포메이션 불러오기
	public List<TeamFormationDTO> getTeamFormations(String teamNumber) {
		TeamFormationDTO teamFormation = new TeamFormationDTO();
		teamFormation.setT_num(Integer.parseInt(teamNumber));
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("team.selectFormations", teamFormation);
			
		}
	}
	
	public List<TeamGameResultDTO> getTeamGameAllResult(String teamNumber) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("team.selectTeamGameAllResult", teamNumber);			
		}
	}
	
	public List<PlayerDTO> getPlayerList(String teamNumber) {
		int t_num = Integer.parseInt(teamNumber);
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("team.selectPlayerList", t_num);	
		}
	}
	
	public List<TeamScheduleDTO> getScheduleList(String teamNumber) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectList("team.selectScheduleList", teamNumber);			
		}
	}
	
	public List<TeamDTO> searchTeamList(Map<String, Object> params) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
        	return session.selectList("team.searchTeamList", params);        	
        }
	}
	
	public void deleteTeamSecession(String t_num, String id) {
		PlayerDTO player = new PlayerDTO();
		player.setT_num(Integer.parseInt(t_num));
		player.setId(id);
		
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.delete("team.deleteTeamSecession", player);
			if (count > 0) {
				session.commit();				
			}
		}
	}

}
