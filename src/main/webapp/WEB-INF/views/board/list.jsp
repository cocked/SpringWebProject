<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr/>
		
		<nav>
			홈 - 글 작성
		</nav>
		<hr/>
		
		<section id="container">
			<form role="form" method="post" action="/board/write">
				<table>
				 <tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
				 
				 <c:forEach items="${list}" var="list">
				 	<tr>
				 		<td><c:out value="${list.num}"></c:out></td>
				 		<td>
				 			<a href="/board/readView?num=${list.num}"><c:out value="${list.title}"></c:out></a>
				 		</td>
				 		<td><c:out value="${list.writer}"></c:out></td>
				 		<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
				 	</tr>
				 </c:forEach>
				</table>
			</form>
		</section>
		<hr/>
	</div>
</body>
</html>