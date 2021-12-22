package com.order.controller;

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

import com.order.model.Order_contentService;
import com.order.model.Order_contentVO;
import com.order.model.Order_titleService;
import com.order.model.Order_titleVO;
import com.book.model.BookService;
import com.book.model.BookVO;
import com.order.model.*;

@MultipartConfig
public class OrderServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);
		
		
		if ("delete".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				Integer order_id = Integer.valueOf(req.getParameter("order_id"));
				System.out.println("請求成功");
				
				Order_contentService order_contentSvc = new Order_contentService();
				order_contentSvc.deleteall(order_id);
				Order_titleService Order_titleSvc = new Order_titleService();
				Order_titleSvc.delete(order_id);
				System.out.println("刪除成功");

				String url = "/back-end/order/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("刪除完成");

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/listone.jsp");
				failureView.forward(req, res);
			}
	
		}
		
		if ("deleteone".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				Integer book_id = Integer.valueOf(req.getParameter("book_id"));
				Integer order_id = Integer.valueOf(req.getParameter("order_id"));
				System.out.println("請求成功");
				
				Order_contentService order_contentSvc = new Order_contentService();
				order_contentSvc.deleteone(order_id, book_id);
				System.out.println("刪除成功");

				String url = "/back-end/order/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("刪除完成");

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/listone.jsp");
				failureView.forward(req, res);
			}
	
		}
		
		if ("getall".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				Integer order_id = Integer.valueOf(req.getParameter("order_id"));
				
				Order_titleService order_titleSvc = new Order_titleService();
				
				Order_titleVO order_titleVO = order_titleSvc.getone(order_id);

				Order_contentService order_contentSvc = new Order_contentService();
				
				List<Order_contentVO> list = order_contentSvc.getAll(order_id);
				List<BookVO> booklist = new ArrayList<BookVO>();
				BookService svc = new BookService();
				
				for(Order_contentVO vo : list) {
					
					BookVO bookvo = svc.getOne(vo.getBook_id());
					booklist.add(bookvo);
				}
				
				if(list == null) {
					errorMsgs.add("查無資料");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/order/listall.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("order_titleVO", order_titleVO);
				req.setAttribute("list", booklist);
				String url = "/back-end/order/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/order/listone.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getallone".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {

				Integer order_id = Integer.valueOf(req.getParameter("order_id"));
				
				Order_titleService order_titleSvc = new Order_titleService();
				
				Order_titleVO order_titleVO = order_titleSvc.getone(order_id);

				Order_contentService order_contentSvc = new Order_contentService();
				
				List<Order_contentVO> list = order_contentSvc.getAll(order_id);
				List<BookVO> booklist = new ArrayList<BookVO>();
				BookService svc = new BookService();
				
				for(Order_contentVO vo : list) {
					
					BookVO bookvo = svc.getOne(vo.getBook_id());
					booklist.add(bookvo);
				}
				
				if(list == null) {
					errorMsgs.add("查無資料");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/order/listall.jsp");
					failureView.forward(req, res);
					return;
				}
				
				req.setAttribute("order_titleVO", order_titleVO);
				req.setAttribute("list", booklist);
				String url = "/front-end/order/listone.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/order/listall.jsp");
				failureView.forward(req, res);
			}
		}
		

	}
}
