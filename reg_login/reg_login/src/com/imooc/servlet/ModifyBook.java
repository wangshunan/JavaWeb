package com.imooc.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.imooc.domain.Book;
import com.imooc.domain.User;
import com.imooc.model.BookDataManager;

/**
 * Servlet implementation class ModifyBook
 */
public class ModifyBook extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String key, value;
		Map<String, String> map = new HashMap<String,String>();
		User u = (User)request.getSession().getAttribute("user");
		List<Book> list = u.getBooklist();
		int idx = (int)request.getSession().getAttribute("idx");

		var element = request.getParameterNames();
        while (element.hasMoreElements()) {
            key = element.nextElement();
            value = request.getParameter(key);
            map.put(key, value);
        }

        list.set(idx,BookDataManager.Create(map));
        response.sendRedirect(request.getContextPath()+"/list");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
