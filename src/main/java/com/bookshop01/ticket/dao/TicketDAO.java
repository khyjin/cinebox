package com.bookshop01.ticket.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.bookshop01.goods.vo.GoodsVO;

public interface TicketDAO {

	public List<GoodsVO> listGoods() throws DataAccessException;



}
