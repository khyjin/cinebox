package com.bookshop01.schedule.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;


public interface ScheduleDAO {
	public void insertDAO(HashMap<String,String> schedulemap) throws DataAccessException;
	public List<ScheduleVO> selectSchedule() throws DataAccessException;
	public List<GoodsVO> listGoods() throws DataAccessException;
	public void deleteDAO(int schedule_id) throws DataAccessException;
	public void modifyDAO(Map<String, Object> modimap) throws DataAccessException;
	
}
