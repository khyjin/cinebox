package com.bookshop01.schedule.dao;

import java.util.HashMap;

import org.springframework.dao.DataAccessException;


public interface ScheduleDAO {
		public void insertDAO(HashMap<String,String> schedulemap) throws DataAccessException;

		
	
}
