package com.bookshop01.admin.cscenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.admin.cscenter.dao.AdminCScenteDAO;
import com.bookshop01.cscenter.dao.CScenterDAO;
import com.bookshop01.cscenter.vo.Criteria;
import com.bookshop01.cscenter.vo.CscenterVO;

@Service("adminCScenterService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminCScenterServiceImpl implements AdminCScenterService{
	
	@Autowired
	private AdminCScenteDAO adminCScenterDAO;
	

	@Override
	public void addNotice(CscenterVO cscenterVO) throws Exception {
		adminCScenterDAO.insertNotice(cscenterVO);
		
	}


	@Override
	public CscenterVO content_modify_view(int cscenter_number) throws Exception {
		
		return adminCScenterDAO.selectModify(cscenter_number);
	}

	@Override
	public void updateNotice(CscenterVO cscenter) throws Exception {
		adminCScenterDAO.updateNotice(cscenter);
		
	}
	
	@Override
	public void deleteNotice(int cscenter_number) throws Exception {
		adminCScenterDAO.deleteNoticeByNumber(cscenter_number);		
	}
	
//게시물 목록조회	
	@Override
	public List<CscenterVO> boardList(Criteria cri) throws Exception {
		
		return adminCScenterDAO.selectBoard(cri);
	}

//게시물 총 갯수
	@Override
	public int listCount() throws Exception {
		return adminCScenterDAO.listCount();
	}


	@Override
	public CscenterVO content_view(int cscenter_number) throws Exception {
		return adminCScenterDAO.selectContent(cscenter_number);
	}


	@Override
	public void reply_write(CscenterVO cscenterVO) throws Exception {
		adminCScenterDAO.insertReply(cscenterVO);
	}
	



}
