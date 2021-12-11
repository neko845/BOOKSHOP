package com.Filter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.administrator.model.*;

public class AdministratorFilter implements Filter {

	
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		
		AdministratorVO administratorVO = (AdministratorVO) session.getAttribute("administratorVO");
		System.out.println(administratorVO);
		if (administratorVO.getAdministrator_authority()!=0) {

			request.getRequestDispatcher("/back-end/administrator/listone.jsp").forward(request, response);
		}else {
			chain.doFilter(request, response);
		}
	}
}
