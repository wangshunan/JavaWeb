<%@page import="com.imooc.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン成功</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
	<%
		User user = (User)session.getAttribute("user");
		if(user != null){
			String fileName = "default.jpg";
			if(user.getPath() != null) {
				System.out.println(user.getPath());
				// 获得绝对路径最后一个\的位置
				int idx = user.getPath().lastIndexOf("\\");
				// 获得文件上传的唯一文件名：
				fileName = user.getPath().substring(idx+1);
			}
			session.setAttribute("user", user);
	%>
	<div class="login">
		<div class="header">
			<h1>ログイン成功</h1>
		</div>
		<div class="content">
			<table align="center">
				<tr>
					<td align="center"><img src="/reg_login/upload/<%= fileName %>"/></td>
				</tr>
				<tr>
					<td align="center">Welcome、<%= user.getNickname() %>！</td>
				</tr>
				<tr>
					<td align="center"><form action="list" method="post"><button type="submit">点我跳转</button></form></td>
				</tr>
			</table>

		</div>
	</div>
	<%
		}else{
	%>
	<div class="login">
		<div class="header">
			<h1>ログインしていません！<a href="/reg_login/login.jsp">ログイン</a></h1>
		</div>
	</div>
	<%
		}
	%>


</body>
</html>