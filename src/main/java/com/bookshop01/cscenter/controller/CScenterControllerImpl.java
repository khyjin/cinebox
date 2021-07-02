package com.bookshop01.cscenter.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.cscenter.service.CScenterService;
import com.bookshop01.cscenter.vo.CscenterVO;

@Controller("cscenterController")
@RequestMapping(value="/cscenter")
public class CScenterControllerImpl implements CScenterController{
	
	@Autowired
	private CScenterService cscenterService;
	
	//cs센터 메인 불러오기
	@Override
	@RequestMapping(value = "/cscenterMain.do")
	public ModelAndView cscenterMain(String message, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menu", "cscenter");
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	
	//분실물 작성 폼으로 가기
	@RequestMapping(value = "/lostItemForm.do")
	public ModelAndView lostitemform(String message, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("side_menu", "cscenter");
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;		
	}
	
	//공지사항 게시판 보기
	@RequestMapping(value="/cscenterNotice.do")
	public ModelAndView noticeList(HttpServletRequest request) {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		try {
			List<CscenterVO> noticeList = cscenterService.noticeList();
			mav.addObject("noticeList", noticeList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;	
		
	}
	
	//관리자 모드에서 공지사항 등록폼으로 가기
	@RequestMapping(value="/noticeRegForm.do")
	public ModelAndView noticeForm(HttpServletRequest request) {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
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
		
		try {
			cscenterService.addNotice(cscenterVO);
			message  = "<script>";
			message +=" alert('글 등록을 완료했습니다.');";
			message += " location.href='"+request.getContextPath()+"/cscenter/cscenterNotice.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/cscenter/noticeRegForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	//공지사항 내용보기
	@Override
	@RequestMapping(value = "/noticeView.do")
	public ModelAndView contentView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		 CscenterVO viewList = cscenterService.content_view(cscenter_number);
		 mav.addObject("viewList", viewList);
		return mav;	
	}

	//공지사항 수정폼 불러오기
	@Override
	@RequestMapping(value="/modifyView.do")
	public ModelAndView modifyView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		CscenterVO updateList = cscenterService.content_modify_view(cscenter_number);
		mav.addObject("ulist", updateList);
		
		return mav;
	}

	//수정기능
	@Override
	@RequestMapping(value = "/modifyNotice.do")
	public ResponseEntity modifyNotice(CscenterVO cscenterVO, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			cscenterService.addNotice(cscenterVO);
			message  = "<script>";
			message +=" alert('글 등록을 완료했습니다.');";
			message += " location.href='"+request.getContextPath()+"/cscenter/cscenterNotice.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/cscenter/noticeRegForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	


}
