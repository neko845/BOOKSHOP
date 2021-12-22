package com.order.model;

import java.sql.Date;
import java.util.List;

public class Order_titleService {
	private Order_titleDAO_interface dao;

	public Order_titleService() {
		dao = new Order_titleDAO();
	}

	public Order_titleVO getone(Integer order_id) {
		return dao.getone(order_id);
	}
	
	public Order_titleVO getdate(Date order_time) {
		return dao.getonedate(order_time);
	}

	public List<Order_titleVO> getall() {
		return dao.getall();
	}
	
	public List<Order_titleVO> getallone(String member_account) {
		return dao.getallone(member_account);
	}

	public Order_titleVO insert(String member_account,Date order_time) {
		Order_titleVO order_titleVO = new Order_titleVO();
		order_titleVO.setMember_account(member_account);
		order_titleVO.setOrder_time(order_time);
		dao.insert(order_titleVO);
		return order_titleVO;
	}

	public void delete(Integer order_id) {
		dao.delete(order_id);
	}

}
