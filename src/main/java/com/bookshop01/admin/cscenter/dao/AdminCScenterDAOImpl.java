package com.bookshop01.admin.cscenter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.cscenter.vo.SearchCriteria;

@Repository("adminCScenterDAO")
public class AdminCScenterDAOImpl implements AdminCScenteDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertNotice(CscenterVO cscenterVO) throws DataAccessException {
		sqlSession.insert("mapper.admin.cscenter.insertNewNotice", cscenterVO);
	}
	
	@Override
	public CscenterVO selectModify(int cscenter_number) throws DataAccessException {
		return sqlSession.selectOne("mapper.admin.cscenter.selectModify", cscenter_number);	
	}

	@Override
	public void updateNotice(CscenterVO cscenterVO) throws DataAccessException {
		sqlSession.update("mapper.admin.cscenter.updateNotice", cscenterVO);
	}

	@Override
	public void deleteNoticeByNumber(int cscenter_number) throws DataAccessException {
		sqlSession.delete("mapper.admin.cscenter.deleteNoticeByNumber", cscenter_number);
	}

	@Override
	public List<CscenterVO> selectBoard(SearchCriteria scri) throws DataAccessException {
	//	return sqlSession.selectList("mapper.admin.cscenter.selectBoard",cscenter_type);
		return sqlSession.selectList("mapper.admin.cscenter.selectBoard", scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("mapper.admin.cscenter.listCount", scri);
	}

	@Override
	public CscenterVO selectContent(int cscenter_number) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.admin.cscenter.selectContent", cscenter_number);
	}

	@Override
	public void insertReply(CscenterVO cscenterVO) throws DataAccessException {
		sqlSession.insert("mapper.admin.cscenter.insertReply", cscenterVO);
	}
}
