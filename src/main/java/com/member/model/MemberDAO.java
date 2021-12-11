package com.member.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MemberDAO implements MemberDAO_interface{
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/EXAMPLE?serverTimezone=Asia/Taipei";
	private static final String user = "root";
	private static final String password = "test";
	private static final String insert = "insert into member (member_account,member_password,member_nick,creat_time,member_state) values(?,?,?,?,?)";
	private static final String update = "update member set member_account = ?, member_password = ?, member_nick = ?,creat_time = ?, member_state = ? where member_id = ?";
	private static final String delete = "delete from member where member_id = ?";
	private static final String get_one = "SELECT * FROM member where member_account = ?";
	private static final String get_oneId = "SELECT * FROM member where member_id = ?";
	private static final String get_all = "SELECT * FROM member";
	
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}
	

	public void insert(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url,user,password);
			pstmt = con.prepareStatement(insert);
			
			pstmt.setString(1, memberVO.getMember_account());
			pstmt.setString(2, memberVO.getMember_password());
			pstmt.setString(3, memberVO.getMember_nick());
			pstmt.setDate(4, memberVO.getCreat_time());
			pstmt.setInt(5, memberVO.getMember_state());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void update(MemberVO memberVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url,user,password);
			pstmt = con.prepareStatement(update);
			
			pstmt.setString(1, memberVO.getMember_account());
			pstmt.setString(2, memberVO.getMember_password());
			pstmt.setString(3, memberVO.getMember_nick());
			pstmt.setDate(4, memberVO.getCreat_time());
			pstmt.setInt(5, memberVO.getMember_state());
			pstmt.setInt(6, memberVO.getMember_id());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void delete(Integer member_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url,user,password);
			pstmt = con.prepareStatement(update);
			
			pstmt.setInt(1, member_id);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public List<MemberVO> getall() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memberVO = null;
		List<MemberVO> list = new ArrayList<MemberVO>();
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(get_all);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMember_id(rs.getInt("member_id"));
				memberVO.setMember_account(rs.getString("member_account"));
				memberVO.setMember_password(rs.getString("member_password"));
				memberVO.setMember_nick(rs.getString("member_nick"));
				memberVO.setCreat_time(rs.getDate("creat_time"));
				memberVO.setMember_state(rs.getInt("member_state"));
				list.add(memberVO);
			}
			
		}catch(SQLException se){
			se.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
		}
		return list;
	}

	public MemberVO getone(String member_account) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO memberVO = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(get_one);
			
			pstmt.setString(1,member_account);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMember_id(rs.getInt("member_id"));
				memberVO.setMember_account(rs.getString("member_account"));
				memberVO.setMember_password(rs.getString("member_password"));
				memberVO.setMember_nick(rs.getString("member_nick"));
				memberVO.setCreat_time(rs.getDate("creat_time"));
				memberVO.setMember_state(rs.getInt("member_state"));
			}
			
		}catch(SQLException se){
			se.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
		}
		return memberVO;
	}


}
