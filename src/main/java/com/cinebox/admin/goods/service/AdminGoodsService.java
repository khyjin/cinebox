package com.cinebox.admin.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.cinebox.cscenter.vo.Criteria;
import com.cinebox.cscenter.vo.SearchCriteria;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.goods.vo.ImageFileVO;

public interface AdminGoodsService {
	public int  addNewGoods(Map newGoodsMap) throws Exception;
	public List<GoodsVO> listNewGoods(Map condMap, Criteria cri) throws Exception;
	public Map goodsDetail(int movie_id) throws Exception;
	public List goodsImageFile(int movie_id) throws Exception;
	public void modifyGoodsInfo(Map goodsMap) throws Exception;
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception;
	public void removeGoodsImage(int image_number) throws Exception;
	public void addNewGoodsImage(List imageFileList) throws Exception;
	public void deleteMovie(int goods_id) throws Exception;
	public int listCount() throws Exception;
	public List<GoodsVO> searchMovie(SearchCriteria scri) throws Exception;
	public int listCount2(SearchCriteria scri) throws Exception;
}
