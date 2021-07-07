package com.bookshop01.cscenter.controller;

import java.io.Console;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.cscenter.service.CScenterService;
import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.cscenter.vo.PageMaker;

@Controller("cscenterController")
@RequestMapping(value="/cscenter")
public class CScenterControllerImpl implements CScenterController{
	
	@Autowired
	private CScenterService cscenterService;
	
	//cs���� ���� �ҷ�����
	@Override
	@RequestMapping(value = "/cscenterMain.do")
	public ModelAndView cscenterMain(String message, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("side_menu", "cscenter");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("main",cscenterService.mainNotice());
		return mav;
	}
	
	//�нǹ� �ۼ� ������ ����
	@RequestMapping(value = "/lostItemForm.do")
	public ModelAndView lostitemform(String message, HttpServletRequest request) {
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;		
	}
	
	//1:1���� �ۼ���
	@RequestMapping(value="/qnaForm.do")
	public ModelAndView qnaForm(HttpServletRequest request) {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	
	//1:1���� �Է�
	@Override
//	@RequestMapping(value="/addQna.do", method = RequestMethod.POST)
	public ResponseEntity addQna(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			cscenterService.sendQna(cscenterVO);
			message  = "<script>";
			message +=" alert('�� ����� �Ϸ��߽��ϴ�.\n �ִ��� ���� �亯�ص帮�ڽ��ϴ�.');";
			message += " location.href='"+request.getContextPath()+"/cscenter/cscenterMain.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/cscenter/noticeRegForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;		
	}
	
	
	//1:1���� ������ ��� redirect �̿�, alertâ X
	@RequestMapping(value="/addQna.do", method = RequestMethod.POST)
	public ModelAndView saveQna(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName="redirect:/cscenter/cscenterMain.do";
		ModelAndView mav = new ModelAndView(viewName);
		cscenterService.sendQna(cscenterVO);
		return mav;
	}
	
	
	//�������� �Խ��� ����
	@RequestMapping(value="/cscenterNotice.do")
	public ModelAndView noticeList(HttpServletRequest request, Criteria cri) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);		
		List<CscenterVO> boardList = cscenterService.noticeList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cscenterService.listCount("notice"));
		
		mav.addObject("boardList", boardList);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;	
	}
	
	
	//�������� ���뺸��
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
	
	
	//�����ϴ� ���� �Խ��� ����
	@Override
	@RequestMapping(value="/faqBoard.do")
	public ModelAndView faqList(HttpServletRequest request, Criteria cri) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);		
		List<CscenterVO> boardList = cscenterService.faqList(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cscenterService.listCount("faq"));
		
		mav.addObject("boardList", boardList);
		mav.addObject("pageMaker", pageMaker);			

		return mav;	
	}
	
	
	


}
