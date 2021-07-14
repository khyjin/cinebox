package com.bookshop01.cscenter.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.cscenter.vo.SearchCriteria;

public interface CScenterDAO {

	public List<CscenterVO> selectNotice(SearchCriteria scri) throws DataAccessException;
	public List<CscenterVO> selectFaq(SearchCriteria scri) throws DataAccessException;
	public int listCount(SearchCriteria scri) throws DataAccessException;
	public CscenterVO selectContent(int cscenter_number) throws DataAccessException;
	public void updatehit(int cscenter_number) throws DataAccessException;
	public void insertQna(CscenterVO cscenterVo) throws DataAccessException;
	public List<CscenterVO> selectMainNotice(String cscenter_type) throws DataAccessException;
	public List<CscenterVO> selectMainFaq(String cscenter_type) throws DataAccessException;
	
}
