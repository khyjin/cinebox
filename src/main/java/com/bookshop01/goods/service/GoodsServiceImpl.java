package com.bookshop01.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.goods.dao.GoodsDAO;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.goods.vo.ImageFileVO;
import com.bookshop01.mypage.vo.MyPageVO;

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
	
	//it/인터넷
	public Map<String,List<GoodsVO>> listGoodssort() throws Exception {
		Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
		List<GoodsVO> goodsList=goodsDAO.selectGoodsListsort("it");
		goodsMap.put("it",goodsList);
		return goodsMap;
	}
	
	//경제
		public Map<String,List<GoodsVO>> listGoodsmoney() throws Exception {
			Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
			List<GoodsVO> goodsList=goodsDAO.selectGoodsListsort("MONEY");
			goodsMap.put("MONEY",goodsList);
			return goodsMap;
		}
	//대학교재
		public Map<String,List<GoodsVO>> listGoodsuni() throws Exception {
			Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
			List<GoodsVO> goodsList=goodsDAO.selectGoodsListsortuni("UNI");
			goodsMap.put("UNI",goodsList);
			return goodsMap;
		}
	//자기계발
		public Map<String, List<GoodsVO>> listGoodsself() throws Exception {
			Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
			List<GoodsVO> goodsList=goodsDAO.selectGoodsListsortself("SELF");
			goodsMap.put("SELF",goodsList);
			return goodsMap;
		}
		
	//자연과학
		public Map<String,List<GoodsVO>> listGoodssci() throws Exception {
			Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
			List<GoodsVO> goodsList=goodsDAO.selectGoodsListsortsci("SCI");
			goodsMap.put("SCI",goodsList);
			return goodsMap;
		}
	//역사
		public Map<String, List<GoodsVO>> listGoodshistory() throws Exception {
			Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
			List<GoodsVO> goodsList=goodsDAO.selectGoodsListsorthistory("HISTORY");
			goodsMap.put("HISTORY",goodsList);
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
		
		System.out.println("총갯수 "+totalCount+" 영화갯수 "+eachCount+" 계산결과 "+rate);
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
	
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list=goodsDAO.selectKeywordSearch(keyword);
		return list;
	}
	
	public List<GoodsVO> searchGoods(String searchWord) throws Exception{
		List goodsList=goodsDAO.selectGoodsBySearchWord(searchWord);
		return goodsList;
	}

	@Override
	public void myReview(HashMap<String,String> reviewmap) throws Exception {
		goodsDAO.myReview(reviewmap);
	}

	
	
}