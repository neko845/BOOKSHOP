package com.information.model;

import java.sql.Date;

public class InformationVO {
	private Integer information_id;
	private String information_name;
	private String information_content;
	private byte[] information_img;
	private Date added_time;
	private Date down_time;
	public Integer getInformation_id() {
		return information_id;
	}
	public void setInformation_id(Integer information_id) {
		this.information_id = information_id;
	}
	public String getInformation_name() {
		return information_name;
	}
	public void setInformation_name(String information_name) {
		this.information_name = information_name;
	}
	public String getInformation_content() {
		return information_content;
	}
	public void setInformation_content(String information_content) {
		this.information_content = information_content;
	}
	public byte[] getInformation_img() {
		return information_img;
	}
	public void setInformation_img(byte[] information_img) {
		this.information_img = information_img;
	}
	public Date getAdded_time() {
		return added_time;
	}
	public void setAdded_time(Date added_time) {
		this.added_time = added_time;
	}
	public Date getDown_time() {
		return down_time;
	}
	public void setDown_time(Date down_time) {
		this.down_time = down_time;
	}
	
	
}
