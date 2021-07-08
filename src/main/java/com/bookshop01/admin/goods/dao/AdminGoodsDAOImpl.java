package com.bookshop01.admin.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.goods.vo.ImageFileVO;
import com.bookshop01.goods.vo.SearchCriteria;
import com.bookshop01.order.vo.OrderVO;

@Repository("adminGoodsDAO")
public class AdminGoodsDAOImpl  implements AdminGoodsDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException {
		sqlSession.insert("mapper.admin.goods.insertNewGoods",newGoodsMap);
		return Integer.parseInt((String)newGoodsMap.get("movie_id"));
	}
	
	@Override
	public void insertGoodsImageFile(List fileList)  throws DataAccessException {
		for(int i=0; i<fileList.size();i++){
			ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
			sqlSession.insert("mapper.admin.goods.insertGoodsImageFile",imageFileVO);
		}
	}
		
	@Override
	public List<GoodsVO> selectNewGoodsList(Map condMap,Criteria cri) throws DataAccessException {
		Map<String, Object> map = new HashedMap();

		ArrayList<GoodsVO>  movieList=(ArrayList)sqlSession.selectList("mapper.admin.goods.selectNewGoodsList", cri);
		return movieList;
	}
	
	@Override
	public int listCount() throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.goods.listCount");
	}
	
	@Override
	public GoodsVO selectGoodsDetail(int movie_id) throws DataAccessException{
		GoodsVO goodsBean = new GoodsVO();
		goodsBean=(GoodsVO)sqlSession.selectOne("mapper.admin.goods.selectGoodsDetail",movie_id);
		return goodsBean;
	}
	
	@Override
	public List selectGoodsImageFileList(int movie_id) throws DataAccessException {
		List imageList=new ArrayList();
		imageList=(List)sqlSession.selectList("mapper.admin.goods.selectGoodsImageFileList",movie_id);
		return imageList;
	}
	
	@Override
	public void updateGoodsInfo(Map goodsMap) throws DataAccessException{
		sqlSession.update("mapper.admin.goods.updateGoodsInfo",goodsMap);
	}
	
	@Override
	public void deleteGoodsImage(int image_number) throws DataAccessException{
		sqlSession.delete("mapper.admin.goods.deleteGoodsImage",image_number);
	}
	
	@Override
	public void deleteGoodsImage(List fileList) throws DataAccessException{
		int image_id;
		for(int i=0; i<fileList.size();i++){
			ImageFileVO bean=(ImageFileVO) fileList.get(i);
			image_id=bean.getImage_number();
			sqlSession.delete("mapper.admin.goods.deleteGoodsImage",image_id);	
		}
	}

	@Override
	public List<OrderVO> selectOrderGoodsList(Map condMap) throws DataAccessException{
		List<OrderVO>  orderGoodsList=(ArrayList)sqlSession.selectList("mapper.admin.selectOrderGoodsList",condMap);
		return orderGoodsList;
	}	
	
	@Override
	public void updateOrderGoods(Map orderMap) throws DataAccessException{
		sqlSession.update("mapper.admin.goods.updateOrderGoods",orderMap);
		
	}

	@Override
	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException {
		
		for(int i=0; i<imageFileList.size();i++){
			ImageFileVO imageFileVO = imageFileList.get(i);
			sqlSession.update("mapper.admin.goods.updateGoodsImage",imageFileVO);	
		}
		
	}

	@Override
	public void deleteMovie(int movie_id) throws DataAccessException {
		sqlSession.delete("mapper.admin.goods.deleteMovie", movie_id);	

		
	}

	@Override
	public List<GoodsVO> movieSearchList(SearchCriteria scri) throws DataAccessException {
		return sqlSession.selectList("mapper.admin.goods.movieSearchList", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.goods.listCount",scri);
	}




	

}
