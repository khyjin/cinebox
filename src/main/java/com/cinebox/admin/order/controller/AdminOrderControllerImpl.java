package com.cinebox.admin.order.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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

import com.cinebox.admin.goods.service.AdminGoodsService;
import com.cinebox.admin.order.service.AdminOrderService;
import com.cinebox.common.base.BaseController;
import com.cinebox.cscenter.vo.PageMaker;
import com.cinebox.cscenter.vo.SearchCriteria;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.goods.vo.ImageFileVO;
import com.cinebox.member.vo.MemberVO;
import com.cinebox.mypage.controller.MyPageController;
import com.cinebox.mypage.service.MyPageService;
import com.cinebox.schedule.vo.ScheduleVO;
import com.cinebox.ticket.vo.TicketVO;

@Controller("adminOrderController")
@RequestMapping(value="/admin/order")
public class AdminOrderControllerImpl extends BaseController  implements AdminOrderController{
	@Autowired
	private AdminOrderService adminOrderService;
	
	@Override
	@RequestMapping(value="/adminOrderMain.do" ,method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminOrderMain(@ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request)  throws Exception {
		
		List<TicketVO> ticketList = adminOrderService.listNewOrder(scri);
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminOrderService.listCount(scri));
		
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("ticketList", ticketList);
		return mav;
		
	}
	
	@Override
	@RequestMapping(value="/orderDetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderDetail(@RequestParam("ticket_number") int ticket_number,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		mav.addObject("list", adminOrderService.selectReservation(ticket_number));
		
		return mav;
	}	
	
	@Override
	@RequestMapping(value="/cancelTicket.do")
	public ResponseEntity cancelTicket(@RequestParam("ticket_number") int ticket_number, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
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
			adminOrderService.cancleTicket(ticket_number, member_id, saving_point, used_point);
			message  = "<script>";
			message +=" alert('?????? ??????????????.');";
			message += "location.href='"+request.getContextPath()+"/admin/order/orderDetail.do?ticket_number="+ticket_number+"';";
			message += " </script>";
						
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('???? ?? ?????? ????????????. ???? ?????? ??????');";
		    message += "location.href='"+request.getContextPath()+"/admin/order/orderDetail.do?ticket_number="+ticket_number+"';";
		    message += "</script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	@Override
	@RequestMapping(value="/modifyReservation.do", method = RequestMethod.POST)
	public ResponseEntity modifyResevation(@ModelAttribute("ticketVO") TicketVO ticketVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		int total_price = ticketVO.getTicket_adult()*10000+ticketVO.getTicket_child()*8000-ticketVO.getTicket_used_point();
		ticketVO.setTicket_total_price(total_price);
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		TicketVO forPoint = adminOrderService.selectReservation(ticketVO.getTicket_number());
		
		//?????? ?????????? ??????
		int point = (int)(forPoint.getTicket_total_price()*0.1);
		try {
			adminOrderService.modifyReservation(ticketVO,point);
			message  = "<script>";
			message +=" alert('?????????? ??????????????.');";
			message += "location.href='"+request.getContextPath()+"/admin/order/orderDetail.do?ticket_number="+ticketVO.getTicket_number()+"';";
			message += " </script>";
						
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('???? ?? ?????? ????????????. ???? ?????? ??????');";
		    message += "location.href='"+request.getContextPath()+"/admin/order/orderDetail.do?ticket_number="+ticketVO.getTicket_number()+"';";
		    message += "</script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}



	

	
}
