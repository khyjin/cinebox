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
import com.bookshop01.cscenter.vo.SearchCriteria;

@Controller("adminCScenterController")
@RequestMapping(value="/admin/cscenter")
public class AdminCScenterControllerImpl implements AdminCScenterController{
	@Autowired
	private AdminCScenterService adminCScenterService;
	
	//������ ���, 1:1�Խ��� ����+ ����¡ �߰�
	@Override
	@RequestMapping(value="/qnaBoard.do")
	public String qnaList(HttpServletRequest request, SearchCriteria scri, Model model) throws Exception {
		String viewName=(String)request.getAttribute("viewName");

		scri.setSearchType("qna");
		scri.setKeyword("qna_re");		
		
		model.addAttribute("list", adminCScenterService.boardList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminCScenterService.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return viewName;	
	}
	
	//������ ��� �������� ��������� ����
	@RequestMapping(value="/noticeRegForm.do")
	public ModelAndView noticeForm(HttpServletRequest request) {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("reg_form", "notice");
		return mav;	
	}
	
	//������ ��� �����ϴ� ���� ��������� ����
	@RequestMapping(value="/faqRegForm.do")
	public ModelAndView faqRegForm(HttpServletRequest request) {
		String viewName =(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("reg_form", "faq");
		return mav;
	}
	
	
	//������ ��忡�� �������� ���
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
			message +=" alert('���� ���������� ��ϵǾ����ϴ�.');";
			message += " location.href='"+request.getContextPath()+viewName;
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/cscenter/noticeReg.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}


	//������ �������� ������ �ҷ�����
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

	//������ �������
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
			if(cscenterVO.getCscenter_type().equals("faq")) {
				message  = "<script>";
				message +=" alert('�� ������ �Ϸ��߽��ϴ�.');";
				message += " location.href='"+request.getContextPath()+"/cscenter/faqBoard.do';";
				message += " </script>";
			} else {
			message  = "<script>";
			message +=" alert('�� ������ �Ϸ��߽��ϴ�.');";
			message += " location.href='"+request.getContextPath()+"/cscenter/cscenterNotice.do';";
			message += " </script>"; }
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/cscenter/modifyView.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	//������ �� �������
	@Override
	@RequestMapping(value="/deleteNotice.do")
	public ResponseEntity deleteNotice(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String cscenter_type= request.getParameter("cscenter_type");
		String viewName =null;
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
				
		try {
			adminCScenterService.deleteNotice(cscenter_number);
			
			if(cscenter_type.equals("qna")||cscenter_type.equals("qna_re")) {
				message  = "<script>";
				message +=" alert('������ �Ϸ��߽��ϴ�.');";
				message += "location.href='"+request.getContextPath()+"/admin/cscenter/qnaBoard.do';";
				message += " </script>";
			} else if(cscenter_type.equals("notice")) {
				message  = "<script>";
				message +=" alert('������ �Ϸ��߽��ϴ�.');";
				message += "location.href='"+request.getContextPath()+"/cscenter/cscenterNotice.do';";
				message += " </script>";
			} else if(cscenter_type.equals("faq")) {
				message  = "<script>";
				message +=" alert('������ �Ϸ��߽��ϴ�.');";
				message += "location.href='"+request.getContextPath()+"/cscenter/faqBoard.do';";
				message += " </script>";
			}			
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += "location.href='"+request.getContextPath()+"/cscenter/noticeView.do';";
		    message += "</script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	

	//1:1���� ���� ����
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
			message +=" alert('�亯�� �Ϸ��߽��ϴ�.');";
			message += " location.href='"+request.getContextPath()+"/admin/cscenter/qnaBoard.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/admin/cscenter/contentView.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}	
	
	@RequestMapping(value="/rentalBoard.do")
	public ModelAndView rentalBoare(HttpServletRequest request, SearchCriteria scri) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		scri.setSearchType("rental");
		
		mav.addObject("list", adminCScenterService.boardList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminCScenterService.listCount(scri));
		
		mav.addObject("pageMaker", pageMaker);
		
		return mav;	
	}
	
	@RequestMapping(value="/rental_view.do")
	public ModelAndView rentalView(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		CscenterVO content_view = adminCScenterService.content_view(cscenter_number);
		mav.addObject("content_view", content_view);
		
		return mav;
	}

}
