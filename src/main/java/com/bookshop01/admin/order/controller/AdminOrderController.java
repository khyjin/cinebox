package com.bookshop01.admin.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.cscenter.vo.SearchCriteria;

public interface AdminOrderController {
	public ModelAndView adminOrderMain(@ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request)  throws Exception;
	public ResponseEntity modifyDeliveryState(@RequestParam Map<String, String> deliveryMap, 
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView orderDetail(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ResponseEntity cancelTicket(@RequestParam("ticket_number_code") int ticket_number_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}
