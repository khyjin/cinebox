package com.bookshop01.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.mypage.vo.MyPageVO;
import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;

public interface MyPageService{
	public List<TicketVO> listMyOrderGoods(String member_id) throws Exception;
	public TicketVO findMyOrderInfo(int ticket_number) throws Exception;
	public TicketVO getImage(int movie_id) throws Exception;
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
	public void cancelOrder(int ticket_number, String member_id, int saving_point, int used_point) throws Exception;
	public MemberVO myDetailInfo(String member_id) throws Exception;
	public int myPoint(String member_id) throws Exception;
	public List<MyPageVO> myReviewList(String member_id) throws Exception;
	public void deletemyReview(int review_number) throws Exception;
	public List<CscenterVO> myQnaList(String member_id) throws Exception;
	public void myQnaModify(CscenterVO cscenter) throws Exception;
	public List<CscenterVO> myQnaModifyview(int cscenter_number) throws Exception;
	public void deletemyQna(int cscenter_number) throws Exception;
}
