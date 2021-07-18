package com.bookshop01.order.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException{
		List<OrderVO> orderGoodsList=new ArrayList<OrderVO>();
		orderGoodsList=(ArrayList)sqlSession.selectList("mapper.order.selectMyOrderList",orderVO);
		return orderGoodsList;
	}
	
	public void insertNewOrder(TicketVO ticketVO) throws DataAccessException{
		
			sqlSession.insert("mapper.ticket.insertNewOrder",ticketVO);
	}
	
	public OrderVO findMyOrder(String order_id) throws DataAccessException{
		OrderVO orderVO=(OrderVO)sqlSession.selectOne("mapper.order.selectMyOrder",order_id);		
		return orderVO;
	}
	
	public void removeGoodsFromCart(OrderVO orderVO)throws DataAccessException{
		sqlSession.delete("mapper.order.deleteGoodsFromCart",orderVO);
	}
	
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException{
		for(int i=0; i<myOrderList.size();i++){
			OrderVO orderVO =(OrderVO)myOrderList.get(i);
			sqlSession.delete("mapper.order.deleteGoodsFromCart",orderVO);		
		}
	}	
	
	//테이블에 저장할 주문 번호 가져오기
	private int selectOrderID() throws DataAccessException{
		return sqlSession.selectOne("mapper.order.selectOrderID");
		
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
	public TicketVO searchSeatNumber(String seat_number) throws DataAccessException {
		return sqlSession.selectOne("mapper.ticket.selectSeatNumber", seat_number);
	}
}

