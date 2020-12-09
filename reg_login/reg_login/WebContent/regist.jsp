<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録</title>
<link rel="stylesheet" href="./css/reg.css">
</head>
<body>
	<div class="reg">
		<div class="header">
			<h1>
				<a href="./login.jsp">ログイン</a> <a href="./regist.jsp">新規登録</a>
			</h1>
		</div>
		<!--
			文件上传的条件
			* 表单必须是post提交方式
			* 表单中必须有文件上传项，文件上传项必须有name属性和值
			* 表单的enctype属性必须设置为multipart/form-data
		 -->
		<%
			String msg = "";
			if(request.getAttribute("msg")!=null){
				msg = (String)request.getAttribute("msg");
			}
		%>
		<h3><font color="red"><%= msg %></font></h3>
		<form action="./RegistServlet" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td class="td1">ユーザー名</td>
					<td><input type="text" class="input1" name="username"></td>
				</tr>
				<tr>
					<td class="td1">パスワード</td>
					<td><input type="password" class="input1" name="password"></td>
				</tr>
				<tr>
					<td class="td1">ニックネーム</td>
					<td><input type="text" class="input1" name="nickname"></td>
				</tr>
				<tr>
					<td class="td1">性別</td>
					<td>
						<input type="radio" name="sex" value="male">男
						<input type="radio" name="sex" value="female">女
					</td>
				</tr>
				<tr>
					<td class="td1">アバター</td>
					<td><input type="file" id="photo" name="upload"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="btn-red">
							<input type="submit" value="登録" id="reg-btn">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>