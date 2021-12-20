package com.information.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class InformationDAO implements InformationDAO_interface{
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/EXAMPLE?serverTimezone=Asia/Taipei";
	private static final String user = "root";
	private static final String password = "test";
	private static final String insert = "insert into information(information_name,information_content,information_img,added_time,down_time) values(?,?,?,?,?)";
	private static final String update = "update information set information_name = ?, information_content = ?, information_img = ?, added_time = ?, down_time = ? where information_id = ?";
	private static final String delete = "delete from information where information_id = ?";
	private static final String getall = "SELECT * FROM information";
	private static final String getone = "SELECT * FROM information where information_id = ?";
	
	static{
		try{
			Class.forName(driver);
		}catch(ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	public void insert(InformationVO informationVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(insert);
			
			pstmt.setString(1, informationVO.getInformation_name());
			pstmt.setString(2, informationVO.getInformation_content());
			pstmt.setBytes(3, informationVO.getInformation_img());
			pstmt.setDate(4, informationVO.getAdded_time());
			pstmt.setDate(5, informationVO.getDown_time());
			
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

	public void delete(Integer information_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(delete);
			
			pstmt.setInt(1, information_id);
			
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

	public void update(InformationVO informationVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(update);
			
			pstmt.setString(1, informationVO.getInformation_name());
			pstmt.setString(2, informationVO.getInformation_content());
			pstmt.setBytes(3, informationVO.getInformation_img());
			pstmt.setDate(4, informationVO.getAdded_time());
			pstmt.setDate(5, informationVO.getDown_time());
			pstmt.setInt(6, informationVO.getInformation_id());
			
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

	public InformationVO getone(Integer information_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InformationVO informationVO = null;
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getone);
			
			pstmt.setInt(1, information_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				informationVO = new InformationVO();
				informationVO.setInformation_id(rs.getInt("information_id"));
				informationVO.setInformation_name(rs.getString("information_name"));
				informationVO.setInformation_content(rs.getString("information_content"));
				informationVO.setInformation_img(rs.getBytes("information_img"));
				informationVO.setAdded_time(rs.getDate("added_time"));
				informationVO.setDown_time(rs.getDate("down_time"));
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
		return informationVO;
	}

	public List<InformationVO> getall() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InformationVO informationVO = null;
		List<InformationVO> list = new ArrayList<InformationVO>();
		
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(getall);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				informationVO = new InformationVO();
				informationVO.setInformation_id(rs.getInt("information_id"));
				informationVO.setInformation_name(rs.getString("information_name"));
				informationVO.setInformation_content(rs.getString("information_content"));
				informationVO.setInformation_img(rs.getBytes("information_img"));
				informationVO.setAdded_time(rs.getDate("added_time"));
				informationVO.setDown_time(rs.getDate("down_time"));
				list.add(informationVO);
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
		return list;
	}
}
