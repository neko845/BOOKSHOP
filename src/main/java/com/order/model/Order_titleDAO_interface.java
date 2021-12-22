package com.order.model;

import java.sql.Date;
import java.util.List;

public interface Order_titleDAO_interface {
	public void insert(Order_titleVO order_titleVO); 
	public void delete(Integer order_id);
//	public void update(Order_titleVO order_titleVO);
	public Order_titleVO getone(Integer order_id);
	public Order_titleVO getonedate(Date order_time);
	public List<Order_titleVO> getallone(String member_account);
	public List<Order_titleVO> getall();
}
