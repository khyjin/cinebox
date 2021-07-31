package com.cinebox.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.cinebox.cscenter.vo.Criteria;
import com.cinebox.cscenter.vo.SearchCriteria;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.goods.vo.ImageFileVO;

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
	public void deleteMovie(int movie_id) throws DataAccessException;
	
	public int listCount() throws DataAccessException;
	
	public List<GoodsVO> selectSearch(SearchCriteria scri) throws DataAccessException;
	public int listCount2(SearchCriteria scri) throws DataAccessException;
	
}
