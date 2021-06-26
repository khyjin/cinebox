package com.bookshop01.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.bookshop01.member.vo.MemberVO;

@Repository("memberDAO") // dao쪽에는 항상 repository
public class MemberDAOImpl  implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
	
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
	public MemberVO tels(Map tel) throws DataAccessException {
		MemberVO result =  sqlSession.selectOne("mapper.member.tels",tel);
		return result;
	}
	
	//이름으로 아이디 찾기
	@Override
	public MemberVO names(Map name) throws DataAccessException {
		MemberVO result =  sqlSession.selectOne("mapper.member.name",name);
		return result;
	}
}
