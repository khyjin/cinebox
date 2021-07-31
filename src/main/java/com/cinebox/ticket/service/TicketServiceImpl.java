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

@Service("ticketService") // ���񽺿��� service,transactional
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
			//�������� �󿵳�¥ ���
			return ticketDAO.selectDate(movie_id);
		}

		@Override
		public List<ScheduleVO> listMovieTitle() throws Exception {
			//�������� ��ȭ�� ���
			return ticketDAO.reservationSchedule();
		}

		@Override
		public List<ScheduleVO> listMovieTitme(HashMap<String, Object> map) throws Exception {
			//�������� ��ȭ�ð� ���
			return ticketDAO.selectTime(map);
		}
		public List<TicketVO> seatReservation(TicketVO ticketVO)  throws Exception {
			return ticketDAO.seatReservation(ticketVO);
		}
		
}
