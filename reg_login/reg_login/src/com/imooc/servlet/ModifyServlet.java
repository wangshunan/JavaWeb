package com.imooc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imooc.domain.Book;

public class ModifyServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		List<Book> list = (List<Book>) context.getAttribute("booklist");
		int i = Integer.parseInt(request.getParameter("idx"));
		Book b = list.get(i);
		request.setAttribute("modifyBook", b);
		request.getSession().setAttribute("idx", i);
		request.getRequestDispatcher("/bookmodify.jsp").forward(request, response);
	}

}
