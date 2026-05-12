package com.fcjava.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.fcjava.dto.UserDTO;
import com.fcjava.util.MyBatisUtil;

public class UserDAO {
	private static final UserDAO instance = new UserDAO();

	private final SqlSessionFactory sqlSessionFactory = MyBatisUtil.getSqlSessionFactory();

	private UserDAO() {}

	public static UserDAO getInstance() {
		return instance;
	}

	public boolean existsUser(String id) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.selectOne("user.existsUser", id);
			return count > 0;
		}
	}

	public UserDTO findUser(String id, String pw) {
		UserDTO user = new UserDTO();
		user.setId(id);
		user.setPw(pw);

		try (SqlSession session = sqlSessionFactory.openSession()) {
			return session.selectOne("user.findUser", user);
		}
	}

	public void insertUser(UserDTO user) {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			int count = session.insert("user.insertUser", user);
			if (count > 0) {
				session.commit();
			}
		}
	}
}
