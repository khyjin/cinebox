package com.bookshop01.admin.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookshop01.cscenter.vo.SearchCriteria;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;

public interface AdminOrderService {
	public List<TicketVO> listNewOrder(SearchCriteria scri) throws Exception;
	public void  modifyDeliveryState(Map deliveryMap) throws Exception;
	public Map orderDetail(int order_id) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	public void cancleTicket(int ticket_number_code) throws Exception;
}
