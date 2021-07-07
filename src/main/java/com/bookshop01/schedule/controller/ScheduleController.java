package com.bookshop01.schedule.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;

public interface ScheduleController {

	public ResponseEntity addSchedule(HttpServletRequest request, HttpServletResponse response)
			throws Exception;


}
