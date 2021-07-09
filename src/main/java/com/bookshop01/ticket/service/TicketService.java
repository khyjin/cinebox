package com.bookshop01.ticket.service;

import java.util.List;

import com.bookshop01.goods.vo.GoodsVO;

public interface TicketService {

	public List<GoodsVO> listGoods() throws Exception;

}
