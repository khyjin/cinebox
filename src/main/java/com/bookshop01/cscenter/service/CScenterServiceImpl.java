package com.bookshop01.cscenter.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.cscenter.dao.CScenterDAO;
import com.bookshop01.cscenter.vo.CscenterVO;

@Service("cscenterService")
@Transactional(propagation = Propagation.REQUIRED)
public class CScenterServiceImpl implements CScenterService {

	@Autowired
	private CScenterDAO cscenterDAO;
	
	@Override
	public List<CscenterVO> noticeList() throws Exception {
		
		return cscenterDAO.selectNotice();
	}

	@Override
	public void addNotice(CscenterVO cscenterVO) throws Exception {
		cscenterDAO.insertNotice(cscenterVO);
		
	}

	@Override
	public CscenterVO content_view(int cscenter_number) throws Exception {
		cscenterDAO.updatehit(cscenter_number);
		return cscenterDAO.selectContent(cscenter_number);
	}

	@Override
	public CscenterVO content_modify_view(int cscenter_number) throws Exception {
		
		return cscenterDAO.selectModify(cscenter_number);
	}

}
