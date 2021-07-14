package com.bookshop01.ticket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.bookshop01.goods.vo.GoodsVO;


@Repository("TicketDAO")
public class TicketDAOImpl implements TicketDAO {
		@Autowired
		private SqlSession sqlSession;

		@Override
		public List<GoodsVO> listGoods() throws DataAccessException {
			List<GoodsVO> list=sqlSession.selectList("mapper.schedule.selectSchedule");
			return list;
		}
		
}
