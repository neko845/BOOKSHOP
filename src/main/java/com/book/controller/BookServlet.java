package com.book.controller;

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

import org.apache.taglibs.standard.tag.rt.fmt.RequestEncodingTag;

import com.book.model.BookService;
import com.book.model.BookVO;
import com.member.model.MemberVO;
import com.order.model.Order_contentService;
import com.order.model.Order_titleService;
import com.order.model.Order_titleVO;

@MultipartConfig
public class BookServlet extends HttpServlet{
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

				Integer bookId = new Integer(req.getParameter("bookId"));
				System.out.println(bookId);

				BookService bookSvc = new BookService();
				BookVO bookVO = bookSvc.getOne(bookId);
				System.out.println("查詢資料");
				
				req.setAttribute("bookVO", bookVO);
				String url = "/back-end/book/update.jsp";
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

			try {
				Integer bookId = new Integer(req.getParameter("bookId").trim());
				
				String bookName = req.getParameter("bookName").trim();
				if (bookName == null || bookName.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
				}
				System.out.println(bookName);
				
				String bookContent = req.getParameter("bookContent").trim();
				if (bookContent == null || bookContent.trim().length() == 0) {
					errorMsgs.add("商品介紹請勿空白");
				}
				System.out.println(bookContent);
				
				Integer bookQty = new Integer(req.getParameter("bookQty"));
				System.out.println(bookQty);
				
				byte[] bookImg = null;
				Part part = req.getPart("bookImg");
				InputStream in = part.getInputStream();
				//先判斷Part裡面有沒有資料，Part裡沒有資料代表沒有上或修改新照片
				if (in.available() <= 0) {
					BookService bookSVC = new BookService();
					BookVO vo = bookSVC.getOne(bookId);
					bookImg = vo.getBookImg();
				} else {
					bookImg = new byte[in.available()];
					in.read(bookImg);
					in.close();
				}
				
				java.sql.Date addedTime = null;
				try {
					addedTime = java.sql.Date.valueOf(req.getParameter("addedTime").trim());
				} catch (IllegalArgumentException e) {
					BookService BookSVC = new BookService();
					BookVO vo = BookSVC.getOne(bookId);
					addedTime = vo.getAddedTime();
				}
				
				java.sql.Date downTime = null;
				try {
					downTime = java.sql.Date.valueOf(req.getParameter("downTime").trim());
				} catch (IllegalArgumentException e) {
					BookService BookSVC = new BookService();
					BookVO vo = BookSVC.getOne(bookId);
					downTime = vo.getDownTime();
				}
				
				BookVO bookVO = new BookVO(); 
				bookVO.setBookName(bookName);
				bookVO.setBookContent(bookContent);
				bookVO.setBookQty(bookQty);
				bookVO.setBookImg(bookImg);
				bookVO.setAddedTime(addedTime);
				bookVO.setDownTime(downTime);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bookVO", bookVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/book/update.jsp");
					failureView.forward(req, res);
					return;
				}
				
				BookService bookSvc = new BookService();
				bookVO = bookSvc.update(bookName, bookContent, bookQty, bookImg, addedTime, downTime, bookId);
				
				req.setAttribute("bookVO", bookVO);
				String url = "/back-end/book/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/book/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				String bookName = req.getParameter("bookName").trim();
				if (bookName == null || bookName.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
				}
				
				String bookContent = req.getParameter("bookContent").trim();
				if (bookContent == null || bookContent.trim().length() == 0) {
					errorMsgs.add("商品介紹請勿空白");
				}
				
				Integer bookQty = new Integer(req.getParameter("bookQty"));
				if (bookContent == null || bookContent.trim().length() == 0) {
					errorMsgs.add("商品數量請勿空白");
				}
				
				byte[] bookImg = null;
				Part part = req.getPart("bookImg");
				System.out.println(part.getInputStream());
				InputStream in = part.getInputStream();
				if (in.available() == 0) {
					errorMsgs.add("商品圖片誤空白");
				} else {
					bookImg = new byte[in.available()];
					in.read(bookImg);
					in.close();
				}	
				
				java.sql.Date addedTime = null;
				try {
					addedTime = java.sql.Date.valueOf(req.getParameter("addedTime").trim());
				} catch (IllegalArgumentException e) {
					addedTime=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入上架時間!");
				}
				
				java.sql.Date downTime = null;
				try {
					downTime = java.sql.Date.valueOf(req.getParameter("downTime").trim());
				} catch (IllegalArgumentException e) {
					downTime=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入下架時間!");
				}
				
				BookVO bookVO = new BookVO();
				bookVO.setBookName(bookName);
				bookVO.setBookContent(bookContent);
				bookVO.setBookQty(bookQty);
				bookVO.setBookImg(bookImg);
				bookVO.setAddedTime(addedTime);
				bookVO.setDownTime(downTime);
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bookVO", bookVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/book/addBook.jsp");
					failureView.forward(req, res);
					return;
				}
				
				BookService bookSvc = new BookService();
				bookVO = bookSvc.add(bookName, bookContent, bookQty, bookImg, addedTime, downTime);
				
				String url = "/back-end/book/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/book/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("delete".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				Integer bookId = new Integer(req.getParameter("bookId"));
				System.out.println("請求成功");
				
				BookService bookSvc = new BookService();
				bookSvc.delete(bookId);
				System.out.println("刪除成功");

				String url = "/back-end/book/listall.jsp";
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
		
		if ("buycar".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			List<BookVO> list = (List)session.getAttribute("buycar");
			try {
				
				Integer bookId = Integer.valueOf(req.getParameter("bookId"));
				System.out.println(bookId);

				BookService bookSvc = new BookService();
				
				BookVO bookVO = bookSvc.getOne(bookId);
				// TODO if VO is null;
				if(bookVO == null) {
					errorMsgs.add("查無資料");
				}
				if(list == null) {
					list = new ArrayList<BookVO>();
					list.add(bookVO);
					session.setAttribute("buycar", list);
				}else if(list.contains(bookVO)){
					errorMsgs.add("已在購物車內");
				}else {
					list.add(bookVO);
				}
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bookVO", bookVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/book/listall.jsp");
					failureView.forward(req, res);
					return;
				}
				
				String url = "/front-end/book/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/book/listall.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("deletecar".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			List<BookVO> list = (List)session.getAttribute("buycar");
			try {

				Integer bookId = Integer.valueOf(req.getParameter("bookId"));
				System.out.println(bookId);

				BookService bookSvc = new BookService();
				
				BookVO bookVO = bookSvc.getOne(bookId);
				// TODO if VO is null;
				if(bookVO == null) {
					errorMsgs.add("查無資料");
				}
				if(list.contains(bookVO)){
					list.remove(list.indexOf(bookVO));
				}else {
					errorMsgs.add("商品已移除");
				}
				
				String url = "/front-end/book/buycar.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/book/buycar.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("check".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			List<BookVO> list = (List)session.getAttribute("buycar");
			try {
				if(memberVO == null) {
					errorMsgs.add("請登入");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/member/index.jsp");
					failureView.forward(req, res);
					return;
				}
				
				if(list == null) {
					errorMsgs.add("請加入商品");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/book/buycar.jsp");
					failureView.forward(req, res);
					return;
				}
				
				String url = "/front-end/book/checkout.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/book/buycar.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("checkout".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			List<BookVO> list = (List)session.getAttribute("buycar");
			try {
				if(memberVO == null) {
					errorMsgs.add("請登入");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/member/index.jsp");
					failureView.forward(req, res);
					return;
				}
				
				if(list == null) {
					errorMsgs.add("請加入商品");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/book/buycar.jsp");
					failureView.forward(req, res);
					return;
				}
				
				
				long miliseconds = System.currentTimeMillis();
				java.sql.Date order_time = new java.sql.Date(miliseconds);
				
				
				Order_titleService order_titleSvc = new Order_titleService();

				order_titleSvc.insert(memberVO.getMember_account(), order_time);
				
				Order_titleVO order_titlevo = order_titleSvc.getdate(order_time);
				
				Order_contentService Order_contentSvc = new Order_contentService();
				
				for(BookVO vo : list) {
					Order_contentSvc.add(order_titlevo.getOrder_id(), vo.getBookId());
				}
				
				session.removeAttribute("buycar");
				
				String url = "/front-end/order/listall.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法取的資料" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/book/checkout.jsp");
				failureView.forward(req, res);
			}
		}
		

	}
}
