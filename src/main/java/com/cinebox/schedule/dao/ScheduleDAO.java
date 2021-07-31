package com.cinebox.schedule.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.schedule.vo.ScheduleVO;


public interface ScheduleDAO {
	public void insertDAO(HashMap<String,String> schedulemap) throws DataAccessException;
	public List<ScheduleVO> selectSchedule() throws DataAccessException;
	public List<GoodsVO> listGoods() throws DataAccessException;
	public void deleteDAO(int schedule_id) throws DataAccessException;
	public void modifyDAO(Map<String, Object> modimap) throws DataAccessException;
	
}
