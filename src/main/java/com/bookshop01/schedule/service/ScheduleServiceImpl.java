package com.bookshop01.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.dao.ScheduleDAO;
import com.bookshop01.schedule.vo.ScheduleVO;
@Service("scheduleService") // 서비스에는 service,transactional
@Transactional(propagation=Propagation.REQUIRED)
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Override
	public List<GoodsVO> selectTitle() throws Exception {
		List<GoodsVO> titleList=scheduleDAO.selectTitle();
		return titleList;
	}
	
	
	@Override
	public void addSchedule(ScheduleVO scheduleVO) throws Exception{
		scheduleDAO.insertDAO(scheduleVO);
		
	}
	
}
