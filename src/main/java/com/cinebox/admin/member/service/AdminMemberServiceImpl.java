package com.cinebox.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cinebox.admin.member.dao.AdminMemberDAO;
import com.cinebox.cscenter.vo.SearchCriteria;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.member.vo.MemberVO;


@Service("adminMemberService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception{
		return adminMemberDAO.listMember(condMap);
	}

	public MemberVO memberDetail(String member_id) throws Exception{
		 return adminMemberDAO.memberDetail(member_id);
	}
	
	public void  modifyMemberInfo(HashMap memberMap) throws Exception{
		 String member_id=(String)memberMap.get("member_id");
		 adminMemberDAO.modifyMemberInfo(memberMap);
	}

	@Override
	public void deletemember(String member_id) throws Exception {
		adminMemberDAO.deleteNewGoods(member_id);
		
	}

	@Override
	public List<MemberVO> searchMember(SearchCriteria scri) throws Exception {
		
		return adminMemberDAO.selectSearch(scri);
	}
	
	@Override
	public int listCount2(SearchCriteria scri) {
		return adminMemberDAO.listCount2(scri);
	}
	
}
