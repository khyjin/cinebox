package com.cinebox.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.schedule.vo.ScheduleVO;
import com.cinebox.ticket.vo.TicketVO;

public interface TicketDAO {
	public List<GoodsVO> listGoods() throws DataAccessException;
	public List<ScheduleVO> selectDate(int movie_id) throws DataAccessException;
	public List<ScheduleVO> reservationSchedule() throws DataAccessException;
	public List<ScheduleVO> selectTime(HashMap<String, Object> map) throws DataAccessException;
	public List<TicketVO> seatReservation(TicketVO ticketVO) throws DataAccessException;
}
