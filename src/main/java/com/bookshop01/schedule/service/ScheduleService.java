package com.bookshop01.schedule.service;

import java.util.HashMap;
import java.util.List;
import com.bookshop01.schedule.vo.ScheduleVO;

public interface ScheduleService {

	public void addSchedule(HashMap<String,String> schedulemap) throws Exception;

	public List<ScheduleVO> selectSchedule() throws Exception;
	

}
