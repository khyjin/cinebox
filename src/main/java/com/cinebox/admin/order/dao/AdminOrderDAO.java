package com.cinebox.admin.order.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.cinebox.cscenter.vo.SearchCriteria;
import com.cinebox.member.vo.MemberVO;
import com.cinebox.schedule.vo.ScheduleVO;
import com.cinebox.ticket.vo.TicketVO;

public interface AdminOrderDAO {
	public ArrayList<TicketVO> selectTicketList(SearchCriteria scri) throws DataAccessException;
	public TicketVO selectReservation(int ticket_number) throws DataAccessException;	
	public int listCount(SearchCriteria scri) throws DataAccessException;
	public void cancelTicket(int ticket_number) throws DataAccessException;
	public int selectPoint(String member_id) throws DataAccessException;
	public void updatePoint(MemberVO memberVO) throws DataAccessException;
	public void updateReservation(TicketVO ticketVO) throws DataAccessException;

}
