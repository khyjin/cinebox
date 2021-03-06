package com.cinebox.admin.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cinebox.admin.goods.dao.AdminGoodsDAO;
import com.cinebox.cscenter.vo.Criteria;
import com.cinebox.cscenter.vo.SearchCriteria;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.goods.vo.ImageFileVO;


@Service("adminGoodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminGoodsServiceImpl implements AdminGoodsService {
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;
	
	@Override
	public int addNewGoods(Map newGoodsMap) throws Exception{
		int movie_id = adminGoodsDAO.insertNewGoods(newGoodsMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList)newGoodsMap.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setMovie_id(movie_id);
		}
		adminGoodsDAO.insertGoodsImageFile(imageFileList);
		return movie_id;
	}
	
	@Override
	public List<GoodsVO> listNewGoods(Map condMap, Criteria cri) throws Exception{
		return adminGoodsDAO.selectNewGoodsList(condMap, cri);
	}
	
	public int listCount() throws Exception{
		return adminGoodsDAO.listCount();
	}
	
	@Override
	public Map goodsDetail(int movie_id) throws Exception {
		Map goodsMap = new HashMap();
		GoodsVO goodsVO=adminGoodsDAO.selectGoodsDetail(movie_id);
		List imageFileList =adminGoodsDAO.selectGoodsImageFileList(movie_id);
		goodsMap.put("goods", goodsVO);
		goodsMap.put("imageFileList", imageFileList);
		return goodsMap;
	}
	@Override
	public List goodsImageFile(int movie_id) throws Exception{
		List imageList =adminGoodsDAO.selectGoodsImageFileList(movie_id);
		return imageList;
	}
	
	@Override
	public void modifyGoodsInfo(Map goodsMap) throws Exception{
		adminGoodsDAO.updateGoodsInfo(goodsMap);
		
	}	
	@Override
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception{
		adminGoodsDAO.updateGoodsImage(imageFileList); 
	}
	
	@Override
	public void removeGoodsImage(int image_number) throws Exception{
		adminGoodsDAO.deleteGoodsImage(image_number);
	}
	
	@Override
	public void addNewGoodsImage(List imageFileList) throws Exception{
		adminGoodsDAO.insertGoodsImageFile(imageFileList);
	}

	@Override
	public void deleteMovie(int movie_id) throws Exception {
		adminGoodsDAO.deleteMovie(movie_id);
	}

	@Override
	public List<GoodsVO> searchMovie(SearchCriteria scri) throws Exception {
		
		return adminGoodsDAO.selectSearch(scri);
	}
	
	@Override
	public int listCount2(SearchCriteria scri) {
		return adminGoodsDAO.listCount2(scri);
	}

	
}
