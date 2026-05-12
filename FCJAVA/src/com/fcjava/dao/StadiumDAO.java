package com.fcjava.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.StadiumBookingDTO;
import com.fcjava.dto.StadiumDTO;
import com.fcjava.util.MyBatisUtil;

public class StadiumDAO {
	private static final StadiumDAO instance = new StadiumDAO();

	private StadiumDAO() {}

	public static StadiumDAO getInstance() {
		return instance;
	}

	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();

    public List<StadiumDTO> findAll() {
	try (SqlSession session = sqlSessionFactory.openSession()) {
		return session.selectList("stadium.sta_select");
	}
	}

    public List<StadiumDTO> findTeamNames(String id) {
	StadiumDTO stadium = new StadiumDTO();
	stadium.setId(id);
	try (SqlSession session = sqlSessionFactory.openSession()) {
		return session.selectList("stadium.selectTeamNames", stadium);
	}
    }

    public StadiumDTO findRandomStadium() {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("stadium.randomStadium");
		}
	}

	public StadiumDTO findByNumber(String stadiumNumber) {
		StadiumDTO stadium = new StadiumDTO();
		stadium.setG_no(stadiumNumber);
		try (SqlSession session = sqlSessionFactory.openSession()) {
			stadium = session.selectOne("stadium.selectsta", stadium);
		}

	    return stadium;
    }

	public void bookStadium(StadiumBookingDTO booking) {
        try (SqlSession session = sqlSessionFactory.openSession()) {
	int count = session.insert("stadium.booking", booking);
	if (count > 0) {
		session.commit();
	}
        }
	}

    public void createStadium(StadiumDTO stadium) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("stadium.str_insert", stadium);
			if (count > 0) {
				session.commit();
			}
		}
	}

}
