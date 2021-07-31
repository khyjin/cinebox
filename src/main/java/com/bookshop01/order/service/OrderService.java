package com.bookshop01.order.service;

import java.util.Map;

import com.bookshop01.ticket.vo.TicketVO;

public interface OrderService {
	public void addNewOrder(TicketVO ticketVO) throws Exception;
	public void modifyPoint(Map<String, Object> pointMap) throws Exception;
	public TicketVO getImage(int movie_id) throws Exception;
	public TicketVO searchSeatNumber(TicketVO ticketVO) throws Exception;
	
}