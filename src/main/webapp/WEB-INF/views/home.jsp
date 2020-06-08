<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Home</title>



<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
.content-wrapper {
	margin: 0 50px;
	margin-top: 240px;
}

.imgbox {
	padding: 0 20px !important;
}
.img-thumbnail{
            height: 140px;
        }
</style>

</head>
<body>


	<form role="form" method=" post" action="/board/list">
		<button type="submit">글 목록</button>
	</form>
	

	<div class="container">
		<div class="content-wrapper">
			<c:forEach items="${imgList}" var="imgList">
				<div class="imgbox col-md-3 col-xs-6 text-center" style="border: 1px dashed gray;">
					<img class="img-thumbnail" src="${imgList.raw_image_path}" alt="Generic placeholder image" width="140" height="140">
					<h2 cl="cl">Title</h2>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quaerat, praesentium.</p>
					<p>
						<a class="btn btn-default" href="#" role="button">View details »</a>
					</p>
				</div>
			</c:forEach>	
		</div>
	</div>
</body>
</html>

