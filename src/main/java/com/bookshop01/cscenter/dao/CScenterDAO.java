package com.bookshop01.cscenter.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;

public interface CScenterDAO {

	public List<CscenterVO> selectNotice(Criteria cri) throws DataAccessException;
	public List<CscenterVO> selectFaq(Criteria cri) throws DataAccessException;
	public int listCount(String cscenter_type) throws DataAccessException;
	public CscenterVO selectContent(int cscenter_number) throws DataAccessException;
	public void updatehit(int cscenter_number) throws DataAccessException;
	public void insertQna(CscenterVO cscenterVo) throws DataAccessException;
	public List<CscenterVO> selectMainNotice(String cscenter_type) throws DataAccessException;
	public List<CscenterVO> selectMainFaq(String cscenter_type) throws DataAccessException;
	
}
