package com.cinebox.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.cinebox.member.vo.MemberVO;

@Repository("memberDAO") // dao쪽에는 항상 repository
public class MemberDAOImpl  implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
	
	//회원가입
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember",memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",id);
		return result;
	}
	
	//전화번호로 아이디 찾기
	@Override
	public MemberVO tels(Map idsearch) throws DataAccessException {
		MemberVO result =  sqlSession.selectOne("mapper.member.tels",idsearch);
		return result;
	}

	@Override
	public MemberVO findpw(Map pwsearch) throws DataAccessException {
		MemberVO result = sqlSession.selectOne("mapper.member.findpw",pwsearch);
		return result;
	}
	
}
