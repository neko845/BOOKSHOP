package com.order.model;

import java.sql.Date;
import java.util.List;



public class Order_contentService {
	Order_contentDAO_interface dao;
	
	public Order_contentService() {
		dao = new Order_contentDAO();
	}
	
	public List<Order_contentVO> getAll(Integer order_id) {
		return dao.getall(order_id);
	}
	
	public void deleteall(Integer order_id) {
		dao.deleteall(order_id);
	}
	
	public void deleteone(Integer order_id,Integer book_id) {
		Order_contentVO order_contentVO = new Order_contentVO();
		order_contentVO.setOrder_id(order_id);
		order_contentVO.setBook_id(book_id);
		dao.deleteone(order_contentVO);
	}
	
	public Order_contentVO add(Integer order_id,Integer book_id) {
		Order_contentVO order_contentVO = new Order_contentVO();
		order_contentVO.setOrder_id(order_id);
		order_contentVO.setBook_id(book_id);
		dao.insert(order_contentVO);
		return order_contentVO;
	}
}
