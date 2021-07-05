package com.bookshop01.schedule.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.cscenter.vo.CscenterVO;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;


@Repository("ScheduleDAO")
public class ScheduleDAOImpl implements ScheduleDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GoodsVO> selectTitle() throws DataAccessException {
		List<GoodsVO> titleList=(ArrayList)sqlSession.selectList("mapper.schedule.selectTitle");
	   return titleList;	
	}
	
	
	@Override
	public void insertDAO(ScheduleVO schedulVO) throws DataAccessException {
		sqlSession.insert("mapper.schedule.insertSchedule",schedulVO);
		
	}
}
