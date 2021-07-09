package com.bookshop01.schedule.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bookshop01.schedule.vo.ScheduleVO;


public interface ScheduleDAO {
		public void insertDAO(HashMap<String,String> schedulemap) throws DataAccessException;

		public List<ScheduleVO> selectSchedule() throws DataAccessException;
		
	
}
