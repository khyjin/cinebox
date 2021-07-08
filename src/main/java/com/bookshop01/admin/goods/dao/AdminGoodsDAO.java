package com.bookshop01.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.goods.vo.ImageFileVO;
import com.bookshop01.goods.vo.SearchCriteria;
import com.bookshop01.order.vo.OrderVO;

public interface AdminGoodsDAO {
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException;
	public List<GoodsVO> selectNewGoodsList(Map condMap,Criteria cri) throws DataAccessException;
	public GoodsVO selectGoodsDetail(int movie_id) throws DataAccessException;
	public List selectGoodsImageFileList(int movie_id) throws DataAccessException;
	public void insertGoodsImageFile(List fileList)  throws DataAccessException;
	public void updateGoodsInfo(Map goodsMap) throws DataAccessException;
	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException;
	public void deleteGoodsImage(int image_number) throws DataAccessException;
	public void deleteGoodsImage(List fileList) throws DataAccessException;
	public List<OrderVO> selectOrderGoodsList(Map condMap) throws DataAccessException;
	public void updateOrderGoods(Map orderMap) throws DataAccessException;
	public void deleteMovie(int movie_id) throws DataAccessException;
	
	public int listCount() throws DataAccessException;
	
	public List<GoodsVO> movieSearchList(SearchCriteria scri) throws DataAccessException;
	public int listCount(SearchCriteria scri) throws DataAccessException;
	
}
