package com.bookshop01.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface ScheduleController {

	public ResponseEntity addSchedule(HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView selectSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception;


}
