package com.bookshop01.schedule.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;

public interface ScheduleService {

	public List<GoodsVO> selectTitle() throws Exception;

	public void addSchedule(ScheduleVO scheduleVO) throws Exception;

}
