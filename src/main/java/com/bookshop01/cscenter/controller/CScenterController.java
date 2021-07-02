package com.bookshop01.cscenter.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.cscenter.vo.CscenterVO;

public interface CScenterController {

	public ModelAndView cscenterMain(@RequestParam(required = false,value="message")  String message,	//cs센터 메인
			   HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ResponseEntity noticeReg(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView contentView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modifyView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modifyNotice(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletResponse response, HttpServletRequest request) throws Exception;

}
