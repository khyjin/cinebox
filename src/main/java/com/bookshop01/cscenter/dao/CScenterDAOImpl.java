package com.bookshop01.cscenter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;

@Repository("CScenterDAO")
public class CScenterDAOImpl implements CScenterDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public CscenterVO selectContent(int cscenter_number) throws DataAccessException {
		return (CscenterVO) sqlSession.selectOne("mapper.cscenter.selectContent", cscenter_number);
	}
	
	@Override
	public List<CscenterVO> selectNotice(Criteria cri) throws DataAccessException {
		return sqlSession.selectList("mapper.cscenter.selectNotice",cri);
	}
	
	public List<CscenterVO> selectFaq(Criteria cri) throws DataAccessException {
		return sqlSession.selectList("mapper.cscenter.selectFaq",cri);
	}

	@Override
	public void updatehit(int cscenter_number) throws DataAccessException {
		sqlSession.update("mapper.cscenter.updatehit", cscenter_number);
		
	}

	@Override
	public void insertQna(CscenterVO cscenterVO) throws DataAccessException {
		sqlSession.insert("mapper.cscenter.insertQna", cscenterVO);
		
	}

	@Override
	public List<CscenterVO> selectMainNotice(String cscenter_type) throws DataAccessException {
		return sqlSession.selectList("mapper.cscenter.selectMainNotice",cscenter_type);
	}

	@Override
	public List<CscenterVO> selectMainFaq(String cscenter_type) throws DataAccessException {
		return sqlSession.selectList("mapper.cscenter.selectMainFaq",cscenter_type);
	}

	@Override
	public int listCount(String cscenter_type) throws DataAccessException {
		return sqlSession.selectOne("mapper.cscenter.listCount",cscenter_type);
	}




	

}
