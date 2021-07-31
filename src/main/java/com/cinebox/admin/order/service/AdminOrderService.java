package com.cinebox.admin.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cinebox.cscenter.vo.SearchCriteria;
import com.cinebox.goods.vo.GoodsVO;
import com.cinebox.schedule.vo.ScheduleVO;
import com.cinebox.ticket.vo.TicketVO;

public interface AdminOrderService {
	public List<TicketVO> listNewOrder(SearchCriteria scri) throws Exception;
	public TicketVO selectReservation(int ticket_number) throws Exception;
	public int listCount(SearchCriteria scri) throws Exception;
	public void cancleTicket(int ticket_number, String member_id, int saving_point, int used_point) throws Exception;
	public void modifyReservation(TicketVO ticketVO, int point) throws Exception;
}
