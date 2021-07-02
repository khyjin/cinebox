package com.bookshop01.cscenter.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bookshop01.cscenter.vo.CscenterVO;

public interface CScenterDAO {
	public void insertNotice(CscenterVO cscenterVO) throws DataAccessException;
	public List<CscenterVO> selectNotice() throws DataAccessException;
	public CscenterVO selectContent(int cscenter_number) throws DataAccessException;
	public void updatehit(int cscenter_number) throws DataAccessException;
	public CscenterVO selectModify(int cscenter_number) throws DataAccessException;
	public void updateNotice(int cscenter_number) throws DataAccessException;
}
