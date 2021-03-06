package com.cinebox.ticket.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.schedule.vo.ScheduleVO;
import com.cinebox.ticket.vo.TicketVO;


@Repository("ticketDAO")
public class TicketDAOImpl implements TicketDAO {
		@Autowired
		private SqlSession sqlSession;

		@Override
		public List<GoodsVO> listGoods() throws DataAccessException {
			List<GoodsVO> list=sqlSession.selectList("mapper.schedule.selectSchedule");
			return list;
		}
		@Override
		public List<ScheduleVO> selectDate(int movie_id) throws DataAccessException {
			return sqlSession.selectList("mapper.schedule.selectDate", movie_id);
		}

		@Override
		public List<ScheduleVO> reservationSchedule() throws DataAccessException {
			//예매에 불러오는 영화명
			return sqlSession.selectList("mapper.schedule.reservationSchedule");
		}

		@Override
		public List<ScheduleVO> selectTime(HashMap<String, Object> map) throws DataAccessException {
			return sqlSession.selectList("mapper.schedule.selectTime", map);
		}
		@Override
		public List<TicketVO> seatReservation(TicketVO ticketVO) throws DataAccessException {
			return sqlSession.selectList("mapper.ticket.selectSeat", ticketVO);
		}
		
		
}
