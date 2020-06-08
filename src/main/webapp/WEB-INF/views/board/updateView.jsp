<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>
<title>�Խ���</title>
</head>

<script type="text/javascript">
		$(document).ready(function(){
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
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
			<form name="updateForm" role="form" method="post" action="/board/update">
				<input type="hidden" name="num" value="${update.num}" readonly="readonly" />
				<table>
					<tbody>
						<tr>
							<td><label for="title">����</label><input type="text"
								id="title" name="title" value="${update.title}" /></td>
						</tr>
						<tr>
							<td><label for="content">����</label>
							<textarea id="content" name="content"><c:out
										value="${update.content}" /></textarea></td>
						</tr>
						<tr>
							<td><label for="writer">�ۼ���</label><input type="text"
								id="writer" name="writer" value="${update.writer}"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<td><label for="regdate">�ۼ���¥</label> <fmt:formatDate
									value="${update.regdate}" pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</tbody>
				</table>
				<div>
					<button type="submit" class="update_btn">����</button>
					<button type="submit" class="cancel_btn">���</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>