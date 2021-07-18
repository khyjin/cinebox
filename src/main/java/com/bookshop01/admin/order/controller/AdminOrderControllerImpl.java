package com.bookshop01.admin.order.controller;

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

import com.bookshop01.admin.goods.service.AdminGoodsService;
import com.bookshop01.admin.order.service.AdminOrderService;
import com.bookshop01.common.base.BaseController;
import com.bookshop01.cscenter.vo.PageMaker;
import com.bookshop01.cscenter.vo.SearchCriteria;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.goods.vo.ImageFileVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.mypage.controller.MyPageController;
import com.bookshop01.mypage.service.MyPageService;
import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.schedule.vo.ScheduleVO;
import com.bookshop01.ticket.vo.TicketVO;

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
		int ticket_total_price = Integer.parseInt(request.getParameter("ticket_total_price"));
		int used_point = Integer.parseInt(request.getParameter("ticket_used_point"));
		int saving_point = (int) (ticket_total_price*0.1);
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
				
		try {
			adminOrderService.cancleTicket(ticket_number, member_id, saving_point, used_point);
			message  = "<script>";
			message +=" alert('예매가 취소되었습니다.');";
			message += "location.href='"+request.getContextPath()+"/admin/order/orderDetail.do?ticket_number="+ticket_number+"';";
			message += " </script>";
						
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
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
		
		//기존에 적립되었던 적립금
		int point = (int)(forPoint.getTicket_total_price()*0.1);
		try {
			adminOrderService.modifyReservation(ticketVO,point);
			message  = "<script>";
			message +=" alert('예매내역이 수정되었습니다.');";
			message += "location.href='"+request.getContextPath()+"/admin/order/orderDetail.do?ticket_number="+ticketVO.getTicket_number()+"';";
			message += " </script>";
						
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += "location.href='"+request.getContextPath()+"/admin/order/orderDetail.do?ticket_number="+ticketVO.getTicket_number()+"';";
		    message += "</script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}



	

	
}
