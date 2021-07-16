package com.bookshop01.admin.order.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.cscenter.vo.SearchCriteria;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;

public interface AdminOrderDAO {
	public ArrayList<TicketVO> selectTicketList(SearchCriteria scri) throws DataAccessException;
	public void  updateDeliveryState(Map deliveryMap) throws DataAccessException;
	public ArrayList<OrderVO> selectOrderDetail(int order_id) throws DataAccessException;
	public MemberVO selectOrderer(String member_id) throws DataAccessException;
	
	public int listCount(SearchCriteria scri) throws DataAccessException;
	public void cancelTicket(int ticket_number_code) throws DataAccessException;
}
