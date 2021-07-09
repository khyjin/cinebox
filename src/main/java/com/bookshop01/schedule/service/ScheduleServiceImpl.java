package com.bookshop01.schedule.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.schedule.dao.ScheduleDAO;
import com.bookshop01.schedule.vo.ScheduleVO;
@Service("scheduleService") // 서비스에는 service,transactional
@Transactional(propagation=Propagation.REQUIRED)
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Override
	public void addSchedule(HashMap<String,String> schedulemap) throws Exception{
		scheduleDAO.insertDAO(schedulemap);
		
	}

	@Override
	public List<ScheduleVO> selectSchedule() throws Exception {
		return scheduleDAO.selectSchedule();
	}
	
}
