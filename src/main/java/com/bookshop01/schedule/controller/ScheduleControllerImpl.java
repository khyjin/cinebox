package com.bookshop01.schedule.controller;

import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.schedule.service.ScheduleService;
import com.bookshop01.schedule.vo.ScheduleVO;

@Controller("scheduleController")
@RequestMapping(value="/schedule")
public class ScheduleControllerImpl extends BaseController  implements ScheduleController{
	@Autowired
	private ScheduleService scheduleService;
	
	
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
			message +=" alert('�� ����� �Ϸ��߽��ϴ�.');";
			message += " location.href='"+request.getContextPath()+"/schedule/addNewScheduleForm.do';";
			message += " </script>";
		} catch (Exception e) {
			message  = "<script>";
		    message +=" alert('�۾� �� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');";
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
	
}