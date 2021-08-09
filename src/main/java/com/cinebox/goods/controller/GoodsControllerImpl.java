package com.cinebox.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cinebox.common.base.BaseController;
import com.cinebox.cscenter.vo.CscenterVO;
import com.cinebox.goods.service.GoodsService;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.member.vo.MemberVO;
import com.cinebox.mypage.vo.MyPageVO;
import com.cinebox.ticket.vo.TicketVO;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends BaseController   implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="/goodsDetail.do" ,method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("movie_id") String movie_id,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		session.removeAttribute("side_menu");
		GoodsVO goodVO = new GoodsVO();
		String movie_title = goodVO.getMovie_title();
		System.out.println(movie_title);
		Map goodsMap=goodsService.goodsDetail(movie_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		GoodsVO goodsVO=(GoodsVO)goodsMap.get("goodsVO");
		System.out.println("예매율 결과"+goodsMap.get("rate"));
//		addGoodsInQuick(movie_id,goodsVO,session);
		return mav;
	}
	
	
	//상영 중인 영화 리스트 조회
	@RequestMapping(value= "/movieopen.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView movieOpenList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.movieopenlist();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	//상영 예정된 영화 리스트 조회 
		@RequestMapping(value= "/moviescheduled.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView movieScheduledList(HttpServletRequest request, HttpServletResponse response) throws Exception{
			HttpSession session;
			ModelAndView mav=new ModelAndView();
			String viewName=(String)request.getAttribute("viewName");
			mav.setViewName(viewName);
			
			session=request.getSession();
			session.setAttribute("side_menu", "user");
			Map<String,List<GoodsVO>> goodsMap=goodsService.moviereadylist();
			mav.addObject("goodsMap", goodsMap);
			return mav;
		}
	
	//상영 종료된 영화 리스트 조회 
	@RequestMapping(value= "/movieclosed.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView movieClosedList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.movieendlist();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	

	@Override
	@RequestMapping(value="/myReview.do", method = RequestMethod.POST)
	public ResponseEntity myReview(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		
		String member_id = request.getParameter("member_id");
		String review_content = request.getParameter("review_content");
		String movie_title = request.getParameter("movie_title");
		String[] review_score = request.getParameterValues("review_score"); 
		String movie_id = request.getParameter("movie_id"); 
		
		HashMap<String,String> reviewmap = new HashMap<String,String>();		
		int review_score2=0;
												
			for(int i=0;i<review_score.length;i++) {
				review_score2 += Integer.parseInt(review_score[i]);			
			}						
				reviewmap.put("member_id",member_id);
				reviewmap.put("review_content",review_content);
				reviewmap.put("movie_title",movie_title);
				reviewmap.put("review_score",Integer.toString(review_score2));
				reviewmap.put("movie_id",movie_id);
				
			try {
				goodsService.myReview(reviewmap);
				message  = "<script>";
				message +=" alert('작성을 완료했습니다.');";
				message += " location.href='"+request.getContextPath()+"/goods/goodsDetail.do?movie_id="+movie_id+"';";
				message += " </script>";
			} catch (Exception e) {
				message  = "<script>";
			    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			    message += " location.href='"+request.getContextPath()+"/goods/goodsDetail.do';";
			    message += " </script>";
				e.printStackTrace();
			}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;		
	}
}
