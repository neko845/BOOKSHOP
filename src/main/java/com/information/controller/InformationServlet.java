package com.information.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.information.model.*;


@MultipartConfig
public class InformationServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);
		
		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				Integer information_id = Integer.valueOf(req.getParameter("information_id"));
				System.out.println(information_id);

				InformationService informationSvc = new InformationService();
				InformationVO informationVO = informationSvc.getone(information_id);
				System.out.println("查詢資料");
				
				req.setAttribute("informationVO", informationVO);
				String url = "/back-end/information/update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/information/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer information_id = Integer.valueOf(req.getParameter("information_id"));
				
				String information_name = req.getParameter("information_name").trim();
				if (information_name == null || information_name.trim().length() == 0) {
					errorMsgs.add("活動標題請勿空白");
				}
				System.out.println(information_name);
				
				String information_content = req.getParameter("information_content").trim();
				if (information_content == null || information_content.trim().length() == 0) {
					errorMsgs.add("活動內容請勿空白");
				}
				System.out.println(information_content);
				
				byte[] information_img = null;
				Part part = req.getPart("information_img");
				InputStream in = part.getInputStream();
				//先判斷Part裡面有沒有資料，Part裡沒有資料代表沒有上或修改新照片
				if (in.available() <= 0) {
					InformationService informationSVC = new InformationService();
					InformationVO vo = informationSVC.getone(information_id);
					information_img = vo.getInformation_img();
				} else {
					information_img = new byte[in.available()];
					in.read(information_img);
					in.close();
				}
				
				java.sql.Date added_time = null;
				try {
					added_time = java.sql.Date.valueOf(req.getParameter("added_time").trim());
				} catch (IllegalArgumentException e) {
					InformationService informationSVC = new InformationService();
					InformationVO vo = informationSVC.getone(information_id);
					added_time = vo.getAdded_time();
				}
				
				java.sql.Date down_time = null;
				try {
					down_time = java.sql.Date.valueOf(req.getParameter("down_time").trim());
				} catch (IllegalArgumentException e) {
					InformationService informationSVC = new InformationService();
					InformationVO vo = informationSVC.getone(information_id);
					down_time = vo.getDown_time();
				}
				
				InformationVO informationvo = new InformationVO(); 
				informationvo.setInformation_name(information_name);
				informationvo.setInformation_content(information_content);
				informationvo.setInformation_img(information_img);
				informationvo.setAdded_time(added_time);
				informationvo.setDown_time(down_time);
				informationvo.setInformation_id(information_id);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("informationVO", informationvo);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/information/update.jsp");
					failureView.forward(req, res);
					return;
				}
				
				InformationService informationSVC = new InformationService();
				informationvo = informationSVC.update(information_name, information_content, information_img, added_time, down_time, information_id);
				
				req.setAttribute("informationVO", informationvo);
				String url = "/back-end/information/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/information/update.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				String information_name = req.getParameter("information_name").trim();
				if (information_name == null || information_name.trim().length() == 0) {
					errorMsgs.add("活動標題請勿空白");
				}
				
				String information_content = req.getParameter("information_content").trim();
				if (information_content == null || information_content.trim().length() == 0) {
					errorMsgs.add("活動內容請勿空白");
				}
				
				byte[] information_img = null;
				Part part = req.getPart("information_img");
				InputStream in = part.getInputStream();
				if (in.available() == 0) {
					errorMsgs.add("活動圖片誤空白");
				} else {
					information_img = new byte[in.available()];
					in.read(information_img);
					in.close();
				}	
				
				java.sql.Date added_time = null;
				try {
					added_time = java.sql.Date.valueOf(req.getParameter("added_time").trim());
				} catch (IllegalArgumentException e) {
					added_time=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入開始時間!");
				}
				
				java.sql.Date down_time = null;
				try {
					down_time = java.sql.Date.valueOf(req.getParameter("down_time").trim());
				} catch (IllegalArgumentException e) {
					down_time=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入結束時間!");
				}
				
				InformationVO informationvo = new InformationVO(); 
				informationvo.setInformation_name(information_name);
				informationvo.setInformation_content(information_content);
				informationvo.setInformation_img(information_img);
				informationvo.setAdded_time(added_time);
				informationvo.setDown_time(down_time);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("informationVO", informationvo); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/information/addInformation.jsp");
					failureView.forward(req, res);
					return;
				}
				
				InformationService informationSvc = new InformationService();
				informationvo = informationSvc.add(information_name, information_content, information_img, added_time, down_time);
				
				String url = "/back-end/information/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/information/addInformation.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				Integer information_id = Integer.valueOf(req.getParameter("information_id"));
				System.out.println("請求成功");
				
				InformationService informationSvc = new InformationService();
				informationSvc.delete(information_id);
				System.out.println("刪除成功");

				String url = "/back-end/information/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("刪除完成");

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/information/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getone".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			

			try {

				Integer information_id = Integer.valueOf(req.getParameter("information_id"));
				System.out.println(information_id);

				InformationService informationSvc = new InformationService();
				InformationVO informationVO = informationSvc.getone(information_id);
				System.out.println("查詢資料");
				
				req.setAttribute("informationVO", informationVO);
				String url = "/front-end/information/getone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/information/listall.jsp");
				failureView.forward(req, res);
			}
		}
		

	}
}
