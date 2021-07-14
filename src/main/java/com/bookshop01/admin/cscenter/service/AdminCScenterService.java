package com.bookshop01.admin.cscenter.service;

import java.util.List;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.cscenter.vo.SearchCriteria;

public interface AdminCScenterService {
	
	public void addNotice(CscenterVO cscenterVO) throws Exception;
	public CscenterVO content_modify_view(int cscenter_number) throws Exception;
	public void updateNotice(CscenterVO cscenter) throws Exception;
	public void deleteNotice(int cscenter_number) throws Exception;

	public List<CscenterVO> boardList(SearchCriteria scri) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	
	public CscenterVO content_view(int cscenter_number) throws Exception;
	public void reply_write(CscenterVO cscenterVO) throws Exception;
}
