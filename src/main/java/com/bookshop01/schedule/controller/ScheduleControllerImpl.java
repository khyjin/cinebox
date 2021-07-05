package com.bookshop01.schedule.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
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
import com.bookshop01.cscenter.vo.CscenterVO;
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
	
	//������ ������ ����
	@Override
	@RequestMapping("/addNewSchedule.do")
	public ModelAndView addNewSchedule(HttpServletRequest request,HttpServletResponse response)  throws Exception {
		
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		List<GoodsVO> titleList=new ArrayList<GoodsVO>();
		titleList=scheduleService.selectTitle();
		mav.addObject("titleList",titleList);
		
		return mav;
		
	}
	//�󿵽ð�ǥ �Է��ϱ�
	@Override
	@RequestMapping(value="/addSchedule.do")
	public ResponseEntity addSchedule(@ModelAttribute("ScheduleVO") ScheduleVO scheduleVO, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		try {
			scheduleService.addSchedule(scheduleVO);
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
}
