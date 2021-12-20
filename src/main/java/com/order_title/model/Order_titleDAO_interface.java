package com.order_title.model;

import java.util.List;

public interface Order_titleDAO_interface {
	public void insert(Order_titleVO order_titleVO); 
	public void delete(Integer order_id);
//	public void update(Order_titleVO order_titleVO);
	public Order_titleVO getone(Integer order_id);
	public List<Order_titleVO> getall();
}
