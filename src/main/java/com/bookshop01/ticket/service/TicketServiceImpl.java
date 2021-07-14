package com.bookshop01.ticket.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.schedule.vo.ScheduleVO;
import com.bookshop01.ticket.dao.TicketDAO;

@Service("TicketService") // ���񽺿��� service,transactional
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
		
}
