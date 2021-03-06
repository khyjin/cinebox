package com.cinebox.mypage.service;

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

import com.cinebox.cscenter.vo.CscenterVO;
import com.cinebox.member.vo.MemberVO;
import com.cinebox.mypage.dao.MyPageDAO;
import com.cinebox.mypage.vo.MyPageVO;
import com.cinebox.ticket.vo.TicketVO;

@Service("myPageService")
@Transactional(propagation=Propagation.REQUIRED)
public class MyPageServiceImpl  implements MyPageService{
	@Autowired
	private MyPageDAO myPageDAO;

	public List<TicketVO> listMyOrderGoods(String member_id) throws Exception{
		return myPageDAO.selectMyOrderGoodsList(member_id);
	}
	

	public TicketVO findMyOrderInfo(int ticket_number) throws Exception{
		return myPageDAO.selectMyOrderInfo(ticket_number);
	}
	
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception{
		 String member_id=(String)memberMap.get("member_id");
		 myPageDAO.updateMyInfo(memberMap);
		 return myPageDAO.selectMyDetailInfo(member_id);
	}
	
	public void cancelOrder(int ticket_number, String member_id, int saving_point, int used_point) throws Exception{		
		int current_point = myPageDAO.myPoint(member_id);
		int member_point = current_point+used_point-saving_point;
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(member_id);
		memberVO.setMember_point(member_point);
		
		myPageDAO.updateMyOrderCancel(ticket_number);
		myPageDAO.updateMyPoint(memberVO);
	}
	public MemberVO myDetailInfo(String member_id) throws Exception{
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public int myPoint(String member_id) throws Exception {
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


	@Override
	public TicketVO getImage(int movie_id) throws Exception {		
		return myPageDAO.selectImage(movie_id);
	}


	@Override
	public int searchPoint(String member_id) throws Exception {
		return myPageDAO.selectPoint(member_id);
	}

}
