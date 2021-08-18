package com.cinebox.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cinebox.goods.dao.GoodsDAO;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.goods.vo.ImageFileVO;
import com.cinebox.mypage.vo.MyPageVO;

@Service("goodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsDAO goodsDAO;
	
	public Map<String,List<GoodsVO>> listGoods() throws Exception {
		Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
		
		List<GoodsVO> goodsList=goodsDAO.selectGoodsList("screening");
		goodsMap.put("screening",goodsList);
		
		goodsList=goodsDAO.selectGoodsList("readysc");
		goodsMap.put("readysc",goodsList);
		
		goodsList=goodsDAO.selectGoodsList("endsc");
		goodsMap.put("endsc",goodsList);
		return goodsMap;
	}
	
	public Map goodsDetail(String movie_id) throws Exception {
		Map goodsMap=new HashMap();
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(movie_id);
		goodsMap.put("goodsVO", goodsVO);
		List<ImageFileVO> imageList =goodsDAO.selectGoodsDetailImage(movie_id);
		goodsMap.put("imageList", imageList);
		List<MyPageVO> reviewList =goodsDAO.selectReviewList(movie_id);
		goodsMap.put("reviewList", reviewList);
		double totalCount =(double)goodsDAO.totalCount();
		double eachCount = (double)goodsDAO.eachCount(movie_id);
		double rate = (eachCount/totalCount*100);
		goodsMap.put("rate", rate);
		
		return goodsMap;
	}
	
	//상영 중인 영화 리스트
	public Map<String, List<GoodsVO>> movieopenlist() throws Exception {
		Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
		List<GoodsVO> goodsList=goodsDAO.movielist("screening");
		goodsMap.put("screening",goodsList);
		return goodsMap;
	}
	
	//상영 예정인 영화 리스트
		public Map<String, List<GoodsVO>> moviereadylist() throws Exception {
			Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
			List<GoodsVO> goodsList=goodsDAO.movielist("readysc");
			goodsMap.put("readysc",goodsList);
			return goodsMap;
	}
	
	//상영 종료된 영화 리스트
		public Map<String, List<GoodsVO>> movieendlist() throws Exception {
			Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
			List<GoodsVO> goodsList=goodsDAO.movielist("endsc");
			goodsMap.put("endsc",goodsList);
			return goodsMap;
	}	
	

	@Override
	public void myReview(HashMap<String,String> reviewmap) throws Exception {
		goodsDAO.myReview(reviewmap);
	}

	
	
}