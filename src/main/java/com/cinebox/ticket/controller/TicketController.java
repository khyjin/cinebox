package com.cinebox.ticket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cinebox.schedule.vo.ScheduleVO;
import com.cinebox.ticket.vo.TicketVO;

public interface TicketController {


	public ModelAndView selectMovieList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public HashMap<String, Object> makeTicketDate(@RequestParam("movie_id") int movie_id, @RequestParam("schedule_date") String schedule_date) throws Exception;
	//////���� �߰�
	public Map<String, Object> makeTicket(@RequestParam("movie_id") int movie_id,@RequestParam("movie_title") String movie_title) throws Exception;
	public ModelAndView printSeat1(@ModelAttribute("ticketVO") TicketVO ticketVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView printSeat2(@ModelAttribute("ticketVO") TicketVO ticketVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView printSeat3(@ModelAttribute("ticketVO") TicketVO ticketVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}

