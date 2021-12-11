package com.administrator.controller;

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

import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorVO;
import com.member.model.*;

@MultipartConfig
public class AdministratorServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);

		if ("login".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();

			try {

				String administrator_account = req.getParameter("administrator_account");
				if (administrator_account == null || (administrator_account.trim()).length() == 0) {

					errorMsgs.add("請輸入帳號");
				}
				System.out.println(administrator_account);

				String administrator_password = req.getParameter("administrator_password");
				if (administrator_password == null || (administrator_password.trim()).length() == 0) {

					errorMsgs.add("請輸入密碼");
				}
				System.out.println(administrator_password);

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/index.jsp");
					failureView.forward(req, res);
					return;
				}

				AdministratorService administratorSvc = new AdministratorService();
				AdministratorVO administratorVO = administratorSvc.one(administrator_account);
				if (administratorVO == null) {
					System.out.println("帳號錯誤");
					errorMsgs.add("帳號錯誤");
				} else if (!administratorVO.getAdministrator_password().equals(administrator_password)) {
					System.out.println("密碼錯誤");
					errorMsgs.add("密碼錯誤");
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/index.jsp");
					failureView.forward(req, res);
					return;
				}

				session.setAttribute("administratorVO", administratorVO);
				String url = "/back-end/administrator/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/index.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) {

//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				String administrator_account = req.getParameter("administrator_account");
//
//				AdministratorService administratorSvc = new AdministratorService();
//				AdministratorVO administratorVO = administratorSvc.one(administrator_account);
//
//				req.setAttribute("administratorVO", administratorVO);
				String url = "/back-end/administrator/update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

//			} catch (Exception e) {
//				errorMsgs.add("無法取的資料" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/book/listall.jsp");
//				failureView.forward(req, res);
//			}
		}

		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();

			try {
				AdministratorVO administratorVO = (AdministratorVO) session.getAttribute("administratorVO");

				String administrator_password = req.getParameter("administrator_password").trim();
				if (administrator_password == null || administrator_password.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}

				if (!errorMsgs.isEmpty()) {
					req.setAttribute("administratorVO", administratorVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/update.jsp");
					failureView.forward(req, res);
					return;
				}

				AdministratorService administratorSvc = new AdministratorService();
				administratorVO = administratorSvc.update(administratorVO.getAdministrator_account(),
						administrator_password, administratorVO.getAdministrator_class(),
						administratorVO.getAdministrator_authority(), administratorVO.getAdministrator_id());

				session.removeAttribute("administratorVO");
				String url = "/back-end/administrator/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/listOne.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				String administrator_account = req.getParameter("administrator_account").trim();
				if (administrator_account == null || administrator_account.trim().length() == 0) {
					errorMsgs.add("管理員帳號請勿空白");
				}
				
				String administrator_password = req.getParameter("administrator_password").trim();
				if (administrator_password == null || administrator_password.trim().length() == 0) {
					errorMsgs.add("管理員密碼請勿空白");
				}
				
				
				Integer administrator_class = Integer.valueOf(req.getParameter("administrator_class"));
				if (administrator_class == null) {
					errorMsgs.add("管理員階級請勿空白");
				}
				
				Integer administrator_authority = Integer.valueOf(req.getParameter("administrator_authority"));
				if (administrator_authority == null) {
					errorMsgs.add("管理員權限請勿空白");
				}
				
				AdministratorVO administratorVO = new AdministratorVO();
				administratorVO.setAdministrator_account(administrator_account);
				administratorVO.setAdministrator_password(administrator_password);
				administratorVO.setAdministrator_class(administrator_class);
				administratorVO.setAdministrator_authority(administrator_authority);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("administratorVO", administratorVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/administrator/addadministrator.jsp");
					failureView.forward(req, res);
					return;
				}
				
				AdministratorService administratorSvc = new AdministratorService();
				administratorVO = administratorSvc.add(administrator_account, administrator_password, administrator_class, administrator_authority);
				
				String url = "/back-end/administrator/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/listall.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				Integer administrator_id = Integer.valueOf(req.getParameter("administrator_id"));
				System.out.println("請求成功");
				
				AdministratorService administratorSvc = new AdministratorService();
				administratorSvc.delete(administrator_id);
				System.out.println("刪除成功");

				String url = "/back-end/administrator/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("刪除完成");

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/administrator/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_UpdateClass".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer administrator_id = Integer.valueOf(req.getParameter("administrator_id"));

				AdministratorService administratorSvc = new AdministratorService();
				AdministratorVO administratorVO = administratorSvc.oneId(administrator_id);

				req.setAttribute("administratorVO", administratorVO);
				String url = "/back-end/administrator/updateclass.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/book/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("updateclass".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				Integer administrator_id = Integer.valueOf(req.getParameter("administrator_id"));
				
				AdministratorService administratorSvc = new AdministratorService();
				AdministratorVO vo = administratorSvc.oneId(administrator_id);
				
				Integer administrator_class = Integer.valueOf(req.getParameter("administrator_class"));
				if (administrator_class == null) {
					errorMsgs.add("階級請勿空白");
				}
				Integer administrator_authority = Integer.valueOf(req.getParameter("administrator_authority"));
				if (administrator_authority == null) {
					errorMsgs.add("權限請勿空白");
				}
				
				AdministratorVO administratorVO = new AdministratorVO();
				administratorVO.setAdministrator_id(administrator_id);
				administratorVO.setAdministrator_account(vo.getAdministrator_account());
				administratorVO.setAdministrator_password(vo.getAdministrator_password());
				administratorVO.setAdministrator_class(administrator_class);
				administratorVO.setAdministrator_authority(administrator_authority);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("administratorVO", administratorVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/updateclass.jsp");
					failureView.forward(req, res);
					return;
				}

				administratorVO = administratorSvc.update(administratorVO.getAdministrator_account(),
						administratorVO.getAdministrator_password(), administrator_class,
						administrator_authority, administratorVO.getAdministrator_id());

				
				String url = "/back-end/administrator/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/administrator/listall.jsp");
				failureView.forward(req, res);
			}
		}
		

	}
}
