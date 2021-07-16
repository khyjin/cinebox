package com.bookshop01.order.service;

import java.util.List;
import java.util.Map;

import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;

public interface OrderService {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public void addNewOrder(TicketVO ticketVO) throws Exception;
	public OrderVO findMyOrder(String order_id) throws Exception;
	
	
}
