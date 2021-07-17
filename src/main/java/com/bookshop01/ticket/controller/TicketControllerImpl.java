  
package com.bookshop01.ticket.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.schedule.vo.ScheduleVO;
import com.bookshop01.ticket.service.TicketService;


@Controller("ticketController")
@RequestMapping(value="/ticket")
public class TicketControllerImpl extends BaseController implements TicketController {
   @Autowired
    private TicketService ticketService;


   @Override
   @RequestMapping(value= "/reservation.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView selectMovieList(HttpServletRequest request, HttpServletResponse response) throws Exception {
      HttpSession session = request.getSession();
      session.removeAttribute("side_menu");
      ModelAndView mav=new ModelAndView();
      String viewName=(String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      
      List<ScheduleVO> list = ticketService.listMovieTitle();
      mav.addObject("list", list);
      return mav;
      
   }

	@Override
	@ResponseBody
	@RequestMapping(value="/makeTicket.do", method = RequestMethod.POST)
	public HashMap<String, Object> makeTicket(@RequestParam("movie_id") int movie_id, @RequestParam("movie_title") String movie_title, Model model) throws Exception {
		
		List<ScheduleVO> list = ticketService.listTicke(movie_id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", list);
		return map;		
	}
	
	@ResponseBody
	@RequestMapping(value="/makeTicketDate.do", method = RequestMethod.POST)
	public HashMap<String, Object> makeTicketDate(@RequestParam("movie_id") int movie_id, @RequestParam("schedule_date") String schedule_date) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("movie_id", movie_id);
		map.put("schedule_date", schedule_date);
		map.put("time", ticketService.listMovieTitme(map));
		
		return map;
	}

	@RequestMapping(value="/seat.do")
	public ModelAndView roomNumber(HttpServletRequest request) throws Exception {
		String viewName=null;

		String movie_id = request.getParameter("movie_id");
		String movie_title = request.getParameter("movie_title");
		String schedule_date = request.getParameter("schedule_date");
		String schedule_start_time = request.getParameter("schedule_start_time");
		String room_number = request.getParameter("room_number");
		
		if(room_number.equals("1")) {
			viewName = "redirect:/ticket/room1.do";
		} else if(room_number.equals("2")) {
			viewName = "redirect:/ticket/room2.do";
		} else if(room_number.equals("3")){
			viewName = "redirect:/ticket/room3.do";
		}
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("movie_id", movie_id);
		mav.addObject("movie_title", movie_title);
		mav.addObject("room_number", room_number);
		mav.addObject("schedule_date", schedule_date);
		mav.addObject("schedule_start_time", schedule_start_time);
		
		return mav;
	}
	
	
	@RequestMapping(value="/room1.do" ,method = RequestMethod.GET)
	public ModelAndView printSeat1(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		String movie_id = request.getParameter("movie_id");
		String movie_title = request.getParameter("movie_title");
		String schedule_date = request.getParameter("schedule_date");
		String schedule_start_time = request.getParameter("schedule_start_time");
		String room_number = request.getParameter("room_number");
		
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setMovie_id(movie_id);
		scheduleVO.setMovie_title(movie_title);
		scheduleVO.setRoom_number(room_number);
		scheduleVO.setSchedule_date(schedule_date);
		scheduleVO.setSchedule_start_time(schedule_start_time);
		mav.addObject("list", scheduleVO);
		return mav;
		
	}

	@RequestMapping(value="/room2.do" ,method = RequestMethod.GET)
	public ModelAndView printSeat2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		String movie_id = request.getParameter("movie_id");
		String movie_title = request.getParameter("movie_title");
		String schedule_date = request.getParameter("schedule_date");
		String schedule_start_time = request.getParameter("schedule_start_time");
		String room_number = request.getParameter("room_number");
		
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setMovie_id(movie_id);
		scheduleVO.setMovie_title(movie_title);
		scheduleVO.setRoom_number(room_number);
		scheduleVO.setSchedule_date(schedule_date);
		scheduleVO.setSchedule_start_time(schedule_start_time);
		mav.addObject("list", scheduleVO);
		return mav;
		
	}
	
	@RequestMapping(value="/room3.do" ,method = RequestMethod.GET)
	public ModelAndView printSeat3(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		String movie_id = request.getParameter("movie_id");
		String movie_title = request.getParameter("movie_title");
		String schedule_date = request.getParameter("schedule_date");
		String schedule_start_time = request.getParameter("schedule_start_time");
		String room_number = request.getParameter("room_number");
		
		ScheduleVO scheduleVO = new ScheduleVO();
		scheduleVO.setMovie_id(movie_id);
		scheduleVO.setMovie_title(movie_title);
		scheduleVO.setRoom_number(room_number);
		scheduleVO.setSchedule_date(schedule_date);
		scheduleVO.setSchedule_start_time(schedule_start_time);
		mav.addObject("list", scheduleVO);
		return mav;
	}
   

   
}