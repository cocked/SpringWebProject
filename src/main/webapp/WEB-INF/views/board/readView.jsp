<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="../../resources/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<title>게시글 조회</title>
</head>

<style>
.content-body {
	min-height: 200px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		$(".update_btn").on("click", function() {
			formObj.attr("action", "/board/updateView");
			formObj.attr("method", "get");
			formObj.submit();
		})

		$(".delete_btn").on("click", function() {
			var deleteConfirm = confirm("정말로 삭제하시겠습니까?");

			if (deleteConfirm == true) {
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			}
		})

		$(".list_btn").on("click", function() {
			location.href = "/board/listPageSearch?num=1";
		})
	})
</script>

<body>
	<!-- <div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr /> -->

	<!-- navbar -->
	<nav class="navbar navbar-expand-md navbar-light">
		<button class="navbar-toggler ml-auto mb-2 bg-light" type="button" data-toggle="collapse" data-target="#myNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="myNavbar">
			<div class="container-fluid">
				<div class="row">
					<!-- sidebar -->
					<div class="col-xl-2 col-lg-3 col-md-4 sidebar fixed-top">
						<a href="#" class="navbar-brand text-white d-block mx-auto text-center py-3 mb-4 bottom-border">My Page</a>
						<div class="bottom-border pb-3">
							<img src="${path}/resources/images/yajasu.jpg" width="50" class="rounded-circle mr-3"> <a href="/" class="text-white">JAYASOU</a>
						</div>
						<ul class="navbar-nav flex-column mt-4">
							<li class="nav-item"><a href="/user/userUpdateView" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-user text-light fa-lg mr-3"></i>Profile</a></li>
							<li class="nav-item"><a href="/myPage/contractManage" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-chart-line text-light fa-lg mr-3"></i>Trade Information</a></li>
							<li class="nav-item"><a href="/board/listPageSearch?num=1" class="nav-link text-white p-3 mb-2 current"><i class="fa fa-sticky-note text-light fa-lg mr-3"></i>Board</a></li>
							<!-- <li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-wrench text-light fa-lg mr-3"></i>Settings</a></li> -->
							<li class="nav-item"><a href="/image/uploadForm" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Image Upload</a></li>
						</ul>
					</div>
					<!-- end of sidebar -->

					<!-- top-nav -->
					<div class="col-xl-10 col-lg-9 col-md-8 ml-auto bg-dark fixed-top py-2 top-navbar">
						<div class="row align-items-center">
							<div class="col-md-4">
								<h4 class="text-light text-uppercase mb-0"></h4>
							</div>
							<div class="col-md-5">
								<form>
									<div class="input-group">
										<input type="text" class="form-control search-input" placeholder="Search...">
										<button type="button" class="btn btn-white search-button">
											<i class="fas fa-search text-danger"></i>
										</button>
									</div>
								</form>
							</div>
							<div class="col-md-3">
								<ul class="navbar-nav">
									<li class="nav-item ml-md-auto"><a href="#" class="nav-link" data-toggle="modal" data-target="#sign-out"><i class="fas fa-sign-out-alt text-danger fa-lg"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- end of top-nav -->
				</div>
			</div>
		</div>
	</nav>
	<!-- end of navbar -->

	<!-- modal -->
	<div class="modal fade" id="sign-out">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Want to leave?</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">Press logout to leave</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">Stay Here</button>
					<button onclick="location.href='/user/logout'" type="button" class="btn btn-danger" data-dismiss="modal">Logout</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of modal -->

	<!-- section -->
	<section>
		<div class="container-fluid">
			<div class="row mb-5">
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto mt-4">
					<div class="row align-items-center">
						<div class="col-xl-10 col-12">
							<h2 class="text-muted text-center mb-5 mt-5" style="margin-left: 10%;">게시판</h2>
							<div class="container" style="margin-left: 10%">
								<form name="readForm" role="form" method="post">
									<input type="hidden" id="num" name="num" value="${read.num}" />
								</form>

								<div class="content-header">
									<p>
									<h1>${read.title}</h1>
									<br> 작성자 : ${read.writer}&emsp;
									<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd HH:mm" />
									&emsp;조회수 : ${read.count+1}<br>
									<!-- read.count -->
									</p>

								</div>
								<hr />
								<!-- content-header -->

								<div class="content-body">
									<p>${read.content}</p>
								</div>

								<hr />

								<!-- content-footer -->
								<div class=" content-footer" style="margin-top: 50px;">

									<div>
										<button type="submit" class="update_btn btn btn-primary float-right" style="margin: 0 0.5rem;">
											<span class="fas fa-pencil-alt" aria-hidden="true"></span>수정
										</button>
										<button type="submit" class="delete_btn btn btn-primary float-right" style="margin: 0 0.5rem;">
											<span class="fas fa-trash-alt" aria-hidden="true"></span>삭제
										</button>
										<button type="submit" class="list_btn btn btn-primary float-right" style="margin: 0 0.5rem;">
											<span class="fas fa-list-alt" aria-hidden="true"></span>목록
										</button>
									</div>


								</div>
								<!-- content-footer -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end of section -->

	<!-- footer -->
	<footer>
		<div class="container-fluid" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto">
					<div class="row border-top pt-3">
						<div class="col-lg-6 text-center">
							<ul class="list-inline">
								<li class="list-inline-item mr-2"><a href="#" class="text-dark">CodeAndCreate</a></li>
								<li class="list-inline-item mr-2"><a href="#" class="text-dark">About</a></li>
								<li class="list-inline-item mr-2"><a href="#" class="text-dark">Support</a></li>
								<li class="list-inline-item mr-2"><a href="#" class="text-dark">Blog</a></li>
							</ul>
						</div>
						<div class="col-lg-6 text-center">
							<p>
								&copy; 2020 Copyright. Made With <i class="fas fa-heart text-danger"></i> by <span class="text-success">JAYASOU</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end of footer -->

	<!-- </div> -->
</body>
</html>