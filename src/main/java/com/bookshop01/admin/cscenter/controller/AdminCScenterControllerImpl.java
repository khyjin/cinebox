package com.bookshop01.admin.cscenter.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.admin.cscenter.service.AdminCScenterService;
import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.cscenter.vo.PageMaker;

@Controller("adminCScenterController")
@RequestMapping(value="/admin/cscenter")
public class AdminCScenterControllerImpl implements AdminCScenterController{
	@Autowired
	private AdminCScenterService adminCScenterService;
	
	//관리자 모드, 1:1게시판 가기+ 페이징 추가
	@Override
	@RequestMapping(value="/qnaBoard.do")
	public String qnaList(HttpServletRequest request, Criteria cri, Model model) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
				
		model.addAttribute("list", adminCScenterService.boardList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminCScenterService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return viewName;	
	}
	
	//관리자 모드 공지사항 등록폼으로 가기
	@RequestMapping(value="/noticeRegForm.do")
	public ModelAndView noticeForm(HttpServletRequest request) {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("reg_form", "notice");
		return mav;	
	}
	
	//관리자 모드 자주하는 질문 등록폼으로 가기
	@RequestMapping(value="/faqRegForm.do")
	public ModelAndView faqRegForm(HttpServletRequest request) {
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("reg_form", "faq");
		return mav;
	}
	
	
	//관리자 모드에서 공지사항 등록
	@Override
	@RequestMapping(value="/noticeReg.do")
	public ResponseEntity noticeReg(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		String viewName = null;
		if(cscenterVO.getCscenter_type().equals("notice")) {
			viewName = "/cscenter/cscenterNotice.do';";
		}
		else {
			viewName = "/cscenter/faqBoard.do';";
		}
		
		try {
			adminCScenterService.addNotice(cscenterVO);
			message  = "<script>";
			message +=" alert('글이 정상적으로 등록되었습니다.');";
			message += " location.href='"+request.getContextPath()+viewName;
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/cscenter/noticeReg.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}


	//관리자 공지사항 수정폼 불러오기
	@Override
	@RequestMapping(value="/modifyView.do")
	public ModelAndView modifyView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		CscenterVO updateList = adminCScenterService.content_modify_view(cscenter_number);
		mav.addObject("ulist", updateList);
		
		return mav;
	}

	//관리자 수정기능
	@Override
	@RequestMapping(value = "/modifyNotice.do")
	public ResponseEntity modifyNotice(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			adminCScenterService.updateNotice(cscenterVO);
			message  = "<script>";
			message +=" alert('글 수정을 완료했습니다.');";
			message += " location.href='"+request.getContextPath()+"/cscenter/cscenterNotice.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/cscenter/modifyView.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	//관리자 글 삭제기능
	@Override
	@RequestMapping(value="/deleteNotice.do")
	public ResponseEntity deleteNotice(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			adminCScenterService.deleteNotice(cscenter_number);
			message  = "<script>";
			message +=" alert('삭제를 완료했습니다.');";
			message += " location.href='"+request.getContextPath()+"/cscenter/cscenterNotice.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/cscenter/noticeView.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	//1:1문의 내용 보기
	@Override
	@RequestMapping(value="/contentView.do")
	public ModelAndView contentView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		CscenterVO content_view = adminCScenterService.content_view(cscenter_number);
		mav.addObject("content_view", content_view);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/replyWrite.do")
	public ResponseEntity replyWrite(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			adminCScenterService.reply_write(cscenterVO);
			message  = "<script>";
			message +=" alert('답변을 완료했습니다.');";
			message += " location.href='"+request.getContextPath()+"/admin/cscenter/qnaBoard.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/admin/cscenter/contentView.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	


}
