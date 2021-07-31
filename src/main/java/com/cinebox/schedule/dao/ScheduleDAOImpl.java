package com.cinebox.schedule.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.schedule.vo.ScheduleVO;


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
	@Override
	public List<GoodsVO> listGoods() throws DataAccessException {
		List<GoodsVO> list2=(List)sqlSession.selectList("mapper.schedule.listGoods");
		return list2;
	}
	@Override
	public void deleteDAO(int schedule_id) throws DataAccessException {
		sqlSession.delete("mapper.schedule.deleteSchedule",schedule_id);
	}
	@Override
	public void modifyDAO(Map<String, Object> modimap) throws DataAccessException {
		sqlSession.update("mapper.schedule.modifySchedule",modimap);
		
	}
}