package com.bookshop01.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
															//loginMap�� id,pw�� ����
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
							//overlapped ���̵� �ߺ� üũ
//	HttpEntity<T>(ResponseEntity)-> ��ü �主�� ���ִ� ���� �������� header, body, statud code 
	public ModelAndView goid(HttpServletRequest hs) throws Exception;
	public ModelAndView goidv(Map<String, String>idsearch, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView gopw(HttpServletRequest hs) throws Exception;
	public ModelAndView gopwv(Map<String, String>pwsearch, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
}

