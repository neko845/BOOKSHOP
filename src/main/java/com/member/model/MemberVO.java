package com.member.model;

import java.sql.Date;

public class MemberVO {
	private Integer member_id;
	private String member_account;
	private String member_password;
	private String member_nick;
	private Date creat_time;
	private Integer member_state;
	
	public Integer getMember_id() {
		return member_id;
	}
	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}
	public String getMember_account() {
		return member_account;
	}
	public void setMember_account(String member_account) {
		this.member_account = member_account;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public Date getCreat_time() {
		return creat_time;
	}
	public void setCreat_time(Date creat_time) {
		this.creat_time = creat_time;
	}
	public Integer getMember_state() {
		return member_state;
	}
	public void setMember_state(Integer member_state) {
		this.member_state = member_state;
	}
	
}
