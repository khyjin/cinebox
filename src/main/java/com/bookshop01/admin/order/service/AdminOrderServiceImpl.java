package com.bookshop01.admin.order.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.admin.goods.dao.AdminGoodsDAO;
import com.bookshop01.admin.order.dao.AdminOrderDAO;
import com.bookshop01.cscenter.vo.SearchCriteria;
import com.bookshop01.goods.vo.GoodsVO;
import com.bookshop01.goods.vo.ImageFileVO;
import com.bookshop01.member.vo.MemberVO;
import com.bookshop01.order.vo.OrderVO;
import com.bookshop01.ticket.vo.TicketVO;


@Service("adminOrderService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminOrderServiceImpl implements AdminOrderService {
	@Autowired
	private AdminOrderDAO adminOrderDAO;
	
	public List<TicketVO>listNewOrder(SearchCriteria scri) throws Exception{
		return adminOrderDAO.selectTicketList(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return adminOrderDAO.listCount(scri);
	}
	
	@Override
	public TicketVO selectReservation(String ticket_number) throws Exception{
		return adminOrderDAO.selectReservation(ticket_number);
	}
	
	@Override
	public void cancleTicket(String ticket_number, String member_id, int saving_point, int used_point) throws Exception {		
		int current_point = adminOrderDAO.selectPoint(member_id);
		int member_point = current_point+used_point-saving_point;

		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(member_id);
		memberVO.setMember_point(member_point);
		
		adminOrderDAO.cancelTicket(ticket_number);
		adminOrderDAO.updatePoint(memberVO);		
	}
	
	@Override
	public void modifyReservation(TicketVO ticketVO, int point) throws Exception {
		adminOrderDAO.updateReservation(ticketVO);		
		
		int current_point = adminOrderDAO.selectPoint(ticketVO.getMember_id());	//현재 사용자의 ponit
		int add_point = (int) (ticketVO.getTicket_total_price()*0.1);	//적립될 point
		int newPoint = current_point + add_point-point;
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id(ticketVO.getMember_id());
		memberVO.setMember_point(newPoint);
		adminOrderDAO.updatePoint(memberVO);
	}
	
/////////////////////////////////////////////////////////////////////////////////	
	@Override
	public void  modifyDeliveryState(Map deliveryMap) throws Exception{
		adminOrderDAO.updateDeliveryState(deliveryMap);
	}








	

}
