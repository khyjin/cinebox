package com.bookshop01.cscenter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bookshop01.cscenter.vo.CscenterVO;

@Repository("CScenterDAO")
public class CScenterDAOImpl implements CScenterDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertNotice(CscenterVO cscenterVO) throws DataAccessException {
		sqlSession.insert("mapper.cscenter.insertNewNotice", cscenterVO);
	}

	@Override
	public List<CscenterVO> selectNotice() throws DataAccessException {
		return sqlSession.selectList("mapper.cscenter.selectNotice");
	}

	@Override
	public CscenterVO selectContent(int cscenter_number) throws DataAccessException {
		return (CscenterVO) sqlSession.selectOne("mapper.cscenter.selectContent", cscenter_number);
	}

	@Override
	public void updatehit(int cscenter_number) throws DataAccessException {
		sqlSession.update("mapper.cscenter.updatehit", cscenter_number);
		
	}

	@Override
	public CscenterVO selectModify(int cscenter_number) throws DataAccessException {
		return sqlSession.selectOne("mapper.cscenter.selectModify", cscenter_number);
		
	}

	@Override
	public void updateNotice(int cscenter_number) throws DataAccessException {
		sqlSession.update("mapper.cscenter.updateNotice", cscenter_number);
		
	}
	

}
