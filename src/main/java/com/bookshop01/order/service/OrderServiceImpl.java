package com.bookshop01.order.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import com.bookshop01.order.dao.OrderDAO;
import com.bookshop01.ticket.vo.TicketVO;


@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	
	public void addNewOrder(TicketVO ticketVO) throws Exception{
		//주문상품목록에 상품 추가
		orderDAO.insertNewOrder(ticketVO);
		
	}


	@Override
	public TicketVO getImage(int movie_id) throws Exception {
		
		return orderDAO.selectImage(movie_id);
	}

	@Override
	public void modifyPoint(Map<String, Object> pointMap) {
		orderDAO.modifyPoint(pointMap);
		
	}

	@Override
	public TicketVO searchSeatNumber(TicketVO ticketVO) throws Exception {
		return orderDAO.searchSeatNumber(ticketVO);
		 
	}

}