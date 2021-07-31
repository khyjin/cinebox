package com.cinebox.ticket.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.mypage.vo.MyPageVO;
import com.cinebox.schedule.vo.ScheduleVO;
import com.cinebox.ticket.dao.TicketDAO;
import com.cinebox.ticket.vo.TicketVO;

@Service("ticketService") // 서비스에는 service,transactional
@Transactional(propagation=Propagation.REQUIRED)
public class TicketServiceImpl implements TicketService {

		@Autowired
		private TicketDAO ticketDAO;

		@Override
		public List<GoodsVO> listGoods() throws Exception {
			return ticketDAO.listGoods();
		}

		
		@Override
		public List<ScheduleVO> listTicke(int movie_id) throws Exception{
			//예매폼에 상영날짜 출력
			return ticketDAO.selectDate(movie_id);
		}

		@Override
		public List<ScheduleVO> listMovieTitle() throws Exception {
			//예매폼에 영화명 출력
			return ticketDAO.reservationSchedule();
		}

		@Override
		public List<ScheduleVO> listMovieTitme(HashMap<String, Object> map) throws Exception {
			//예매폼에 영화시간 출력
			return ticketDAO.selectTime(map);
		}
		public List<TicketVO> seatReservation(TicketVO ticketVO)  throws Exception {
			return ticketDAO.seatReservation(ticketVO);
		}
		
}
