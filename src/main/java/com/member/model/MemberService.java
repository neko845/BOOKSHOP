package com.member.model;

import java.sql.Date;
import java.util.List;

import com.book.model.BookVO;

public class MemberService {
	private MemberDAO_interface dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	
	public MemberVO one(String member_account) {
		return dao.getone(member_account);
	}
	
	
	public MemberVO add(String member_account,String member_password,String member_nick,Date creat_time,Integer member_state) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_account(member_account);
		memberVO.setMember_password(member_password);
		memberVO.setMember_nick(member_nick);
		memberVO.setCreat_time(creat_time);
		memberVO.setMember_state(member_state);
		dao.insert(memberVO);
		return memberVO;
	}
	
	public MemberVO update(String member_account,String member_password,String member_nick,Date creat_time,Integer member_state,Integer member_id) {
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_account(member_account);
		memberVO.setMember_password(member_password);
		memberVO.setMember_nick(member_nick);
		memberVO.setCreat_time(creat_time);
		memberVO.setMember_state(member_state);
		memberVO.setMember_id(member_id);
		dao.update(memberVO);
		return memberVO;
	}
	
	public List<MemberVO> getAll() {
		return dao.getall();
	}
	
	public void delete(Integer member_id) {
		dao.delete(member_id);
	}
}
