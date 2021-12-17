package com.information.model;

import java.sql.Date;
import java.util.List;


public class InformationService {
private InformationDAO_interface dao;
	
	public InformationService() {
		dao = new InformationDAO();
	}
	
	public InformationVO add(String information_name,String information_content,byte[] information_img,Date added_time,Date down_time) {
		InformationVO informationVO = new InformationVO();
		informationVO.setInformation_name(information_name);
		informationVO.setInformation_content(information_content);
		informationVO.setInformation_img(information_img);
		informationVO.setAdded_time(added_time);
		informationVO.setDown_time(down_time);
		dao.insert(informationVO);
		return informationVO;
	}
	public List<InformationVO> getAll() {
		return dao.getall();
	}
	public InformationVO update(String information_name,String information_content,byte[] information_img,Date added_time,Date down_time,Integer information_id) {
		InformationVO informationVO = new InformationVO();
		informationVO.setInformation_name(information_name);
		informationVO.setInformation_content(information_content);
		informationVO.setInformation_img(information_img);
		informationVO.setAdded_time(added_time);
		informationVO.setDown_time(down_time);
		informationVO.setInformation_id(information_id);
		dao.update(informationVO);
		return informationVO;
	}
	public InformationVO getone(Integer information_id) {
		return dao.getone(information_id);
	}

	public void delete(Integer information_id) {
		dao.delete(information_id);
	}
}
