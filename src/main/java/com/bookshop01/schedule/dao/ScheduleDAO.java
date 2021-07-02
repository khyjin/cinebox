package com.bookshop01.schedule.dao;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;


public interface ScheduleDAO {
	
		public List<GoodsVO> selectTitle() throws DataAccessException;
		public void insertDAO(Map<String, String> scheduleMap)throws DataAccessException;

		
	
}
