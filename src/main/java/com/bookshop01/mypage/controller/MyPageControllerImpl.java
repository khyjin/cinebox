package com.bookshop01.mypage.controller;

import java.io.PrintWriter;
import java.util.HashMap;
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

import com.bookshop01.common.base.BaseController;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.mypage.service.MyPageService;
import com.bookshop01.mypage.vo.MyPageVO;
import com.bookshop01.ticket.vo.TicketVO;

@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl extends BaseController  implements MyPageController{
	@Autowired
	private MyPageService myPageService;
	
	TicketVO ticketVO = new TicketVO();
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private CscenterVO cscenterVO;
	
	@Override
	@RequestMapping(value="/myPageMain.do" ,method = RequestMethod.GET)
	public ModelAndView myPageMain(@RequestParam(required = false,value="message")  String message,
			   HttpServletRequest request, HttpServletResponse response)  throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		session.setAttribute("side_menu", "my_page"); //마이페이지 사이드 메뉴로 설정한다.
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		
		List<TicketVO> myOrderList=myPageService.listMyOrderGoods(member_id);
		
		mav.addObject("message", message);
		mav.addObject("myOrderList", myOrderList);

		return mav;
	}
	
	@Override
	@RequestMapping(value="/myOrderDetail.do" ,method = RequestMethod.GET)
	public ModelAndView myOrderDetail(@RequestParam("ticket_number") int ticket_number,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		
		int movie_id = Integer.parseInt(request.getParameter("movie_id"));
		ticketVO.setMovie_id(movie_id);
		
		MemberVO orderer=(MemberVO)session.getAttribute("memberInfo");		
		TicketVO myOrderList=myPageService.findMyOrderInfo(ticket_number);
		
		mav.addObject("orderer", orderer);
		mav.addObject("myOrderList",myOrderList);
		mav.addObject("img", myPageService.getImage(movie_id));
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/cancelMyOrder.do")
	public ResponseEntity cancelMyOrder(@RequestParam("ticket_number")  int ticket_number, HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String member_id=request.getParameter("member_id");
		int ticket_adult = Integer.parseInt(request.getParameter("ticket_adult"));
		int ticket_child = Integer.parseInt(request.getParameter("ticket_child"));
		int used_point = Integer.parseInt(request.getParameter("ticket_used_point"));
		int saving_point = (int) (((ticket_adult*12000)+(ticket_child*10000))*0.05);

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
				
		try {
			myPageService.cancelOrder(ticket_number, member_id, saving_point, used_point);
			message  = "<script>";
			message +=" alert('예매가 취소되었습니다.');";
			message += "location.href='"+request.getContextPath()+"/mypage/myPageMain.do?ticket_number="+ticket_number+"';";
			message += " </script>";
						
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += "location.href='"+request.getContextPath()+"/mypage/myOrderDetail.do?ticket_number="+ticket_number+"';";
		    message += "</script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/myDetailInfo.do" ,method = RequestMethod.GET)
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}	
	
	@Override
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String  member_id=memberVO.getMember_id();
		if(attribute.equals("member_birth")){
			val=value.split(",");
			memberMap.put("member_birth_y",val[0]);
			memberMap.put("member_birth_m",val[1]);
			memberMap.put("member_birth_d",val[2]);
		}else if(attribute.equals("hp")){
			val=value.split(",");
			memberMap.put("member_hp1",val[0]);
			memberMap.put("member_hp2",val[1]);
			memberMap.put("member_hp3",val[2]);
		}else if(attribute.equals("email")){
			val=value.split(",");
			memberMap.put("member_email1",val[0]);
			memberMap.put("member_email2",val[1]);
			memberMap.put("member_email_yn", val[2]);
		}else if(attribute.equals("address")){
			val=value.split(",");
			memberMap.put("member_zip",val[0]);
			memberMap.put("member_roadaddress",val[1]);
			memberMap.put("member_jibunaddress", val[2]);
			memberMap.put("member_namujiaddress", val[3]);
		}else if(attribute.equals("del")){
			val=value.split(",");
			memberMap.put("member_del_yn", val[0]);
		}else {
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("member_id", member_id);
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		memberVO=(MemberVO)myPageService.modifyMyInfo(memberMap);
		session.removeAttribute("memberInfo");
		session.setAttribute("memberInfo", memberVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/myPoint.do" ,method = RequestMethod.GET)
	public ModelAndView myPoint(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	
	
	// 나의 관람평 리스트 출력
	@Override
	@RequestMapping(value="/myReviewList.do",method=RequestMethod.GET)
	public ModelAndView myReviewList(String member_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {	
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		member_id = memberVO.getMember_id();
		List<MyPageVO> myReviewList=myPageService.myReviewList(member_id);		
		mav.addObject("myReviewList", myReviewList);
		return mav;				
	}
	
	//나의 관람평 삭제
		@Override
		@RequestMapping("/deletemyReview.do")
		public String deletemyReview(@RequestParam("review_number") int review_number) throws Exception {
			myPageService.deletemyReview(review_number);
			return "redirect:/main/main.do";
		}
		
	// 나의 1:1 문의 내역 리스트 출력
		@Override
		@RequestMapping(value="/myQnaList.do",method=RequestMethod.GET)
		public ModelAndView myQnaList(String member_id, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			String viewName=(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			member_id=memberVO.getMember_id();
			List<CscenterVO> myQnaList=myPageService.myQnaList(member_id);		
			mav.addObject("myQnaList", myQnaList);
			return mav;				
		}
		
	// 나의 1:1 문의 내역 수정 폼
		
		@Override
		@RequestMapping(value="/myQnaModifyview.do",method=RequestMethod.GET)
		public ModelAndView myQnaModifyview(@RequestParam("cscenter_number") int cscenter_number, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			String viewName=(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			List<CscenterVO> myQnaList=myPageService.myQnaModifyview(cscenter_number);		
			mav.addObject("myQnaList", myQnaList);
			return mav;				
		}
	
	// 나의 1:1 문의 내역 수정
		@Override
		@RequestMapping(value = "/myQnaModify.do")
		public ResponseEntity myQnaModify(@ModelAttribute("cscenterVO") CscenterVO cscenterVO, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
			try {
				myPageService.myQnaModify(cscenterVO);
				message  = "<script>";
				message +=" alert('글 수정을 완료했습니다.');";
				message += " location.href='"+request.getContextPath()+"/mypage/myQnaList.do';";
				message += " </script>";
			} catch (Exception e) {
				message  = "<script>";
			    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			    message += " location.href='"+request.getContextPath()+"/mypage/myQnaList.do';";
			    message += " </script>";
				e.printStackTrace();
			}
			
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
		}
		
	//나의 1:1 문의 삭제
		@Override
		@RequestMapping("/deletemyQna.do")
		public String deletemyQna(@RequestParam("cscenter_number") int cscenter_number) throws Exception {
			myPageService.deletemyQna(cscenter_number);
			return "redirect:/mypage/myQnaList.do";
		}
		
}
