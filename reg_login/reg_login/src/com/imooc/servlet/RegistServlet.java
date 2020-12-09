package com.imooc.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.imooc.domain.User;
import com.imooc.model.Regist;

/**
 * 用户注册的Servlet
 */
public class RegistServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 数据的接收
		try {
			// 1.创建一个磁盘文件项工厂对象
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			// 2.创建一个核心解析类
			ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
			// 3.解析request请求，返回的是List集合，List集合中存放的是FileItem对象
			List<FileItem> list = servletFileUpload.parseRequest(request);
			// 获得ServletContext对象:
			List<User> userList = (List<User>) this.getServletContext().getAttribute("list");
			// 创建注册处理对象
			Regist r = new Regist();
			// 获取文件储存路径
			String path = this.getServletContext().getRealPath("/upload");
			// 注册用户信息
			String result = r.UserRegist(list, userList, path);
			// 校验用户名:
			if(result == "existed"){
				request.setAttribute("msg", "用户名已经存在！");
				request.getRequestDispatcher("/regist.jsp").forward(request, response);
				return ;
			}
			if(result == "finished") {
				this.getServletContext().setAttribute("list", userList);
				User u = userList.get(userList.size() - 1);
				// 注册成功，跳转到登录页面:
				request.getSession().setAttribute("username", u.getUsername());
				request.getSession().setAttribute("user", u);
				response.sendRedirect(request.getContextPath()+"/login.jsp");
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
