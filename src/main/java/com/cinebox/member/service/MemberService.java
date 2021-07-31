package com.cinebox.member.service;

import java.util.Map;

import com.cinebox.member.vo.MemberVO;

public interface MemberService {
	public MemberVO login(Map  loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
	public MemberVO tels(Map idsearch) throws Exception;
	public MemberVO findpw(Map pwsearch) throws Exception;
}
