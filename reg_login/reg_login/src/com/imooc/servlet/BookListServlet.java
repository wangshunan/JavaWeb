package com.imooc.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imooc.domain.Book;
import com.imooc.domain.User;

/**
 * Servlet implementation class BookListServlet
 */
public class BookListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User u = (User)request.getSession().getAttribute("user");
			ServletContext context = request.getServletContext();
			if ( u == null ) {
				response.sendRedirect(request.getContextPath()+"/success.jsp");
				return;
			}

			if ( u.getBooklist() == null ) {
				List<Book> list = new ArrayList<Book>();
				u.setBooklist(list);
			}

			context.setAttribute("booklist", u.getBooklist());
			request.getRequestDispatcher("/booklist.jsp").forward(request, response);
		} catch(Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
