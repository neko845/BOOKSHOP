package com.administrator.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.member.model.MemberVO;

public class AdministratorDAO implements AdministratorDAO_interface {

	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://127.0.0.1:3306/EXAMPLE?serverTimezone=Asia/Taipei";
	private static final String user = "root";
	private static final String password = "test";
	private static final String insert = "insert into administrator (administrator_account,administrator_password,administrator_class,administrator_authority) values(?,?,?,?)";
	private static final String update = "update administrator set administrator_account = ?, administrator_password = ?, administrator_class = ?,administrator_authority = ? where administrator_id = ?";
	private static final String delete = "delete from administrator where administrator_id = ?";
	private static final String get_one = "SELECT * FROM administrator where administrator_account = ?";
	private static final String get_oneId = "SELECT * FROM administrator where administrator_id = ?";
	private static final String get_all = "SELECT * FROM administrator";

	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		}
	}

	public void insert(AdministratorVO administratorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(insert);

			pstmt.setString(1, administratorVO.getAdministrator_account());
			pstmt.setString(2, administratorVO.getAdministrator_password());
			pstmt.setInt(3, administratorVO.getAdministrator_class());
			pstmt.setInt(4, administratorVO.getAdministrator_authority());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

	public void delete(Integer administrator_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(delete);

			pstmt.setInt(1, administrator_id);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public void update(AdministratorVO administratorVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(update);

			pstmt.setString(1, administratorVO.getAdministrator_account());
			pstmt.setString(2, administratorVO.getAdministrator_password());
			pstmt.setInt(3, administratorVO.getAdministrator_class());
			pstmt.setInt(4, administratorVO.getAdministrator_authority());
			pstmt.setInt(5, administratorVO.getAdministrator_id());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	public AdministratorVO getone(String administrator_account) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdministratorVO administratorVO = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(get_one);
			
			pstmt.setString(1, administrator_account);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				administratorVO = new AdministratorVO();
				administratorVO.setAdministrator_id(rs.getInt("administrator_id"));
				administratorVO.setAdministrator_account(rs.getString("administrator_account"));
				administratorVO.setAdministrator_password(rs.getString("administrator_password"));
				administratorVO.setAdministrator_class(rs.getInt("administrator_class"));
				administratorVO.setAdministrator_authority(rs.getInt("administrator_authority"));
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
		return administratorVO;
	}

	public List<AdministratorVO> getall() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdministratorVO administratorVO = null;
		List<AdministratorVO> list = new ArrayList<AdministratorVO>();
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(get_all);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				administratorVO = new AdministratorVO();
				administratorVO.setAdministrator_id(rs.getInt("administrator_id"));
				administratorVO.setAdministrator_account(rs.getString("administrator_account"));
				administratorVO.setAdministrator_password(rs.getString("administrator_password"));
				administratorVO.setAdministrator_class(rs.getInt("administrator_class"));
				administratorVO.setAdministrator_authority(rs.getInt("administrator_authority"));
				list.add(administratorVO);
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

	public AdministratorVO getoneId(Integer administrator_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AdministratorVO administratorVO = null;
		try {
			con = DriverManager.getConnection(url, user, password);
			pstmt = con.prepareStatement(get_oneId);
			
			pstmt.setInt(1, administrator_id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				administratorVO = new AdministratorVO();
				administratorVO.setAdministrator_id(rs.getInt("administrator_id"));
				administratorVO.setAdministrator_account(rs.getString("administrator_account"));
				administratorVO.setAdministrator_password(rs.getString("administrator_password"));
				administratorVO.setAdministrator_class(rs.getInt("administrator_class"));
				administratorVO.setAdministrator_authority(rs.getInt("administrator_authority"));
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
		return administratorVO;
	}

}
