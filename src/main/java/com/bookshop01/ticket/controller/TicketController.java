package com.bookshop01.ticket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface TicketController {


	public ModelAndView selectMovieList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	 
	 
}
