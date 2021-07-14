package com.bookshop01.schedule.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.service.ScheduleService;
import com.bookshop01.schedule.vo.ScheduleVO;

@Controller("scheduleController")
@RequestMapping(value="/schedule")
public class ScheduleControllerImpl extends BaseController  implements ScheduleController{
	@Autowired
	private ScheduleService scheduleService;
	
	@Override
	@RequestMapping(value= "/addNewScheduleForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView goform(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		GoodsVO goodsVO = new GoodsVO();
		List<GoodsVO> goodslist = scheduleService.listGoods();
		mav.addObject("goodslist", goodslist);
		List<ScheduleVO> list=scheduleService.selectSchedule();
		mav.addObject("list", list);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addSchedule.do")
	public ResponseEntity addSchedule(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		String[] schedule_date = request.getParameterValues("schedule_date");
		String[] room_number = request.getParameterValues("room_number");
		String[] movie_title = request.getParameterValues("movie_title");
		String[] schedule_start_time = request.getParameterValues("schedule_start_time");
		
		HashMap<String,String> schedulemap = new HashMap<String,String>();
		
		for(int i=0;i<room_number.length;i++) {
			schedulemap.put("movie_title",movie_title[i]);
			schedulemap.put("room_number",room_number[i]);
			schedulemap.put("schedule_start_time",schedule_start_time[i]);
			schedulemap.put("schedule_date",schedule_date[i]);
			scheduleService.addSchedule(schedulemap);
		}
		try {
			message  = "<script>";
			message +=" alert('글 등록을 완료했습니다.');";
			message += " location.href='"+request.getContextPath()+"/schedule/addNewScheduleForm.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/schedule/addNewScheduleForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}

		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	@Override
	@RequestMapping(value= "/selectSchedule.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView selectSchedule(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session.removeAttribute("side_menu");
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);
		List<ScheduleVO> list=scheduleService.selectSchedule();
		mav.addObject("list", list);
		return mav;
	}
	//삭제하기
	@Override
	@RequestMapping("/deleteSchedule.do")
	public String deleteSchedule(@RequestParam("schedule_id") int schedule_id) throws Exception {
		scheduleService.deleteSchedule(schedule_id);
		return "redirect:/schedule/addNewScheduleForm.do";
	}
	//수정폼으로 넘어가기
	@RequestMapping(value= "/modifyScheduleForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView loadingview(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav=new ModelAndView(viewName);
		List<ScheduleVO> list=scheduleService.selectSchedule();
		mav.addObject("list", list);
		GoodsVO goodsVO = new GoodsVO();
		List<GoodsVO> goodslist = scheduleService.listGoods();
		mav.addObject("goodslist", goodslist);
		return mav;
	}
	//수정하기
	@Override
	@RequestMapping("/modifySchedule.do")
	public String modifySchedule(
			@RequestParam("schedule_id") int schedule_id,
			@RequestParam("movie_title") String movie_title,
			@RequestParam("room_number") String room_number,
			@RequestParam("schedule_start_time") String schedule_start_time,
			@RequestParam("schedule_date") String schedule_date,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String,Object> modimap = new HashMap<String,Object>();
		modimap.put("movie_title",movie_title);
		modimap.put("room_number",room_number);
		modimap.put("schedule_start_time",schedule_start_time);
		modimap.put("schedule_date",schedule_date);
		modimap.put("schedule_id",schedule_id);
		scheduleService.modifySchedule(modimap);
		return "redirect:/schedule/addNewScheduleForm.do";
	}
}