package com.fcjava.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.football.FootballApiResponseLogDTO;
import com.fcjava.dto.football.FootballLeagueStandingDTO;
import com.fcjava.util.MyBatisUtil;

public class FootballDataDAO {
	
	private static final FootballDataDAO instance = new FootballDataDAO();

	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();

    private FootballDataDAO() {
    }

    public static FootballDataDAO getInstance() {
        return instance;
    }

    public int countTodayStanding(Map<String, Object> paramMap) {
        SqlSession session = sqlSessionFactory.openSession();

        try {
            return session.selectOne("footballData.countTodayStanding", paramMap);
        } finally {
            session.close();
        }
    }

    public List<FootballLeagueStandingDTO> selectTodayStanding(Map<String, Object> paramMap) {
        SqlSession session = sqlSessionFactory.openSession();

        try {
            return session.selectList("footballData.selectTodayStanding", paramMap);
        } finally {
            session.close();
        }
    }

    public int insertApiResponseLog(FootballApiResponseLogDTO dto) {
        SqlSession session = sqlSessionFactory.openSession();

        try {
            int result = session.insert("footballData.insertApiResponseLog", dto);
            session.commit();
            return result;
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
    }

    public int insertLeagueStanding(FootballLeagueStandingDTO dto) {
        SqlSession session = sqlSessionFactory.openSession();

        try {
            int result = session.insert("footballData.insertLeagueStanding", dto);
            session.commit();
            return result;
        } catch (Exception e) {
            session.rollback();
            throw e;
        } finally {
            session.close();
        }
    }
}
