package com.cinebox.goods.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.goods.vo.ImageFileVO;
import com.cinebox.mypage.vo.MyPageVO;

@Repository("goodsDAO")
public class GoodsDAOImpl  implements GoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GoodsVO> selectGoodsList(String movie_status) throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList",movie_status);
	   return goodsList;	
	}
	
	@Override
	public GoodsVO selectGoodsDetail(String movie_id) throws DataAccessException{
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail",movie_id);
		return goodsVO;
	}
	
	@Override
	public List<ImageFileVO> selectGoodsDetailImage(String movie_id) throws DataAccessException{
		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage",movie_id);
		System.out.println("리스트 확인"+imageList);
		return imageList;
	}
	
	@Override
	public List<MyPageVO> selectReviewList(String movie_title) throws DataAccessException{
		List<MyPageVO> reviewList=(ArrayList)sqlSession.selectList("mapper.goods.selectReviewList",movie_title);
		return reviewList;
	}
	
	//  영화 리스트 출력
	@Override
	public List<GoodsVO> movielist(String movie_status) throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList",movie_status);
	   return goodsList;	
	}

	@Override
	public void myReview(HashMap<String,String> reviewmap) throws Exception {
		sqlSession.insert("mapper.goods.myReview",reviewmap);
	}

	@Override
	public int totalCount() throws Exception {
		return sqlSession.selectOne("mapper.goods.totalCount");
	}

	@Override
	public int eachCount(String movie_id) throws Exception {
		return sqlSession.selectOne("mapper.goods.eachCount", movie_id);
	}

	@Override
	public double selectScore(String movie_id) throws Exception {
		return sqlSession.selectOne("mapper.goods.selectScore", movie_id);
	}


}
