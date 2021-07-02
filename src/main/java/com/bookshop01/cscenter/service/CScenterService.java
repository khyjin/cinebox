package com.bookshop01.cscenter.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bookshop01.cscenter.vo.CscenterVO;

public interface CScenterService {
	public List<CscenterVO> noticeList() throws Exception;
	public void addNotice(CscenterVO cscenterVO) throws Exception;
	public CscenterVO content_view(int cscenter_number) throws Exception; 
	public CscenterVO content_modify_view(int cscenter_number) throws Exception;
}
