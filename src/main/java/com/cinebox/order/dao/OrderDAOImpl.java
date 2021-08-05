package com.cinebox.order.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.cinebox.ticket.vo.TicketVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	
	public void insertNewOrder(TicketVO ticketVO) throws DataAccessException{
		sqlSession.insert("mapper.ticket.insertNewOrder",ticketVO);
	}
	
	
	//결제폼에 이미지 출력
	public TicketVO selectImage(int movie_id) throws DataAccessException{
		return sqlSession.selectOne("mapper.ticket.selectImage", movie_id);
	}


	@Override
	public void modifyPoint(Map<String, Object> pointMap) throws DataAccessException {
		sqlSession.update("mapper.admin.member.modifyPoint", pointMap);		
		
	}

	@Override
	public TicketVO searchSeatNumber(TicketVO ticketVO) throws DataAccessException {
		return sqlSession.selectOne("mapper.ticket.selectSeatNumber", ticketVO);
	}


	@Override
	public int searchPoint(String member_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.member.searchPoint", member_id);
	}
}