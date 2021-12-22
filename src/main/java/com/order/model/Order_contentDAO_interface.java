package com.order.model;

import java.util.List;

public interface Order_contentDAO_interface {
	public void insert(Order_contentVO order_contentVO);
	public void deleteone(Order_contentVO order_contentVO);
	public void deleteall(Integer order_id); 
	public List<Order_contentVO> getall(Integer order_id);
}
