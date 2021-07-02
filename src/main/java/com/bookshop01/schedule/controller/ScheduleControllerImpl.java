package com.bookshop01.schedule.controller;

import java.io.PrintWriter;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.admin.goods.service.AdminGoodsService;
import com.bookshop01.common.base.BaseController;
import com.bookshop01.goods.service.GoodsService;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.schedule.service.ScheduleService;
import com.bookshop01.schedule.vo.ScheduleVO;

@Controller("scheduleController")
@RequestMapping(value="/schedule")
public class ScheduleControllerImpl extends BaseController  implements ScheduleController{
	@Autowired
	private ScheduleService scheduleService;
	
	@Override
	@RequestMapping("/addNewSchedule.do")
	public ModelAndView addNewSchedule(HttpServletRequest request,HttpServletResponse response)  throws Exception {
		
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		
		List<GoodsVO> titleList=scheduleService.selectTitle();
		mav.addObject("titleList",titleList);
		
		//PrintWriter pr=response.getWriter();
		//pr.print(titleList);
		mav.setViewName(viewName);
		return mav;
		
	}
	
	@Override
	@RequestMapping(value="/addSchedule.do" ,method = RequestMethod.GET)
	public ModelAndView addSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	
	ModelAndView mav = new ModelAndView();
	Map<String,String> scheduleMap=new HashMap<String,String>();
	String movie_id=request.getParameter("movie_id");
	String movie_title=request.getParameter("movie_title");
	String room_number=request.getParameter("room_number");
	String scheule_start_time=request.getParameter("scheule_start_time");
	String schedule_date=request.getParameter("schedule_date");
	scheduleMap.put("movie_id", movie_id);
	scheduleMap.put("movie_title", movie_title);
	scheduleMap.put("room_number", room_number);
	scheduleMap.put("scheule_start_time", scheule_start_time);
	scheduleMap.put("schedule_date", schedule_date);
	
	scheduleService.addSchedule(scheduleMap);
	mav.setViewName("redirect:/admin/member/adminMemberMain.do");
	return mav;
	}
}
