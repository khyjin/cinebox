package com.cinebox.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.cinebox.cscenter.vo.SearchCriteria;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.member.vo.MemberVO;

public interface AdminMemberDAO {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException;
	public MemberVO memberDetail(String member_id) throws DataAccessException;
	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException;
	public void deleteNewGoods(String member_id) throws DataAccessException;
	
	public List<MemberVO> selectSearch(SearchCriteria scri) throws DataAccessException;
	public int listCount2(SearchCriteria scri) throws DataAccessException;
}
