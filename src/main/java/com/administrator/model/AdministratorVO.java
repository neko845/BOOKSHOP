package com.administrator.model;

public class AdministratorVO {
	private Integer administrator_id;
	private String administrator_account;
	private String administrator_password;
	private Integer administrator_class;
	private Integer administrator_authority;
	
	public Integer getAdministrator_id() {
		return administrator_id;
	}
	public void setAdministrator_id(Integer administrator_id) {
		this.administrator_id = administrator_id;
	}
	public String getAdministrator_account() {
		return administrator_account;
	}
	public void setAdministrator_account(String administrator_account) {
		this.administrator_account = administrator_account;
	}
	public String getAdministrator_password() {
		return administrator_password;
	}
	public void setAdministrator_password(String administrator_password) {
		this.administrator_password = administrator_password;
	}
	public Integer getAdministrator_class() {
		return administrator_class;
	}
	public void setAdministrator_class(Integer administrator_class) {
		this.administrator_class = administrator_class;
	}
	public Integer getAdministrator_authority() {
		return administrator_authority;
	}
	public void setAdministrator_authority(Integer administrator_authority) {
		this.administrator_authority = administrator_authority;
	}
	
}
