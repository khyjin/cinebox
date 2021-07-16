package com.bookshop01.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.order.service.OrderService;
import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.schedule.vo.ScheduleVO;
import com.bookshop01.ticket.vo.TicketVO;

@Controller("orderController")
@RequestMapping(value="/order")
public class OrderControllerImpl extends BaseController implements OrderController {
	@Autowired
	private OrderService orderService;
	
	TicketVO ticketVO = new TicketVO();
	
	// 결제 페이지로 정보 넘기기
	@Override
	@RequestMapping(value="/orderMovie.do" )
	public ModelAndView orderMovie (HttpServletRequest request, HttpServletResponse response)  throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		
		String seat_number=request.getParameter("seat_number");
		int movie_id = Integer.parseInt(request.getParameter("movie_id"));
		String movie_title = request.getParameter("movie_title");
		String room_number = request.getParameter("room_number");
		String ticket_movie_day = request.getParameter("ticket_movie_day");
		String ticket_start_time = request.getParameter("ticket_start_time");
		int ticket_total_price = Integer.parseInt(request.getParameter("ticket_total_price"));
		int ticket_adult = Integer.parseInt(request.getParameter("ticket_adult"));
		int ticket_child = Integer.parseInt(request.getParameter("ticket_child"));
		
		ticketVO.setSeat_number(seat_number);
		ticketVO.setMovie_id(movie_id);
		ticketVO.setMovie_title(movie_title);
		ticketVO.setRoom_number(room_number);
		ticketVO.setTicket_movie_day(ticket_movie_day);
		ticketVO.setTicket_start_time(ticket_start_time);
		ticketVO.setTicket_total_price(ticket_total_price);
		ticketVO.setTicket_adult(ticket_adult);
		ticketVO.setTicket_child(ticket_child);
		mav.addObject("list", ticketVO);
		
		MemberVO memberInfo=(MemberVO)session.getAttribute("memberInfo");
		session.setAttribute("orderer", memberInfo);
		return mav;

		}	
	
	//입력 및 결과 전송
	@Override
	@ResponseBody
	@RequestMapping(value="/payToOrderGoods.do" )
	public ModelAndView payToOrderGoods(HttpServletRequest request, HttpServletResponse response)  throws Exception{
		
		response.setCharacterEncoding("utf-8");
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);	
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("orderer");
		
		MemberVO memberInfo=(MemberVO)session.getAttribute("memberInfo");
		session.setAttribute("orderer", memberInfo);
		
		int movie_id = Integer.parseInt(request.getParameter("movie_id"));
		String movie_title = request.getParameter("movie_title");
		int ticket_adult = Integer.parseInt(request.getParameter("ticket_adult"));
		int ticket_child = Integer.parseInt(request.getParameter("ticket_child"));
		String ticket_start_time = request.getParameter("ticket_start_time");
		String seat_number=request.getParameter("seat_number");
		String room_number = request.getParameter("room_number");
		String ticket_movie_day = request.getParameter("ticket_movie_day");
		String ticket_card_company = request.getParameter("ticket_card_company");
		String ticket_card_month = request.getParameter("ticket_card_month");
		String ticket_pay_method = request.getParameter("ticket_pay_method");
		String ticket_phone_number1 = request.getParameter("ticket_phone_number1");
		String ticket_phone_number2 = request.getParameter("ticket_phone_number2");
		String ticket_phone_number3 = request.getParameter("ticket_phone_number3");
		int ticket_total_price = Integer.parseInt(request.getParameter("ticket_total_price"));
		int ticket_used_point = Integer.parseInt(request.getParameter("ticket_used_point"));
		String memeber_id = request.getParameter("memeber_id");
	
		ticketVO.setMember_id(memberInfo.getMember_id());
		ticketVO.setMovie_id(movie_id);
		ticketVO.setMovie_title(movie_title);
		ticketVO.setTicket_adult(ticket_adult);
		ticketVO.setTicket_child(ticket_child);
		ticketVO.setTicket_start_time(ticket_start_time);
		ticketVO.setSeat_number(seat_number);
		ticketVO.setRoom_number(room_number);
		ticketVO.setTicket_movie_day(ticket_movie_day);
		ticketVO.setTicket_card_company(ticket_card_company);
		ticketVO.setTicket_card_month(ticket_card_month);
		ticketVO.setTicket_pay_method(ticket_pay_method);
		ticketVO.setTicket_phone_number1(ticket_phone_number1);
		ticketVO.setTicket_phone_number2(ticket_phone_number2);
		ticketVO.setTicket_phone_number3(ticket_phone_number3);
		ticketVO.setTicket_total_price(ticket_total_price);
		ticketVO.setTicket_used_point(ticket_used_point);
		mav.addObject("list", ticketVO);
		
		orderService.addNewOrder(ticketVO);
		return mav;
	}
		

	

}
