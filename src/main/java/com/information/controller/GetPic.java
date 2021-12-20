package com.information.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.information.model.InformationService;
import com.information.model.InformationVO;


public class GetPic extends HttpServlet{
public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		ServletOutputStream out = res.getOutputStream();
		res.setContentType("image/jpg");
		
		Integer picId = Integer.valueOf(req.getParameter("picno"));
		
		InformationService svc = new InformationService();
		
		InformationVO vo = svc.getone(picId);
		
		out.write(vo.getInformation_img());
	}
}
