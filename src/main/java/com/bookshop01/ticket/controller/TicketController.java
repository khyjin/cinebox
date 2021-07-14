package com.bookshop01.ticket.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.schedule.vo.ScheduleVO;

public interface TicketController {


	public ModelAndView selectMovieList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//////임의 추가
	public Map<String, Object> makeTicket(@RequestParam("movie_id") int movie_id,@RequestParam("movie_title") String movie_title, Model model) throws Exception;
	 
	 
}
