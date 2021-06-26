package com.bookshop01.goods.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bookshop01.goods.vo.GoodsVO;

public interface GoodsService {
	
	public Map<String,List<GoodsVO>> listGoods() throws Exception;
	public Map goodsDetail(String _goods_id) throws Exception;
	public Map<String,List<GoodsVO>> listGoodssort() throws Exception;
	public Map<String,List<GoodsVO>> listGoodsmoney() throws Exception;
	public Map<String,List<GoodsVO>> listGoodsuni() throws Exception;
	public Map<String,List<GoodsVO>> listGoodsself() throws Exception;
	public Map<String,List<GoodsVO>> listGoodssci() throws Exception;
	public Map<String, List<GoodsVO>> listGoodshistory() throws Exception;
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<GoodsVO> searchGoods(String searchWord) throws Exception;
}