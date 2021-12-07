package com.book.controller;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

import com.book.model.*;


public class GetPic extends HttpServlet {


	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		ServletOutputStream out = res.getOutputStream();
		res.setContentType("image/jpg");
		
		Integer picId = Integer.valueOf(req.getParameter("picno"));
		
		BookService svc = new BookService();
		
		BookVO vo = svc.getOne(picId);
		
		out.write(vo.getBookImg());
	}
}
