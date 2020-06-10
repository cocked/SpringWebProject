<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Main</title>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
.content-wrapper {
	margin: 0 0px;
	margin-top: 240px;
}

.imgbox {
	margin: 20px 0;
	padding: 0 20px !important;
}

.img-thumbnail {
	/*1200,992부터 늘리기*/
	width: 180px;
	height: 180px;
}
</style>

</head>
<body>


	<div class="container">
		<c:if test="${user == null}">
			<form role="form" method=" post" action="/user/signUp">
				<button type="submit">회원가입</button>
			</form>
			<form role="form" method=" post" action="/user/login">
				<button type="submit">로그인</button>
			</form>
		</c:if>

		<c:if test="${user != null}">
			<c:if test="${user.user_avaliable == 9}">
				<form role="form" method="post" action="/admix">
					<button type="submit">관리자 메뉴</button>
				</form>
			</c:if>
			
			<c:out value="${user.user_name}"></c:out> 님 환영합니다!
			<form role="form" method=" post" action="/user/logout">
				<button type="submit">로그아웃</button>
			</form>
		</c:if>

		<form role="form" method=" post" action="/board/list">
			<button type="submit">글 목록</button>
		</form>

		<form role="form" method=" post" action="/image/uploadForm">
			<button type="submit">이미지 등록</button>
		</form>

		<div class="content-wrapper">
			<c:forEach items="${imgList}" var="imgList">
				<div class="imgbox col-md-3 col-xs-6 text-center" style="border: 1px gray;">
					<img class="img-thumbnail" src="${imgList.raw_image_path}" alt="Generic placeholder image">
					<h3 cl="cl">
						<c:out value="${imgList.raw_image_title}"></c:out>
					</h3>
					<p>
						<c:out value="${imgList.raw_image_content}"></c:out>
					</p>
					<!-- <p><c:out value="${imgList.raw_image_content}"></c:out></p>  -->
					<p>
						<a class="btn btn-default" href="#" role="button">View details »</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>

