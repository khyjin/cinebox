package com.cinebox.cscenter.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.cinebox.cscenter.vo.Criteria;
import com.cinebox.cscenter.vo.CscenterVO;
import com.cinebox.cscenter.vo.SearchCriteria;

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
