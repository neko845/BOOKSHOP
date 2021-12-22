package com.order.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class Order_titleDAO implements Order_titleDAO_interface{
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/EXAMPLE?serverTimezone=Asia/Taipei";
	private static final String user = "root";
	private static final String password = "test";
	private static final String insert = "insert into order_title(member_account,order_time) values(?,?)";
	private static final String delete = "delete from order_title where order_id = ?";
	private static final String getall = "SELECT * FROM order_title";
	private static final String getallone = "SELECT * FROM order_title where member_account = ?";
	private static final String getone = "SELECT * FROM order_title where order_id = ?";
	private static final String getdate = "SELECT * FROM order_title where order_time = ?";

	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	public void insert(Order_titleVO order_titleVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url,user,password);
			pstmt = con.prepareStatement(insert);
			
			pstmt.setString(1, order_titleVO.getMember_account());
			pstmt.setDate(2, order_titleVO.getOrder_time());
			
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

	public void delete(Integer order_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url,user,password);
			pstmt = con.prepareStatement(delete);
			
			pstmt.setInt(1, order_id);
			
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

//	public void update(Order_titleVO order_titleVO) {
//		// TODO Auto-generated method stub
//		
//	}

	public Order_titleVO getone(Integer order_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order_titleVO order_titleVO = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getone);
			
			pstmt.setInt(1, order_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				order_titleVO = new Order_titleVO();
				order_titleVO.setOrder_id(rs.getInt("order_id"));
				order_titleVO.setMember_account(rs.getString("member_account"));
				order_titleVO.setOrder_time(rs.getDate("order_time"));
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
		return order_titleVO;
	}

	public List<Order_titleVO> getall() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order_titleVO order_titleVO = null;
		List<Order_titleVO> list = new ArrayList<Order_titleVO>();
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getall);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				order_titleVO = new Order_titleVO();
				order_titleVO.setOrder_id(rs.getInt("order_id"));
				order_titleVO.setMember_account(rs.getString("member_account"));
				order_titleVO.setOrder_time(rs.getDate("order_time"));
				list.add(order_titleVO);
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

	public List<Order_titleVO> getallone(String member_account) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order_titleVO order_titleVO = null;
		List<Order_titleVO> list = new ArrayList<Order_titleVO>();
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getallone);
			
			pstmt.setString(1, member_account);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				order_titleVO = new Order_titleVO();
				order_titleVO.setOrder_id(rs.getInt("order_id"));
				order_titleVO.setMember_account(rs.getString("member_account"));
				order_titleVO.setOrder_time(rs.getDate("order_time"));
				list.add(order_titleVO);
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

	public Order_titleVO getonedate(Date order_time) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order_titleVO order_titleVO = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getdate);
			
			pstmt.setDate(1, order_time);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				order_titleVO = new Order_titleVO();
				order_titleVO.setOrder_id(rs.getInt("order_id"));
				order_titleVO.setMember_account(rs.getString("member_account"));
				order_titleVO.setOrder_time(rs.getDate("order_time"));
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
		return order_titleVO;
	}
}
