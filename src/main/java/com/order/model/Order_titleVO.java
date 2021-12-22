package com.order.model;

import java.sql.Date;

public class Order_titleVO {
	private Integer order_id;
	private String member_account;
	private Date order_time;
	
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public String getMember_account() {
		return member_account;
	}
	public void setMember_account(String member_account) {
		this.member_account = member_account;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	
}
