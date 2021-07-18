package com.bookshop01.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.member.vo.MemberVO;

public interface MyPageController {
	public ModelAndView myPageMain(@RequestParam(required = false,value="message")  String message,HttpServletRequest request, HttpServletResponse response)  throws Exception ;
	public ModelAndView myOrderDetail(@RequestParam("ticket_number")  int ticket_number,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView cancelMyOrder(@RequestParam("ticket_number")  int ticket_number,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
					            @RequestParam("value")  String value,
					            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView myPoint(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String deletemyReview(@RequestParam("review_number") int review_number) throws Exception;
	public ModelAndView myQnaList(String member_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myQnaModifyview(@RequestParam("cscenter_number")  int cscenter_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity myQnaModify(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView myReviewList(String member_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public String deletemyQna(@RequestParam("cscenter_number") int cscenter_number) throws Exception;
	}