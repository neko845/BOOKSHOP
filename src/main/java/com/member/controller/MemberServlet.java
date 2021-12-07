package com.member.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.*;

@MultipartConfig
public class MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);
		if ("getOne".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			
			try {
				
				String member_account = req.getParameter("member_account");
				if (member_account == null || (member_account.trim()).length() == 0) {
					
					errorMsgs.add("請輸入帳號");
				}
				System.out.println(member_account);
				
				String member_password = req.getParameter("member_password");
				if (member_password == null || (member_password.trim()).length() == 0) {
					
					errorMsgs.add("請輸入密碼");
				}
				System.out.println(member_password);
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/member/index.jsp");
					failureView.forward(req, res);
					return;
				}
				
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.one(member_account);
				if(memberVO == null) {
					System.out.println("帳號錯誤");
					errorMsgs.add("帳號錯誤");
				}else if(!memberVO.getMember_password().equals(member_password)) {
					System.out.println("密碼錯誤");
					errorMsgs.add("密碼錯誤");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/member/index.jsp");
					failureView.forward(req, res);
					return;
				}
				
				session.setAttribute("memberVO", memberVO);
				String url = "/front-end/member/listOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/index.jsp");
				failureView.forward(req, res);
			}
		}
		
	}
}
	