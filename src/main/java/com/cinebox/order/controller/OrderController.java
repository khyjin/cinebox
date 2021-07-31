package com.cinebox.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;


public interface OrderController {
	
	public ModelAndView orderMovie(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView payToOrderGoods(HttpServletRequest request, HttpServletResponse response)
			throws Exception;
}