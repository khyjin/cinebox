package com.bookshop01.ticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.ticket.dao.TicketDAO;

@Service("TicketService") // 서비스에는 service,transactional
@Transactional(propagation=Propagation.REQUIRED)
public class TicketServiceImpl implements TicketService {

		@Autowired
		private TicketDAO ticketDAO;

		@Override
		public List<GoodsVO> listGoods() throws Exception {
			return ticketDAO.listGoods();
		}

		
}
