package com.bookshop01.order.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.order.vo.OrderVO;

public interface OrderController {
	
	public ModelAndView orderMovie(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView payToOrderGoods(HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
