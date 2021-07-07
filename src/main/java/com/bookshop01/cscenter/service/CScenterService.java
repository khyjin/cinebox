package com.bookshop01.cscenter.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;

public interface CScenterService {
	public List<CscenterVO> noticeList(Criteria cri) throws Exception;

	public CscenterVO content_view(int cscenter_number) throws Exception; 
	
	public List<CscenterVO> faqList(Criteria cri) throws Exception;
	
	public void sendQna(CscenterVO cscenterVO) throws Exception;
	
	public Map<String,CscenterVO> mainNotice() throws Exception;
	
	public int listCount(String cscenter_type) throws Exception;
}
