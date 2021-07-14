package com.bookshop01.cscenter.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.cscenter.vo.SearchCriteria;

public interface CScenterService {
	public List<CscenterVO> noticeList(SearchCriteria scri) throws Exception;

	public CscenterVO content_view(int cscenter_number) throws Exception; 
	
	public List<CscenterVO> faqList(SearchCriteria scri) throws Exception;
	
	public void sendQna(CscenterVO cscenterVO) throws Exception;
	
	public Map<String,CscenterVO> mainNotice() throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
}
