package com.administrator.model;

import java.util.List;

public interface AdministratorDAO_interface {
	public void insert(AdministratorVO administratorVO);
	public void delete(Integer administrator_id);
	public void update(AdministratorVO administratorVO);
	public AdministratorVO getone(String administrator_account);
	public AdministratorVO getoneId(Integer administrator_id);
	public List<AdministratorVO> getall();
}
