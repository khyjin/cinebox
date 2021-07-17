package com.bookshop01.admin.order.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.cscenter.vo.SearchCriteria;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;

@Repository("adminOrderDAO")
public class AdminOrderDAOImpl  implements AdminOrderDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<TicketVO> selectTicketList(SearchCriteria scri) throws DataAccessException{
		ArrayList<TicketVO>  ticketList=(ArrayList)sqlSession.selectList("mapper.admin.order.selectTicketList",scri);
		return ticketList;
	}
	
	public int listCount(SearchCriteria scri) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.order.listCount",scri);
	}

	public TicketVO selectReservation(String ticket_number) throws DataAccessException{
		return  (TicketVO) sqlSession.selectOne("mapper.admin.order.selectReservation",ticket_number);
	}
	
	@Override
	public void cancelTicket(String ticket_number) throws DataAccessException {
		sqlSession.update("mapper.admin.order.cancelTicket", ticket_number);		
	}
	
	@Override
	public int selectPoint(String member_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.order.selectPoint", member_id);
	}
	
	@Override
	public void updatePoint(MemberVO memberVO) throws DataAccessException {
		sqlSession.update("mapper.admin.order.updatePoint", memberVO);		
	}
	
	@Override
	public void updateReservation(TicketVO ticketVO) throws DataAccessException {
		sqlSession.update("mapper.admin.order.updateReservation", ticketVO);		
	}
/////////////////////////////////////////////////////////////////////	
	public void  updateDeliveryState(Map deliveryMap) throws DataAccessException{
		sqlSession.update("mapper.admin.order.updateDeliveryState",deliveryMap);
	}

	public MemberVO selectOrderer(String member_id) throws DataAccessException{
		MemberVO orderer=(MemberVO)sqlSession.selectOne("mapper.admin.order.selectOrderer",member_id);
		return orderer;	
	}
	







	


}
