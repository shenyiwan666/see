package com.see.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FilterController extends HttpServlet implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;
		String URI = request.getRequestURI();
		
		
		System.out.print(URI);
		
		
	        if ("/login".equals(URI) || "/register".equals(URI) || URI.indexOf("resources") > 0 || URI.indexOf(".jsp") > 0) {
	            chain.doFilter(request, response);
	            return;
	        } else {
	            Object obj = request.getSession().getAttribute("account");
	            if (obj == null) {
	                request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
	            } else
	                chain.doFilter(request, response);
	        }
	}
	
}
