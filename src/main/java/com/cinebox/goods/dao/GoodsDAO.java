package com.cinebox.goods.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.cinebox.cscenter.vo.CscenterVO;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.goods.vo.ImageFileVO;
import com.cinebox.mypage.vo.MyPageVO;

public interface GoodsDAO {
	public List<GoodsVO> selectGoodsList(String movie_status ) throws DataAccessException;
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;
	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException;
	public List<MyPageVO> selectReviewList(String movie_id) throws DataAccessException;
	public List<GoodsVO> movielist(String movie_status) throws DataAccessException;
	public void myReview(HashMap<String,String> reviewmap) throws Exception;
	public int totalCount() throws Exception;
	public int eachCount(String movie_id) throws Exception;
}
