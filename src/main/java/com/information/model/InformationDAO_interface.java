package com.information.model;

import java.util.List;

public interface InformationDAO_interface {
	public void insert(InformationVO informationVO);
	public void delete(Integer information_id);
	public void update(InformationVO informationVO);
	public InformationVO getone(Integer information_id);
	public List<InformationVO> getall();
}
