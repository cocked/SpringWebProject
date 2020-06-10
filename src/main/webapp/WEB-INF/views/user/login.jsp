<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
	<div class="container">
		<section id="content">
			<form role="form" method="post" autocomplete="off">
				<div class="input_area">
					<label for="user_email">아이디</label> <input type="email" id="user_email" name="user_email" 
					placeholder="example@email.com" required="required" />
				</div>

				<div class="input_area">
					<label for="user_password">패스워드</label> <input type="password" id="user_password" name="user_password" 
					placeholder="영문,숫자,특수문자 포함 8글자 이상" required="required" />
				</div>

				<button type="submit" id="signin_btn" name="signin_btn">로그인</button>

				<c:if test="${msg == false}">
					<p style="color: #f00;">로그인에 실패했습니다.</p>
				</c:if>

			</form>
		</section>
	</div>
</body>
</html>