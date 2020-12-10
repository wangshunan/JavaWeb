<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>図書データ登録</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/modify.css" type="text/css">
<script type="text/javascript" src="bootstrap/js/jquery-3.5.1.slim.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<div class="container">
		<div class="title text-center mb-3">
			<h1> データ修正 </h1>
		</div>
		<div>
			<form action="./ModifyBook" method="post">
				<div class="form-group">
					<label>書名</label>
					<input type="text" class="form-control" name="name" value="${modifyBook.name}">
				</div>
				<div class="form-group">
					<label>作者</label>
					<input type="text" class="form-control" name="author" value="${modifyBook.author}">
				</div>
				<div class="form-group">
					<label>出版社</label>
					<input type="text" class="form-control" name="publisher" value="${modifyBook.publisher}">
				</div>
				<div class="form-group">
					<label>発行日</label>
					<input type=date class="form-control" name="date" value="${modifyBook.date}">
				</div>
				<div class="form-group">
					<label>値段</label>
					<input type="text" class="form-control" name="price" value="${modifyBook.price}">
				</div>
				<div class="form-group pb-3">
					<button type="submit" class="btn btn-primary">保存</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>