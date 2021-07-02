package com.bookshop01.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.goods.vo.ImageFileVO;

public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(String movie_status ) throws DataAccessException;
	public List<GoodsVO> selectGoodsListsort(String goodsSort ) throws DataAccessException;
	public List<GoodsVO> selectGoodsListsortmoney(String goodsSort ) throws DataAccessException;
	public List<GoodsVO> selectGoodsListsortuni(String goodsSort ) throws DataAccessException;
	public List<GoodsVO> selectGoodsListsortself(String goodsSort ) throws DataAccessException;
	public List<GoodsVO> selectGoodsListsortsci(String goodsSort ) throws DataAccessException;
	public List<GoodsVO> selectGoodsListsorthistory(String goodsSort ) throws DataAccessException;
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;
	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException;
	public List<GoodsVO> movielist(String movie_status) throws DataAccessException;
	public List<GoodsVO> selectGoodsBySearchWord(String searchWord) throws DataAccessException;
}
