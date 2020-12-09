<%@page import="com.imooc.utils.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインページ</title>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
	<div class="login">
		<div class="header">
			<h1>
				<a href="./login.jsp">ログイン</a> <a href="./regist.jsp">新規登録</a>
			</h1>

		</div>
		<%
			String username="";
			// 获得从客户端携带过来的所有的Cookie
			Cookie[] cookies = request.getCookies();
			// 从Cookie的数组中查找指定名称的Cookie
			Cookie cookie = CookieUtils.findCookie(cookies, "username");
			if(cookie != null){
				username = cookie.getValue();
			}

			if(session.getAttribute("username")!=null){
				username = (String)session.getAttribute("username");
			}

			String msg = "";
			if(request.getAttribute("msg")!=null){
				msg = (String)request.getAttribute("msg");
			}

		%>
		<h3><font color="red"><%=msg %></font></h3>
		<form action="./LoginServlet" method="post">
			<table>
				<tr>
					<td class="td1">ユーザー名</td>
					<td><input type="text" class="input1" name="username" value="<%=username%>"></td>
				</tr>
				<tr>
				<td class="td1">パスワード</td>
				<td><input type="password" class="input1" name="password"></td>
				</tr>
				<tr>
				<td class="td1" colspan="2">
					<input type="checkbox" name="remember" value="true" checked="checked"> ユーザー名記憶</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="btn-red">
							<input type="submit" value="ログイン" id="login-btn">
						</div>
					</td>
				</tr>
			</table>

		</form>
	</div>
</body>
</html>