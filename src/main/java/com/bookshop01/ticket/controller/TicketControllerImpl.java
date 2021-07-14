package com.bookshop01.ticket.controller;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.ticket.service.TicketService;


@Controller("ticketController")
@RequestMapping(value="/ticket")
public class TicketControllerImpl extends BaseController implements TicketController {
	@Autowired
	 private TicketService ticketService;

	@Override
	@RequestMapping(value= "/reservarion.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView selectMovieList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("side_menu");
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		List<GoodsVO> list = ticketService.listGoods();
		mav.addObject("list", list);
		return mav;		
	}
	
	//¿¬½À
	   @RequestMapping(value="/seat.do" ,method = RequestMethod.GET)
	   public ModelAndView NewFile(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      String viewName=(String)request.getAttribute("viewName");
	      ModelAndView mav = new ModelAndView(viewName);
	      return mav;
	      
	   }
}
