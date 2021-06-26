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
	public ResponseEntity  addMember(@ModelAttribute("member") MemberVO member,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
							//overlapped ���̵� �ߺ� üũ
//	HttpEntity<T>(ResponseEntity)-> ��ü �主�� ���ִ� ���� �������� header, body, statud code 
	public ModelAndView goid(HttpServletRequest hs) throws Exception;
	public ModelAndView goidv(Map<String, String> tel, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView goname(HttpServletRequest hs) throws Exception;
	 public ModelAndView gonamev(@RequestParam Map<String,String> name,HttpServletRequest rq, HttpServletResponse rs) throws Exception;
}

