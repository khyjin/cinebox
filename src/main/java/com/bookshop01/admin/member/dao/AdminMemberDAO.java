package com.bookshop01.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bookshop01.cscenter.vo.SearchCriteria;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.member.vo.MemberVO;

public interface AdminMemberDAO {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException;
	public MemberVO memberDetail(String member_id) throws DataAccessException;
	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException;
	public void deleteNewGoods(String member_id) throws DataAccessException;
	
	public List<MemberVO> selectSearch(SearchCriteria scri) throws DataAccessException;
	public int listCount2(SearchCriteria scri) throws DataAccessException;
}
