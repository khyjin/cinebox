package com.bookshop01.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.mypage.vo.MyPageVO;
import com.bookshop01.order.vo.OrderVO;

public interface MyPageService{
	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception;
	public List findMyOrderInfo(String order_id) throws Exception;
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception;
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
	public void cancelOrder(String order_id) throws Exception;
	public MemberVO myDetailInfo(String member_id) throws Exception;
	public MemberVO myPoint(String member_id) throws Exception;
	public List<MyPageVO> myReviewList(String member_id) throws Exception;
	public void deletemyReview(int review_number) throws Exception;
	public List<CscenterVO> myQnaList(String member_id) throws Exception;
	public void myQnaModify(CscenterVO cscenter) throws Exception;
	public List<CscenterVO> myQnaModifyview(int cscenter_number) throws Exception;
}
