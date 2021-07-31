package com.bookshop01.goods.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.mypage.vo.MyPageVO;

public interface GoodsController  {
	public ModelAndView goodsDetail(@RequestParam("movie_id") String movie_id,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView movieOpenList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView movieScheduledList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView movieClosedList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity myReview(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
