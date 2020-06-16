<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ���</title>
</head>
<body>
	<div id="root">
		<header>
			<h1>�Խ���</h1>
			<c:if test="${user != null}">
			<c:out value="${user.user_name}"></c:out> �� ȯ���մϴ�!
			<form role="form" method=" post" action="/user/logout">
				<button type="submit">�α׾ƿ�</button>
			</form>
		</c:if>
		</header>
		<hr/>
		
		<nav>
			Ȩ - �� �ۼ�
		</nav>
		<hr/>
		
		<section id="container">
			<form role="form" method="post" action="/board/write">
				<table>
				 <tr><th>��ȣ</th><th>����</th><th>�ۼ���</th><th>�����</th><th>��ȸ��</th></tr>
				 
				 <c:forEach items="${list}" var="list">
				 	<tr>
				 		<td><c:out value="${list.num}"></c:out></td>
				 		<td>
				 			<a href="/board/readView?num=${list.num}"><c:out value="${list.title}"></c:out></a>
				 		</td>
				 		<td><c:out value="${list.writer}"></c:out></td>
				 		<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate></td>
				 		<td><c:out value="${list.count}"></c:out></td>
				 	</tr>
				 </c:forEach>
				</table>
			</form>
		</section>
		<hr/>

		<div>
			<c:if test="${page.prev}">
				<span>[ <a href="/board/listPage?num=${page.startPageNum - 1}">����</a> ]
				</span>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				<span> 
					<c:if test="${select != num}">
						<a href="/board/listPage?num=${num}">${num}</a>
					</c:if> 
					
					<c:if test="${select == num}">
						<b>${num}</b>
					</c:if>

				</span>
			</c:forEach>

			<c:if test="${page.next}">
				<span>[ <a href="/board/listPage?num=${page.endPageNum + 1}">����</a> ]
				</span>
			</c:if>
			
			<%-- <c:forEach begin="1" end="${pageNum}" var="num">
				<span> 
					<a href="/board/listPage?num=${num}">${num}</a>
				</span>
			</c:forEach> --%>
		</div>
	</div>
</body>
</html>