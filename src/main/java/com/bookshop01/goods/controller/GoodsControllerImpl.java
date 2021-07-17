package com.bookshop01.goods.controller;

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

import com.bookshop01.common.base.BaseController;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.goods.service.GoodsService;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.mypage.vo.MyPageVO;

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
		Map goodsMap=goodsService.goodsDetail(movie_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		GoodsVO goodsVO=(GoodsVO)goodsMap.get("goodsVO");
		System.out.println("예매율 결과"+goodsMap.get("rate"));
//		addGoodsInQuick(movie_id,goodsVO,session);
		return mav;
	}
	

	@RequestMapping(value= "/goodslist.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView itbooklist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoodssort();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	@RequestMapping(value= "/goodslist1.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView moneybooklist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoodsmoney();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	@RequestMapping(value= "/goodslist2.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView unibooklist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoodsuni();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	@RequestMapping(value= "/goodslist3.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView selfbooklist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoodsself();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	@RequestMapping(value= "/goodslist4.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView scibooklist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoodssci();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	@RequestMapping(value= "/goodslist5.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView historybooklist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session;
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		session=request.getSession();
		session.setAttribute("side_menu", "user");
		Map<String,List<GoodsVO>> goodsMap=goodsService.listGoodshistory();
		mav.addObject("goodsMap", goodsMap);
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
	
	@RequestMapping(value="/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public @ResponseBody String  keywordSearch(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(keyword);
		if(keyword == null || keyword.equals(""))
		   return null ;
	
		keyword = keyword.toUpperCase();
	    List<String> keywordList =goodsService.keywordSearch(keyword);
	    
	 // 최종 완성될 JSONObject 선언(전체)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		 		
	    String jsonInfo = jsonObject.toString();
	   // System.out.println(jsonInfo);
	    return jsonInfo ;
	}
	
	@RequestMapping(value="/searchGoods.do" ,method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		List<GoodsVO> goodsList=goodsService.searchGoods(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
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
		
		HashMap<String,String> reviewmap = new HashMap<String,String>();		
		int review_score2=0;
												
			for(int i=0;i<review_score.length;i++) {
				review_score2 += Integer.parseInt(review_score[i]);			
			}						
				reviewmap.put("member_id",member_id);
				reviewmap.put("review_content",review_content);
				reviewmap.put("movie_title",movie_title);
				reviewmap.put("review_score",Integer.toString(review_score2));
				
			try {
				goodsService.myReview(reviewmap);
				message  = "<script>";
				message +=" alert('작성을 완료했습니다.');";
				message += " location.href='"+request.getContextPath()+"/main/main.do';";
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


	
	
//	private void addGoodsInQuick(String movie_id,GoodsVO goodsVO,HttpSession session){
//		boolean already_existed=false;
//		List<GoodsVO> quickMovieList; //최근 본 상품 저장 ArrayList
//		quickMovieList=(ArrayList<GoodsVO>)session.getAttribute("quickMovieList");
//		
//		if(quickMovieList!=null){
//			if(quickMovieList.size() < 4){ //미리 본 상품 리스트에 상품개수가 세개 이하인 경우
//				for(int i=0; i<quickMovieList.size();i++){
//					GoodsVO _movieBean=(GoodsVO)quickMovieList.get(i);
//					if(movie_id.equals(_movieBean.getGoods_id())){
//						already_existed=true;
//						break;
//					}
//				}
//				if(already_existed==false){
//					quickMovieList.add(goodsVO);
//				}
//			}
//			
//		}else{
//			quickMovieList =new ArrayList<GoodsVO>();
//			quickMovieList.add(goodsVO);
//			
//		}
//		session.setAttribute("quickGoodsList",quickMovieList);
//		session.setAttribute("quickGoodsListNum", quickMovieList.size());
//	}
}
