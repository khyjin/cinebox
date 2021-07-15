package com.bookshop01.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface ScheduleController {

	public ModelAndView goform(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addSchedule(HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView selectSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String deleteSchedule(int schedule_id) throws Exception;
	public String modifySchedule(int schedule_id, String movie_title,String room_number, 
			String schedule_start_time, String schedule_date,
			HttpServletRequest request, HttpServletResponse response) throws Exception;


}
