package com.cinebox.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.schedule.vo.ScheduleVO;

public interface ScheduleService {

	public void addSchedule(HashMap<String,String> schedulemap) throws Exception;
	public List<ScheduleVO> selectSchedule() throws Exception;
	public List<GoodsVO> listGoods() throws Exception;
	public void deleteSchedule(int schedule_id) throws Exception;
	public void modifySchedule(Map<String, Object> modimap) throws Exception;
	
}