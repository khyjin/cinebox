package com.bookshop01.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;

public interface ScheduleController {
	
	public ModelAndView addNewSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception;


	public ModelAndView addSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
