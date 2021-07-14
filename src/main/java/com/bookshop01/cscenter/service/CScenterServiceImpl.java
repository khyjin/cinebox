package com.bookshop01.cscenter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.cscenter.dao.CScenterDAO;
import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.cscenter.vo.SearchCriteria;

@Service("cscenterService")
@Transactional(propagation = Propagation.REQUIRED)
public class CScenterServiceImpl implements CScenterService {

	@Autowired
	private CScenterDAO cscenterDAO;
	
	@Override
	public List<CscenterVO> noticeList(SearchCriteria scri) throws Exception {
		return cscenterDAO.selectNotice(scri);
	}
	
	@Override
	public List<CscenterVO> faqList(SearchCriteria scri) throws Exception {
		return cscenterDAO.selectFaq(scri);
	}
	
	//°Ô½Ã¹° ÃÑ °¹¼ö
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return cscenterDAO.listCount(scri);
	}
	
	@Override
	public CscenterVO content_view(int cscenter_number) throws Exception {
		cscenterDAO.updatehit(cscenter_number);
		return cscenterDAO.selectContent(cscenter_number);
	}

	@Override
	public void sendQna(CscenterVO cscenterVO) throws Exception {
		cscenterDAO.insertQna(cscenterVO);
		
	}

	@Override
	public Map<String,CscenterVO> mainNotice() throws Exception {
		Map map = new HashMap<String, CscenterVO>();
		map.put("notice", cscenterDAO.selectMainNotice("notice"));
		map.put("faq", cscenterDAO.selectMainFaq("faq"));
		return map;
	}









}
