package com.Filter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;

public class MemberFilter implements Filter {

	
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		System.out.println(memberVO);
		if (null == memberVO) {

			request.getRequestDispatcher("/member/index.jsp").forward(request, response);
		}else {
			chain.doFilter(request, response);
		}
	}
}
