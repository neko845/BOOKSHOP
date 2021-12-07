package com.book.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class BookDAO implements BookDAO_interface{
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/EXAMPLE?serverTimezone=Asia/Taipei";
	private static final String user = "root";
	private static final String password = "test";
	private static final String insert = "insert into book (book_name,book_content,book_qty,book_img,added_time,down_time) values(?,?,?,?,?,?)";
	private static final String update = "update book set book_name = ?, book_content = ?, book_qty = ?, book_img = ?, added_time = ?, down_time = ? where book_id = ?";
	private static final String delete = "delete from book where book_id = ?";
	private static final String getall = "SELECT * FROM book";
	private static final String getone = "SELECT * FROM book where book_id = ?";
	
	static{
		try{
			Class.forName(driver);
		}catch(ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}
	
	public void insert(BookVO bookVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(insert);
			
			pstmt.setString(1, bookVO.getBookName());
			pstmt.setString(2, bookVO.getBookContent());
			pstmt.setInt(3, bookVO.getBookQty());
			pstmt.setBytes(4, bookVO.getBookImg());
			pstmt.setDate(5, bookVO.getAddedTime());
			pstmt.setDate(6, bookVO.getDownTime());
			
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

	public void update(BookVO bookVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(update);
			
			pstmt.setString(1, bookVO.getBookName());
			pstmt.setString(2, bookVO.getBookContent());
			pstmt.setInt(3, bookVO.getBookQty());
			pstmt.setBytes(4, bookVO.getBookImg());
			pstmt.setDate(5, bookVO.getAddedTime());
			pstmt.setDate(6, bookVO.getDownTime());
			pstmt.setInt(7, bookVO.getBookId());
			
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

	public void delete(Integer bookId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(delete);
			
			pstmt.setInt(1, bookId);
			
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

	public BookVO getone(Integer bookId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookVO bookVO = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getone);
			
			pstmt.setInt(1, bookId);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bookVO = new BookVO();
				bookVO.setBookId(rs.getInt("book_id"));
				bookVO.setBookName(rs.getString("book_name"));
				bookVO.setBookContent(rs.getString("book_content"));
				bookVO.setBookQty(rs.getInt("book_qty"));
				bookVO.setBookImg(rs.getBytes("book_img"));
				bookVO.setAddedTime(rs.getDate("added_time"));
				bookVO.setDownTime(rs.getDate("down_time"));
			}
		}catch(Exception e) {
			e.printStackTrace();
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
		return bookVO;
	}

	public List<BookVO> getAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookVO bookVO = null;
		List<BookVO> list = new ArrayList<BookVO>();
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getall);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bookVO = new BookVO();
				bookVO.setBookId(rs.getInt("book_id"));
				bookVO.setBookName(rs.getString("book_name"));
				bookVO.setBookContent(rs.getString("book_content"));
				bookVO.setBookQty(rs.getInt("book_qty"));
				bookVO.setBookImg(rs.getBytes("book_img"));
				bookVO.setAddedTime(rs.getDate("added_time"));
				bookVO.setDownTime(rs.getDate("down_time"));
				list.add(bookVO);
			}
			System.out.println(list.isEmpty());
		}catch(Exception e) {
			e.printStackTrace();
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

}
