package com.cinebox.cscenter.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cinebox.cscenter.vo.Criteria;
import com.cinebox.cscenter.vo.CscenterVO;
import com.cinebox.cscenter.vo.SearchCriteria;

public interface CScenterController {
	
	public ModelAndView cscenterMain(@RequestParam(required = false,value="message")  String message,
			   HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView noticeList(HttpServletRequest request, SearchCriteria scri) throws Exception;
	public ModelAndView faqList(HttpServletRequest request, SearchCriteria scri) throws Exception;
	public ModelAndView contentView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addQna(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity rentalSaveProcess(HttpServletRequest request, HttpServletResponse response) throws Exception;


}
