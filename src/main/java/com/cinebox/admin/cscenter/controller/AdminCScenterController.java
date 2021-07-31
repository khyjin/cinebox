package com.cinebox.admin.cscenter.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cinebox.cscenter.vo.Criteria;
import com.cinebox.cscenter.vo.CscenterVO;
import com.cinebox.cscenter.vo.SearchCriteria;

public interface AdminCScenterController {
	public String qnaList(HttpServletRequest request, SearchCriteria scri, Model model) throws Exception;
	public ResponseEntity noticeReg(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView modifyView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modifyNotice(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletResponse response, HttpServletRequest request) throws Exception;
	public ResponseEntity deleteNotice(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView contentView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity replyWrite(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
