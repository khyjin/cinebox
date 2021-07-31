package com.cinebox.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.cinebox.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public MemberVO tels(Map idsearch) throws DataAccessException;
	public MemberVO findpw(Map pwsearch) throws DataAccessException;

}
