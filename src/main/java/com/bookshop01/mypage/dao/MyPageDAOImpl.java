package com.bookshop01.mypage.dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.mypage.vo.MyPageVO;
import com.bookshop01.ticket.vo.TicketVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<TicketVO> selectMyOrderGoodsList(String member_id) throws DataAccessException{
		List<TicketVO> orderGoodsList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderGoodsList",member_id);
		return orderGoodsList;
	}
	
	public TicketVO selectMyOrderInfo(int ticket_number) throws DataAccessException{
		TicketVO myOrderList=sqlSession.selectOne("mapper.mypage.selectMyOrderInfo",ticket_number);
		return myOrderList;
	}	

	public void updateMyInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyInfo",memberMap);
	}
	
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{
		MemberVO memberVO=(MemberVO) sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",member_id);
		return memberVO;
		
	}
	
	public void updateMyOrderCancel(int ticket_number) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyOrderCancel",ticket_number);
	}

	public int myPoint(String member_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.myPoint",member_id);
	}	
	@Override
	public void updateMyPoint(MemberVO memberVO) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyPoint", memberVO);		
	}
	@Override
	public List<MyPageVO> myReviewList(String member_id) throws DataAccessException {
		List<MyPageVO> myReviewList = sqlSession.selectList("mapper.mypage.myReviewList",member_id);
		return myReviewList;
	}
	
	@Override
	public void deletemyReview(int review_number) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deletemyReview", review_number);	
	}
	
	@Override
	public List<CscenterVO> myQnaList(String member_id) throws DataAccessException {
		List<CscenterVO> myQnaList = sqlSession.selectList("mapper.mypage.myQnaList",member_id);
		return myQnaList;
	}
	
	@Override
	public void myQnaModify(CscenterVO cscenterVO) throws DataAccessException {
		sqlSession.update("mapper.mypage.myQnaModify", cscenterVO);
	}
	
	
	@Override
	public List<CscenterVO> myQnaModifyview(int cscenter_number) throws DataAccessException {
		List<CscenterVO> myQnaList = sqlSession.selectList("mapper.mypage.myQnaModifyview",cscenter_number);
		return myQnaList;
	}
	
	@Override
	public void deletemyQna(int cscenter_number) throws DataAccessException {
		sqlSession.delete("mapper.mypage.deletemyQna", cscenter_number);	
	}

	@Override
	public TicketVO selectImage(int movie_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.mypage.selectImage",movie_id);		
	}
	
}
