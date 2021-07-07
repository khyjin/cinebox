package com.bookshop01.schedule.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookshop01.common.base.BaseController;
import com.bookshop01.schedule.service.ScheduleService;

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
}