package com.bookshop01.order.service;

import java.util.List;
import java.util.Map;

import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;

public interface OrderService {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public void addNewOrder(TicketVO ticketVO) throws Exception;
	public OrderVO findMyOrder(String order_id) throws Exception;
	public void modifyPoint(Map<String, Object> pointMap) throws Exception;
	
	public TicketVO getImage(int movie_id) throws Exception;
	public TicketVO searchSeatNumber(String seat_number) throws Exception;
	
}
