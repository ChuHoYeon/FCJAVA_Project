package com.fcjava.service;

import com.fcjava.dao.UserDAO;
import com.fcjava.dto.UserDTO;

public class UserService {
	private static final UserService instance = new UserService();

	private final UserDAO userDAO = UserDAO.getInstance();

	private UserService() {}

	public static UserService getInstance() {
		return instance;
	}

	public boolean existsUser(String id) {
		return userDAO.existsUser(id);
	}

	public UserDTO login(String id, String pw) {
		return userDAO.findUser(id, pw);
	}

	public void join(UserDTO user) {
		userDAO.insertUser(user);
	}
}
