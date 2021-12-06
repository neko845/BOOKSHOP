package com.member.model;

public class MemberService {
	private MemberDAO_interface dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	
	public MemberVO one(String member_account) {
		return dao.getone(member_account);
	}
}
