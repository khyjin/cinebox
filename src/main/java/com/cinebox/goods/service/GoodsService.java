package com.cinebox.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.mypage.vo.MyPageVO;

public interface GoodsService {
	
	public Map<String,List<GoodsVO>> listGoods() throws Exception;
	public Map goodsDetail(String movie_id) throws Exception;
	public Map<String, List<GoodsVO>> movieopenlist() throws Exception;
	public Map<String, List<GoodsVO>> moviereadylist() throws Exception;
	public Map<String, List<GoodsVO>> movieendlist() throws Exception;
	public void myReview(HashMap<String,String> reviewmap) throws Exception;
}