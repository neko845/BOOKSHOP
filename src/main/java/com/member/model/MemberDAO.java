package com.member.model;

import java.sql.*;


public class MemberDAO implements MemberDAO_interface{
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/EXAMPLE?serverTimezone=Asia/Taipei";
	private static final String user = "root";
	private static final String password = "test";
	private static final String get_one = "SELECT * FROM member where member_account = ?";
	
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
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
