package com.order.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Order_contentDAO implements Order_contentDAO_interface{
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/EXAMPLE?serverTimezone=Asia/Taipei";
	private static final String user = "root";
	private static final String password = "test";
	private static final String insert = "insert into order_content(order_id,book_id) values (?,?)";
	private static final String deleteall = "delete from order_content where order_id = ?";
	private static final String deleteone = "delete from order_content where order_id = ? and book_id = ?";
	private static final String getall = "SELECT * FROM order_content where order_id = ?";

	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	public void deleteone(Order_contentVO order_contentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url,user,password);
			pstmt = con.prepareStatement(deleteone);
			
			pstmt.setInt(1, order_contentVO.getOrder_id());
			pstmt.setInt(2, order_contentVO.getBook_id());
			
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

	public void deleteall(Integer order_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url,user,password);
			pstmt = con.prepareStatement(deleteall);
			
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

	public List<Order_contentVO> getall(Integer order_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order_contentVO order_contentVO = null;
		List<Order_contentVO> list = new ArrayList<Order_contentVO>();
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getall);
			
			pstmt.setInt(1, order_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				order_contentVO = new Order_contentVO();
				order_contentVO.setOrder_id(rs.getInt("order_id"));
				order_contentVO.setBook_id(rs.getInt("book_id"));
				list.add(order_contentVO);
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

	public void insert(Order_contentVO order_contentVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(insert);
			
			pstmt.setInt(1, order_contentVO.getOrder_id());
			pstmt.setInt(2, order_contentVO.getBook_id());
			
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
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
	}
}
