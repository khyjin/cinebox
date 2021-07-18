package com.bookshop01.ticket.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;
import com.bookshop01.ticket.vo.TicketVO;

public interface TicketService {

	public List<GoodsVO> listGoods() throws Exception;

	public List<ScheduleVO> listTicke(int movie_id) throws Exception;
	public List<ScheduleVO> listMovieTitle() throws Exception;
	public List<ScheduleVO> listMovieTitme(HashMap<String, Object> map) throws Exception;
	public List<TicketVO> seatReservation(TicketVO ticketVO)  throws Exception;
}
