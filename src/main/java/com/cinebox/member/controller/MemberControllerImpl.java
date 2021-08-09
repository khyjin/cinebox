package com.cinebox.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;

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

import com.cinebox.common.base.BaseController;
import com.cinebox.member.service.MemberService;
import com.cinebox.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends BaseController implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	
	@RequestMapping(value="/loginForm.do")
	public ModelAndView loginform(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("side_menu");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	@RequestMapping(value="/memberForm.do")
	public ModelAndView memberjoinForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("side_menu");
		mav.setViewName(viewName);
		
		return mav;
	}
	
	
	
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
											// id 비밀번호 저장하기
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		ModelAndView mav = new ModelAndView();
		 memberVO=memberService.login(loginMap); //dto에다가 아이디,패스워드를 저장
		if(memberVO!= null && memberVO.getMember_id()!=null){ //dto가 널값이 아니고 가져온 아이디가 널이 아니라면
			HttpSession session=request.getSession(); // 받은 세션(아이디, 패스워드) 가져오기
			session=request.getSession();												
						
				if(memberVO.getMember_del_yn().equals("Y")) {
					session.setAttribute("isLogOn", false); 
					session.setAttribute("memberInfo",memberVO);
					String message="탈퇴한 회원입니다.";
					mav.addObject("message",message);
					mav.setViewName("/member/loginForm");
				}//if끝		
				else {
					session.setAttribute("isLogOn", true); //로그인 상태 true로 두기
					session.setAttribute("memberInfo",memberVO); //vo에서 넘어온 회원정보를 추가			
					mav.setViewName("redirect:/main/main.do");	// 메인 화면 띄우기		
				}//else끝
		}//if끝
		
		else{ //위에서 말하는 조건이 아니라면 실행			
			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/loginForm");
		}//else끝	
		return mav;
		
		}//함수 끝
	
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
	
	//이름,전화번호 ID 찾기 폼
	   @RequestMapping(value="/idsearchview.do" ,method = RequestMethod.POST)
	      public ModelAndView goid(HttpServletRequest hs) throws Exception{
	         ModelAndView mav = new ModelAndView();	         
	         String View= (String) hs.getAttribute("viewName");
	         mav.setViewName(View);	         
       
	         return mav;
	         
	      }
	 //이름,전화번호로 id 찾아 결과 출력
	   @RequestMapping(value="/idsearch.do" ,method = RequestMethod.POST)
	     public ModelAndView goidv(@RequestParam Map<String,String> idsearch,HttpServletRequest rq,
	         HttpServletResponse rs) throws Exception{
		   
	         ModelAndView mav = new ModelAndView();
	         String view = (String)rq.getAttribute("viewName");
	         MemberVO result = memberService.tels(idsearch);
	         mav.addObject("member",result);
	         mav.setViewName(view);
	         
	         if(result == null)
	         {	        	         	 
	        	String message="가입된 회원이 아닙니다. 회원가입을 해주세요.";
	 			mav.addObject("message", message);	   
	 			mav.setViewName("/member/idsearchview");
	         }
	         return mav;
	      }
	   
	 //아이디,이름,전화번호로 PW 찾기 폼
	   @RequestMapping(value="/pwsearchview.do" ,method = RequestMethod.POST)
	      public ModelAndView gopw(HttpServletRequest hs){
	         ModelAndView mav = new ModelAndView();
	         String View= (String) hs.getAttribute("viewName");
	         mav.setViewName(View);
	         return mav;
	      }
	   
	 //아이디,이름,전화번호로 PW 찾아 결과 출력
	   @RequestMapping(value="/pwsearch.do" ,method = RequestMethod.POST)
	     public ModelAndView gopwv(@RequestParam Map<String,String> pwsearch,HttpServletRequest rq,
	         HttpServletResponse rs) throws Exception{
		   
	         ModelAndView mav = new ModelAndView();
	         String view = (String)rq.getAttribute("viewName");
	         MemberVO result = memberService.findpw(pwsearch);
	         mav.addObject("member",result);
	         mav.setViewName(view);
	         
	         if(result == null)
	         {	        	 
	        	String message="아이디를 다시 확인해주세요.";
	 			mav.addObject("message", message);
	 			mav.setViewName("/member/pwsearchview");
	         }
	         return mav;
	      }
	   
		
	
	//회원가입
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
		    message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
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