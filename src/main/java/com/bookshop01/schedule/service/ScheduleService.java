package com.bookshop01.schedule.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;

public interface ScheduleService {

	public void addSchedule(HashMap<String,String> schedulemap) throws Exception;

}
