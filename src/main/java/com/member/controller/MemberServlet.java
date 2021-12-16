package com.member.controller;

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
		
		if ("getOne_For_Update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {

				String member_account = req.getParameter("member_account");

				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.one(member_account);
				
				req.setAttribute("memberVO", memberVO);
				String url = "/front-end/member/update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/book/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
				
			try {
				MemberVO memberVO = (MemberVO)session.getAttribute("memberVO"); 
				
				String member_password = req.getParameter("member_password").trim();
				if (member_password == null || member_password.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}
				String member_nick = req.getParameter("member_nick").trim();
				if (member_nick == null || member_nick.trim().length() == 0) {
					errorMsgs.add("暱稱請勿空白");
				}
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/member/update.jsp");
					failureView.forward(req, res);
					return;
				}
				
				MemberService memberSvc = new MemberService();
				memberVO = memberSvc.update(memberVO.getMember_account(),member_password,member_nick,memberVO.getCreat_time(),memberVO.getMember_state(),memberVO.getMember_id());
				
				session.removeAttribute("memberVO");
				String url = "/front-end/member/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				}catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/listOne.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		
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
		
		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				String member_account = req.getParameter("member_account").trim();
				if (member_account == null || member_account.trim().length() == 0) {
					errorMsgs.add("會員帳號請勿空白");
				}
				
				String member_password = req.getParameter("member_password").trim();
				if (member_password == null || member_password.trim().length() == 0) {
					errorMsgs.add("會員密碼請勿空白");
				}
				
				String member_nick = req.getParameter("member_nick").trim();
				if (member_nick == null || member_nick.trim().length() == 0) {
					errorMsgs.add("會員暱稱請勿空白");
				}
				
				long miliseconds = System.currentTimeMillis();
				java.sql.Date creat_time = new java.sql.Date(miliseconds);
				System.out.println(creat_time);
				
				Integer member_state = 0;
				
				MemberVO memberVO = new MemberVO();
				memberVO.setMember_account(member_account);
				memberVO.setMember_password(member_password);
				memberVO.setMember_nick(member_nick);
				memberVO.setCreat_time(creat_time);
				memberVO.setMember_state(member_state);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memberVO", memberVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/member/addmember.jsp");
					failureView.forward(req, res);
					return;
				}
				
				MemberService memberSvc = new MemberService();
				memberVO = memberSvc.add(member_account, member_password, member_nick, creat_time, member_state);
				
				String url = "/front-end/member/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/index.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				Integer member_id = Integer.valueOf(req.getParameter("member_id"));
				System.out.println("請求成功");
				
				MemberService memberSvc = new MemberService();
				memberSvc.delete(member_id);
				System.out.println("刪除成功");

				String url = "/back-end/member/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("刪除完成");

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/book/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("blockade".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			
			
			try {
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				
				memberVO.setMember_state(1);
				
				MemberService memberSvc = new MemberService();
				memberSvc.update(memberVO.getMember_account(), memberVO.getMember_password(), memberVO.getMember_nick(), memberVO.getCreat_time(), memberVO.getMember_state(), memberVO.getMember_id());
				System.out.println("封鎖成功");

				String url = "/front-end/member/listOne.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/book/listOne.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("add".equals(action)) { 

				String url = "/front-end/member/addmember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
		
		
	}
}
	