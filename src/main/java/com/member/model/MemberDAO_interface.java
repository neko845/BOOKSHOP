package com.member.model;

import java.util.List;

public interface MemberDAO_interface {
	public void insert(MemberVO memberVO);
	public void update(MemberVO memberVO);
	public void delete(Integer member_id);
	public MemberVO getone(String member_account);
	public List<MemberVO> getall();
}
