package com.bookshop01.schedule.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


@Repository("ScheduleDAO")
public class ScheduleDAOImpl implements ScheduleDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertDAO(HashMap<String,String> schedulemap) throws DataAccessException {
		sqlSession.insert("mapper.schedule.insertSchedule",schedulemap);
		
	}
}
