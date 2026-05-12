package com.fcjava.service;

import java.util.List;

import com.fcjava.dao.StadiumDAO;
import com.fcjava.dto.StadiumBookingDTO;
import com.fcjava.dto.StadiumDTO;

public class StadiumService {
	private static final StadiumService instance = new StadiumService();

	private final StadiumDAO stadiumDAO = StadiumDAO.getInstance();

	private StadiumService() {}

	public static StadiumService getInstance() {
		return instance;
	}

	public List<StadiumDTO> findStadiums() {
		return stadiumDAO.getStadiumList();
	}

	public List<StadiumDTO> findTeamNames(String id) {
		return stadiumDAO.getTeamName(id);
	}

	public StadiumDTO findNewStadiumOne() {
		return stadiumDAO.getNewStadiumOne();
	}

	public StadiumDTO findStadium(String stadiumNum) {
		return stadiumDAO.getStadiums(stadiumNum);
	}

	public void bookStadium(StadiumBookingDTO booking) {
		stadiumDAO.booking1(booking);
	}

	public void createStadium(StadiumDTO stadium) {
		stadiumDAO.createStadium(stadium);
	}
}
