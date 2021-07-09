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
import com.bookshop01.order.vo.OrderVO;

@Controller("myPageController")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl extends BaseController  implements MyPageController{
	@Autowired
	private MyPageService myPageService;
	
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
		
		List<OrderVO> myOrderList=myPageService.listMyOrderGoods(member_id);
		
		mav.addObject("message", message);
		mav.addObject("myOrderList", myOrderList);

		return mav;
	}
	
	@Override
	@RequestMapping(value="/myOrderDetail.do" ,method = RequestMethod.GET)
	public ModelAndView myOrderDetail(@RequestParam("order_id")  String order_id,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO orderer=(MemberVO)session.getAttribute("memberInfo");
		
		List<OrderVO> myOrderList=myPageService.findMyOrderInfo(order_id);
		mav.addObject("orderer", orderer);
		mav.addObject("myOrderList",myOrderList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/listMyOrderHistory.do" ,method = RequestMethod.GET)
	public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap,
			                               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String  member_id=memberVO.getMember_id();
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		dateMap.put("member_id", member_id);
		List<OrderVO> myOrderHistList=myPageService.listMyOrderHistory(dateMap);
		
		String beginDate1[]=beginDate.split("-"); //검색일자를 년,월,일로 분리해서 화면에 전달합니다.
		String endDate1[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate1[0]);
		mav.addObject("endMonth",endDate1[1]);
		mav.addObject("endDay",endDate1[2]);
		mav.addObject("myOrderHistList", myOrderHistList);
		return mav;
	}	
	
	@Override
	@RequestMapping(value="/cancelMyOrder.do" ,method = RequestMethod.POST)
	public ModelAndView cancelMyOrder(@RequestParam("order_id")  String order_id,
			                         HttpServletRequest request, HttpServletResponse response)  throws Exception {
		ModelAndView mav = new ModelAndView();
		myPageService.cancelOrder(order_id);
		mav.addObject("message", "cancel_order");
		mav.setViewName("redirect:/mypage/myPageMain.do");
		return mav;
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
		member_id=memberVO.getMember_id();
		List<MyPageVO> myReviewList=myPageService.myReviewList(member_id);		
		mav.addObject("myReviewList", myReviewList);
		return mav;				
	}
	
	//나의 관람평 삭제
		@Override
		@RequestMapping("/deletemyReview.do")
		public String deletemyReview(@RequestParam("review_number") int review_number) throws Exception {
			myPageService.deletemyReview(review_number);
			return "redirect:/mypage/myReviewList.do";
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
}
