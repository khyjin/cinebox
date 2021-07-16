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
	public void  modifyDeliveryState(Map deliveryMap) throws Exception{
		adminOrderDAO.updateDeliveryState(deliveryMap);
	}
	@Override
	public Map orderDetail(int order_id) throws Exception{
		Map orderMap=new HashMap();
		ArrayList<OrderVO> orderList =adminOrderDAO.selectOrderDetail(order_id);
		OrderVO deliveryInfo=(OrderVO)orderList.get(0);
//		String member_id=(String)deliveryInfo.getMember_id();
//		MemberVO orderer=adminOrderDAO.selectOrderer(member_id);
		orderMap.put("orderList",orderList);
		orderMap.put("deliveryInfo",deliveryInfo);
//		orderMap.put("orderer", orderer);
		return orderMap;
	}
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return adminOrderDAO.listCount(scri);
	}
	@Override
	public void cancleTicket(int ticket_number_code) throws Exception {
		adminOrderDAO.cancelTicket(ticket_number_code);
		
	}

	
	

}
