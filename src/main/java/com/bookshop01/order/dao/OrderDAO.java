package com.bookshop01.order.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.ticket.vo.TicketVO;

public interface OrderDAO {
	public void insertNewOrder(TicketVO ticketVO) throws DataAccessException;
	public TicketVO selectImage(int movie_id) throws DataAccessException;
	public void modifyPoint(Map<String, Object> pointMap) throws DataAccessException;
	public TicketVO searchSeatNumber(TicketVO ticketVO) throws DataAccessException;

}