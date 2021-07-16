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
	@RequestMapping(value="/modifyDeliveryState.do" ,method={RequestMethod.POST})
	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap, 
			                        HttpServletRequest request, HttpServletResponse response)  throws Exception {
		adminOrderService.modifyDeliveryState(deliveryMap);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
		
	}
	
	@Override
	@RequestMapping(value="/orderDetail.do", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("side_menu", "admin_mode");
//		Map orderMap =adminOrderService.orderDetail(order_id);
//		mav.addObject("orderMap", orderMap);
		return mav;
	}

	@Override
	@RequestMapping(value="/ticketCancel.do")
	public ResponseEntity cancelTicket(@RequestParam("ticket_number_code")int ticket_number_code, HttpServletRequest request, HttpServletResponse response)
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
			adminOrderService.cancleTicket(ticket_number_code);
			message  = "<script>";
			message +=" alert('삭제를 완료했습니다.');";
			message += "location.href='"+request.getContextPath()+"/admin/order/adminOrderMain.do';";
			message += " </script>";
						
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += "location.href='"+request.getContextPath()+"/cscenter/noticeView.do';";
		    message += "</script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
}
