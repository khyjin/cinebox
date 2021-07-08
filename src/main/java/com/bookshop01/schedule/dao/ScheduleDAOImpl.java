package com.bookshop01.schedule.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.schedule.vo.ScheduleVO;


@Repository("ScheduleDAO")
public class ScheduleDAOImpl implements ScheduleDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertDAO(HashMap<String,String> schedulemap) throws DataAccessException {
		sqlSession.insert("mapper.schedule.insertSchedule",schedulemap);
	}
	@Override
	public List<ScheduleVO> selectSchedule() throws DataAccessException {
		List<ScheduleVO> list=sqlSession.selectList("mapper.schedule.selectSchedule");
		return list;
	}
}
