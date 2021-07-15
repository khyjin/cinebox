package com.bookshop01.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.cscenter.vo.SearchCriteria;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.member.vo.MemberVO;

@Repository("adminMemberDao")
public class AdminMemberDAOImpl  implements AdminMemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	
	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException{
		ArrayList<MemberVO>  memberList=(ArrayList)sqlSession.selectList("mapper.admin.member.listMember",condMap);
		return memberList;
	}
	
	public MemberVO memberDetail(String member_id) throws DataAccessException{
		MemberVO memberBean=(MemberVO)sqlSession.selectOne("mapper.admin.member.memberDetail",member_id);
		return memberBean;
	}
	
	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException{
		sqlSession.update("mapper.admin.member.modifyMemberInfo",memberMap);
	}

	@Override
	public void deleteNewGoods(String member_id) throws DataAccessException {
		sqlSession.delete("mapper.admin.member.deletemember",member_id);	
		
	}

	@Override
	public List<MemberVO> selectSearch(SearchCriteria scri) throws DataAccessException {
		
		return sqlSession.selectList("mapper.admin.member.selectSearch", scri);
	}

	@Override
	public int listCount2(SearchCriteria scri) throws DataAccessException{
		return sqlSession.selectOne("mapper.admin.member.listCount2", scri);
	}

	
	

}
