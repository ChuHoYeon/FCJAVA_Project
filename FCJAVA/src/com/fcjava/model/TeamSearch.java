package com.fcjava.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dao.SqlDAO;
import com.fcjava.dto.TeamDTO;

public class TeamSearch {
	
	static TeamSearch teamSearch = new TeamSearch();
	public static TeamSearch getTeamSearch() {
		return teamSearch;
	}
	
	SqlSessionFactory sql = SqlDAO.getSqlSession();
	
	public List<TeamDTO> searchTeamList(String t_name, String[] hom_city, String[] week_time, String[] t_skill) {
		SqlSession getSql = sql.openSession();
		
		Map<String, Object> params = new HashMap<>();
        params.put("t_name", t_name);
        params.put("hom_city", hom_city);
        params.put("t_skill", t_skill);
        if(week_time != null) {
	        StringBuilder regexPatternBuilder = new StringBuilder();
	        for (String combination : week_time) {
	            if (regexPatternBuilder.length() > 0) {
	                regexPatternBuilder.append("|");
	            }
	            regexPatternBuilder.append(combination);
	        }
	        String regexPattern = regexPatternBuilder.toString();
	        params.put("week_time", regexPattern);
        }else {
        	params.put("week_time", week_time);
        }
		List<TeamDTO> teamList = getSql.selectList("searchTeamList", params);
		getSql.close();
		
		return teamList;
	}

}
