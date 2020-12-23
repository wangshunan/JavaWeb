<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix= "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix= "fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>リスト</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="css/booklist.css" type="text/css">
<script type="text/javascript" src="bootstrap/js/jquery-3.5.1.slim.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<div class="container">
		<div class="text-center m-4">
			<h1> BookList </h1>
		</div>

		<!-- Modify&Delete Button -->
		<script type="text/javascript">
			function onModify(idx) {
				document.getElementById(idx).name = "idx";
				document.table1.action = "./ModifyServlet";
				document.table1.submit();
			}

			function onDelete(idx) {
				document.getElementById(idx).name = "idx";
				document.table1.action = "./DeleteServlet";
				document.table1.submit();
			}
		</script>

		<h3><font color="red"></font></h3>
		<form action="" method="post" name="table1">
			<div>
				<table class="table table-bordered table-hover">
					<thead>
					<tr>
						<th scope="col" class="th1">番号</th>
						<th scope="col" class="th1">書名</th>
						<th scope="col" class="th1">作者</th>
						<th scope="col" class="th1">出版社</th>
						<th scope="col" class="th1">発行日</th>
						<th scope="col" class="th1">値段</th>
						<th scope="col">
							<button data-toggle="modal" data-target="#staticBackdrop"
							        type="button" name="newData" class="btn btn-primary ml-2 pd-0">
							        新規追加
							</button>
						</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${applicationScope.booklist}" var="book" varStatus="idx">
						<tr>
							<th scope="row" class="td1">${idx.index + 1}</th>
							<td style="display:none"><input type="text" style="display:none" id="${idx.index}" name="" value="${idx.index}"></td>
							<td class="td1">${book.name}</td>
							<td class="td1">${book.author}</td>
							<td class="td1">${book.publisher}</td>
							<td class="td1">${book.date}</td>
							<td class="td1" style="color: red;">
								￥<fmt:formatNumber value="${book.price}" pattern="0,000.00"></fmt:formatNumber>
							</td>
							<td class="btn-modify">
								<button type="button" class="btn btn-primary mr-4 ml-2" onclick="onModify('${idx.index}')">
									修正
								</button>
								<button type="button" class="btn btn-danger" onclick="onDelete('${idx.index}')">
									削除
								</button>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
	</div>

	<!-- ResetFromData -->
	<script type="text/javascript">
		function formReset() {
			document.getElementById("add").reset();
		}
	</script>
	<!-- CreateModal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">データ登録</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="formReset()">
					<span aria-hidden="true">&times;</span>
				</button>
				</div>
				<div class="modal-body">
				<div class="container">
					<div>
						<form action="./CreateBook" method="post" id="add">
							<div class="form-group">
								<label>書名</label>
								<input type="text" class="form-control" name="name" placeholder="">
							</div>
							<div class="form-group">
								<label>作者</label>
								<input type="text" class="form-control" name="author" placeholder="">
							</div>
							<div class="form-group">
								<label>出版社</label>
								<input type="text" class="form-control" name="publisher" placeholder="">
							</div>
							<div class="form-group">
								<label>発行日</label>
								<input type="date" class="form-control" name="date" placeholder="">
							</div>
							<div class="form-group">
								<label>値段</label>
								<input type="number" class="form-control" name="price" placeholder="">
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="formReset()">
									Close
								</button>
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>