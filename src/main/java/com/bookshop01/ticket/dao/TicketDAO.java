package com.bookshop01.ticket.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;

public interface TicketDAO {
	public List<GoodsVO> listGoods() throws DataAccessException;
	public List<ScheduleVO> selectDate(int movie_id) throws DataAccessException;
	public List<ScheduleVO> reservationSchedule() throws DataAccessException;
	public List<ScheduleVO> selectTime(HashMap<String, Object> map) throws DataAccessException;
}
