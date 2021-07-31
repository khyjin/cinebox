package com.cinebox.admin.cscenter.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.cinebox.cscenter.vo.Criteria;
import com.cinebox.cscenter.vo.CscenterVO;
import com.cinebox.cscenter.vo.SearchCriteria;

public interface AdminCScenteDAO {
	
	public void insertNotice(CscenterVO cscenterVO) throws DataAccessException;
	public CscenterVO selectModify(int cscenter_number) throws DataAccessException;
	public void updateNotice(CscenterVO cscenterVO) throws DataAccessException;
	public void deleteNoticeByNumber(int cscenter_number) throws DataAccessException;

	public List<CscenterVO> selectBoard(SearchCriteria scri) throws DataAccessException;
	public int listCount(SearchCriteria scri) throws Exception;
	public CscenterVO selectContent(int cscenter_number) throws DataAccessException;
	public void insertReply(CscenterVO cscenterVO) throws DataAccessException;
}
