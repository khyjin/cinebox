package com.bookshop01.member.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.member.service.MemberService;
import com.bookshop01.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
											// id ��й�ȣ �����ϱ�
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		 memberVO=memberService.login(loginMap); //dto���ٰ� ���̵�,�н����带 ����
		if(memberVO!= null && memberVO.getMember_id()!=null){ //dto�� �ΰ��� �ƴϰ� ������ ���̵� ���� �ƴ϶��
			HttpSession session=request.getSession(); // ���� ����(���̵�, �н�����) ��������
			session=request.getSession();
			session.setAttribute("isLogOn", true); //�α��� ���� true�� �α�
			session.setAttribute("memberInfo",memberVO); //vo���� �Ѿ�� ȸ�������� �߰�
			
			String action=(String)session.getAttribute("action"); // �α��� �� �ֹ� ���¶�� ��� �ֹ�
			if(action!=null && action.equals("/order/orderEachGoods.do")){ //������ ���̰ų� �ֹ� ���°� �ƴ϶��
				mav.setViewName("forward:"+action);
			}else{
				mav.setViewName("redirect:/main/main.do");	// ���� ȭ�� ����
			}
			
		}else{ //������ ���ϴ� ������ �ƴ϶�� ����
			String message="���̵�  ��й�ȣ�� Ʋ���ϴ�. �ٽ� �α������ּ���";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session=request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mav.setViewName("redirect:/main/main.do");
		return mav;
	}
	
	//��ȭ��ȣ ID ã�� ��
	   @RequestMapping(value="/idsearchview.do" ,method = RequestMethod.POST)
	      public ModelAndView goid(HttpServletRequest hs){
	         ModelAndView mav = new ModelAndView();
	         String View= (String) hs.getAttribute("viewName");
	         mav.setViewName(View);
	         return mav;
	      }
	 //��ȭ��ȣ�� id ã�� ��� ���
	   @RequestMapping(value="/idsearch.do" ,method = RequestMethod.POST)
	     public ModelAndView goidv(@RequestParam Map<String,String> tel,HttpServletRequest rq,
	         HttpServletResponse rs) throws Exception{

	         ModelAndView mav = new ModelAndView();
	         String view = (String)rq.getAttribute("viewName");
	         MemberVO result = memberService.tels(tel);
	         mav.addObject("member",result);
	         mav.setViewName(view);
	         return mav;
	      }
	   
		//�̸����� ID ã�� ��
	   @RequestMapping(value="/namesearchview.do" ,method = RequestMethod.POST)
	      public ModelAndView goname(HttpServletRequest hs){
	         ModelAndView mav = new ModelAndView();
	         String View= (String) hs.getAttribute("viewName");
	         mav.setViewName(View);
	         return mav;
	      }
	 //�̸����� id ã�� ��� ���
	   @RequestMapping(value="/namesearch.do" ,method = RequestMethod.POST)
	     public ModelAndView gonamev(@RequestParam Map<String,String> name,HttpServletRequest rq, HttpServletResponse rs) throws Exception{

	         ModelAndView mav = new ModelAndView();
	         String view = (String)rq.getAttribute("viewName");
	         MemberVO result = memberService.name(name);
	         mav.addObject("member",result);
	         mav.setViewName(view);
	         return mav;
	      }
	
	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
			                HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    memberService.addMember(_memberVO);
		    message  = "<script>";
		    message +=" alert('ȸ�� ������ ���ƽ��ϴ�.�α���â���� �̵��մϴ�.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	
	
	
}