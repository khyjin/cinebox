package com.bookshop01.admin.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.cscenter.vo.SearchCriteria;
import com.bookshop01.ticket.vo.TicketVO;

public interface AdminOrderController {
	public ModelAndView adminOrderMain(@ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request)  throws Exception;
	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap, 
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView orderDetail(@RequestParam("ticket_number") String ticket_number,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ResponseEntity cancelTicket(@RequestParam("ticket_number") String ticket_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modifyResevation(@ModelAttribute("ticketVO") TicketVO ticketVO, HttpServletRequest request, HttpServletResponse response) throws Exception; 
	
}
