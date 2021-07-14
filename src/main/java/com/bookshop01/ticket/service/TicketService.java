package com.bookshop01.ticket.service;

import java.util.HashMap;
import java.util.List;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;

public interface TicketService {

	public List<GoodsVO> listGoods() throws Exception;
	
	public List<ScheduleVO> listTicke(int movie_id) throws Exception;
	public List<ScheduleVO> listMovieTitle() throws Exception;
	public List<ScheduleVO> listMovieTitme(HashMap<String, Object> map) throws Exception;
}
