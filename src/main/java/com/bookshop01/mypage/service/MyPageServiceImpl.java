package com.bookshop01.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.mypage.dao.MyPageDAO;
import com.bookshop01.mypage.vo.MyPageVO;
import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl  implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;

	public List<TicketVO> listMyOrderGoods(String member_id) throws Exception{
		return myPageDAO.selectMyOrderGoodsList(member_id);
	}
	
	public TicketVO findMyOrderInfo(String ticket_number) throws Exception{
		return myPageDAO.selectMyOrderInfo(ticket_number);
	}
	
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception{
		return myPageDAO.selectMyOrderHistoryList(dateMap);
	}
	
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception{
		 String member_id=(String)memberMap.get("member_id");
		 myPageDAO.updateMyInfo(memberMap);
		 return myPageDAO.selectMyDetailInfo(member_id);
	}
	
	public void cancelOrder(String order_id) throws Exception{
		myPageDAO.updateMyOrderCancel(order_id);
	}
	public MemberVO myDetailInfo(String member_id) throws Exception{
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public MemberVO myPoint(String member_id) throws Exception {
		return myPageDAO.myPoint(member_id);
	}
	


	@Override
	public List<MyPageVO> myReviewList(String member_id) throws Exception {		
		return myPageDAO.myReviewList(member_id);
	}
	
	@Override
	public void deletemyReview(int review_number) throws Exception {
		myPageDAO.deletemyReview(review_number);
	}
	
	@Override
	public List<CscenterVO> myQnaList(String member_id) throws Exception {		
		return myPageDAO.myQnaList(member_id);
	}
	
	@Override
	public void myQnaModify(CscenterVO cscenter) throws Exception {
		myPageDAO.myQnaModify(cscenter);
		
	}
	
	@Override
	public List<CscenterVO> myQnaModifyview(int cscenter_number) throws Exception {		
		return myPageDAO.myQnaModifyview(cscenter_number);
	}
	
	@Override
	public void deletemyQna(int cscenter_number) throws Exception {
		myPageDAO.deletemyQna(cscenter_number);
	}

}
