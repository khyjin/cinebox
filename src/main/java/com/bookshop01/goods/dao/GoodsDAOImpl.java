package com.bookshop01.goods.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.goods.vo.ImageFileVO;
import com.bookshop01.mypage.vo.MyPageVO;

@Repository("goodsDAO")
public class GoodsDAOImpl  implements GoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GoodsVO> selectGoodsList(String movie_status) throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList",movie_status);
	   return goodsList;	
	}
	
	//IT/���ͳ� ����Ʈ ������ �ϱ�
	@Override
	public List<GoodsVO> selectGoodsListsort(String goodsSort ) throws DataAccessException {
		List<GoodsVO> goodsList=sqlSession.selectList("mapper.goods.selectGoodsListsort",goodsSort);
	   return goodsList;	
	}
	
	//���� ����Ʈ ������ �ϱ�
		@Override
		public List<GoodsVO> selectGoodsListsortmoney(String goodsSort ) throws DataAccessException {
			List<GoodsVO> goodsList=sqlSession.selectList("mapper.goods.selectGoodsListsort",goodsSort);
		   return goodsList;	
		}
		
	//���б��� ����Ʈ ������ �ϱ�
		@Override
		public List<GoodsVO> selectGoodsListsortuni(String goodsSort ) throws DataAccessException {
			List<GoodsVO> goodsList=sqlSession.selectList("mapper.goods.selectGoodsListsort",goodsSort);
			return goodsList;	
		}
	//�ڱ��� ����Ʈ ������ �ϱ�
		@Override
		public List<GoodsVO> selectGoodsListsortself(String goodsSort ) throws DataAccessException {
			List<GoodsVO> goodsList=sqlSession.selectList("mapper.goods.selectGoodsListsort",goodsSort);
			return goodsList;	
		}
	//�ڿ����� ����Ʈ ������ �ϱ�
		@Override
		public List<GoodsVO> selectGoodsListsortsci(String goodsSort ) throws DataAccessException {
			List<GoodsVO> goodsList=sqlSession.selectList("mapper.goods.selectGoodsListsort",goodsSort);
			return goodsList;	
		}
	//���� ����Ʈ ������ �ϱ�
		@Override
		public List<GoodsVO> selectGoodsListsorthistory(String goodsSort ) throws DataAccessException {
			List<GoodsVO> goodsList=sqlSession.selectList("mapper.goods.selectGoodsListsort",goodsSort);
			return goodsList;	
		}
	
	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.goods.selectKeywordSearch",keyword);
	   return list;
	}
	
	@Override
	public ArrayList selectGoodsBySearchWord(String searchWord) throws DataAccessException{
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsBySearchWord",searchWord);
		 return list;
	}
	
	@Override
	public GoodsVO selectGoodsDetail(String movie_id) throws DataAccessException{
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail",movie_id);
		return goodsVO;
	}
	
	@Override
	public List<ImageFileVO> selectGoodsDetailImage(String movie_id) throws DataAccessException{
		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage",movie_id);
		System.out.println("����Ʈ Ȯ��"+imageList);
		return imageList;
	}
	
	//  ��ȭ ����Ʈ ���
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

}
