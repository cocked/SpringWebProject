<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>�Խ���</title>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form[name='readForm']");
		
		$(".update_btn").on("click", function(){
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		})
		
		$(".delete_btn").on("click", function(){
			formObj.attr("action", "/board/delete");
			formObj.attr("method", "post");
			formObj.submit();
		})
		
		$(".list_btn").on("click", function(){
			location.href = "/board/list";
		})
	})
</script>

<body>
	<div id="root">
		<header>
			<h1>�Խ���</h1>
		</header>
		<hr />

		<nav>Ȩ - �� �ۼ�</nav>
		<hr />

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" id="bno" name="num" value="${read.num}" />
			</form>
			<table>
				<tbody>
					<!-- 
					<tr>
						<td><label for="num">�� ��ȣ</label><input type="text" id="num"
							value="${read.num}" /></td>
					</tr>
					 -->
					<tr>
						<td><label for="title">����</label><input type="text"
							id="title" name="title" value="${read.title}" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<td><label for="content">�� ����</label><input type="text"
							id="content" name="content" value="${read.content}"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="writer">�ۼ���</label><input type="text"
							id="writer" name="writer" value="${read.writer}"
							readonly="readonly" /></td>
					</tr>
					<tr>
						<td><label for="regdate">�ۼ���¥</label> <fmt:formatDate
								value="${read.regdate}" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</tbody>
			</table>
			<div>
				<button type="submit" class="update_btn">����</button>
				<button type="submit" class="delete_btn">����</button>
				<button type="submit" class="list_btn">���</button>
			</div>
		</section>
		<hr />
	</div>
</body>
</html>