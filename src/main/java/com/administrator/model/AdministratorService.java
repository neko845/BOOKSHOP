package com.administrator.model;

import java.sql.Date;
import java.util.List;


public class AdministratorService {
	private AdministratorDAO_interface dao;
	
	public AdministratorService() {
		dao = new AdministratorDAO();
	}
	
	public AdministratorVO one(String administrator_account) {
		return dao.getone(administrator_account);
	}
	
	public AdministratorVO oneId(Integer administrator_id) {
		return dao.getoneId(administrator_id);
	}
	
	
	public AdministratorVO add(String administrator_account,String administrator_password,Integer administrator_class,Integer administrator_authority) {
		AdministratorVO administratorVO = new AdministratorVO();
		administratorVO.setAdministrator_account(administrator_account);
		administratorVO.setAdministrator_password(administrator_password);
		administratorVO.setAdministrator_class(administrator_class);
		administratorVO.setAdministrator_authority(administrator_authority);
		dao.insert(administratorVO);
		return administratorVO;
	}
	
	public AdministratorVO update(String administrator_account,String administrator_password,Integer administrator_class,Integer administrator_authority,Integer administrator_id) {
		AdministratorVO administratorVO = new AdministratorVO();
		administratorVO.setAdministrator_account(administrator_account);
		administratorVO.setAdministrator_password(administrator_password);
		administratorVO.setAdministrator_class(administrator_class);
		administratorVO.setAdministrator_authority(administrator_authority);
		administratorVO.setAdministrator_id(administrator_id);
		dao.update(administratorVO);
		return administratorVO;
	}
	
	public List<AdministratorVO> getAll() {
		return dao.getall();
	}
	
	public void delete(Integer administrator_id) {
		dao.delete(administrator_id);
	}
}
