package com.cinebox.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.cinebox.cscenter.vo.CscenterVO;
import com.cinebox.member.vo.MemberVO;
import com.cinebox.mypage.vo.MyPageVO;
import com.cinebox.ticket.vo.TicketVO;

public interface MyPageDAO {
	public List<TicketVO> selectMyOrderGoodsList(String member_id) throws DataAccessException;
	public TicketVO selectMyOrderInfo(int ticket_number) throws DataAccessException;
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	public TicketVO selectImage(int movie_id) throws DataAccessException;
	public void updateMyOrderCancel(int ticket_number) throws DataAccessException;
	public int myPoint(String member_id)throws DataAccessException;
	public void updateMyPoint(MemberVO memberVO) throws DataAccessException;
	public List<MyPageVO> myReviewList(String member_id) throws DataAccessException;
	public void deletemyReview(int review_number) throws DataAccessException;
	public List<CscenterVO> myQnaList(String member_id) throws DataAccessException;
	public void myQnaModify(CscenterVO cscenterVO) throws DataAccessException;
	public List<CscenterVO> myQnaModifyview(int cscenter_number) throws DataAccessException;
	public void deletemyQna(int cscenter_number) throws DataAccessException;
	public int selectPoint(String member_id) throws DataAccessException;
}
