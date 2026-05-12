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
		return stadiumDAO.findAll();
	}

	public List<StadiumDTO> findTeamNames(String id) {
		return stadiumDAO.findTeamNames(id);
	}

	public StadiumDTO findNewStadiumOne() {
		return stadiumDAO.findRandomStadium();
	}

	public StadiumDTO findStadium(String stadiumNum) {
		return stadiumDAO.findByNumber(stadiumNum);
	}

	public void bookStadium(StadiumBookingDTO booking) {
		stadiumDAO.bookStadium(booking);
	}

	public void createStadium(StadiumDTO stadium) {
		stadiumDAO.createStadium(stadium);
	}
}
