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
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원정보 수정</title>
</head>

<style>

</style>

<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cancel").on("click", function() {
			location.href = "/";
		})
		
		$(".delete").on("click", function() {
			location.href = "/user/userDeleteView";
		})

		$("#submit").on("click", function() {
			if ($("#user_password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#user_password").focus();
				return false;
			}
			if ($("#user_name").val() == "") {
				alert("성명을 입력해주세요.");
				$("#user_name").focus();
				return false;
			}
			$.ajax({
				url : "/user/passChk",
				type : "POST",
				dateType : "json",
				data : $("#updateForm").serializeArray(), //쿼리스트링 형태로 전달
				success : function(data) {

					if (data == true) {
						if (confirm("회원수정하시겠습니까?")) {
							$("#updateForm").submit();
						}

					} else {
						alert("패스워드가 틀렸습니다.");
						return;

					}
				}
			})
		});

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
					
					<!-- end of sidebar --><div class="col-xl-2 col-lg-3 col-md-4 sidebar fixed-top">
						<a href="#" class="navbar-brand text-white d-block mx-auto text-center py-3 mb-4 bottom-border">My Page</a>
						<div class="bottom-border pb-3">
							<img src="${path}/resources/images/yajasu.jpg" width="50" class="rounded-circle mr-3"> <a href="/" class="text-white">JAYASOU</a>
						</div>
						<ul class="navbar-nav flex-column mt-4">
							<li class="nav-item"><a href="/user/userUpdateView" class="nav-link text-white p-3 mb-2 current"><i class="fas fa-user text-light fa-lg mr-3"></i>Profile</a></li>
							<li class="nav-item"><a href="/myPage/contractManage" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-chart-line text-light fa-lg mr-3"></i>Trade Information</a></li>
							<li class="nav-item"><a href="/board/listPageSearch?num=1" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fa fa-sticky-note text-light fa-lg mr-3"></i>Board</a></li>
							<!-- <li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-wrench text-light fa-lg mr-3"></i>Settings</a></li> -->
							<li class="nav-item"><a href="/image/uploadForm" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Image Upload</a></li>
						</ul>
					</div>

					<!-- top-nav -->
					<div class="col-xl-10 col-lg-9 col-md-8 ml-auto bg-dark fixed-top py-2 top-navbar">
						<div class="row align-items-center">
							<div class="col-md-4"></div>
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
							<h2 class="text-muted text-center mb-5 mt-5" style="margin-left : 10%;">회원 정보</h2>

							<div class="container" style="margin-left:10%;">
								
									<form role="form" id="updateForm" action="/user/userUpdate" method="post">
										<div class="form-group ">
											<label class="control-label" for="user_email">이메일</label> 
											<input class="form-control form-control" type="text" id="user_email" name="user_email" value="${user.user_email}" readonly="readonly" />
										</div>
										<div class="form-group ">
											<label class="control-label" for="user_password">패스워드</label> 
											<input class="form-control form-control" type="password" id="user_password" name="user_password" placeholder="비밀번호는 수정할 수 없습니다. 현재 본인 비밀번호를 입력해주세요." />
										</div>
										<div class="form-group ">
											<label class="control-label" for="user_name">성명</label> 
											<input class="form-control  form-control" type="text" id="user_name" name="user_name" value="${user.user_name}" />
										</div>
										<div class="form-group ">
											<label class="control-label" for="user_hashcode">지갑주소</label> 
											<input class="form-control  form-control" type="text" id="user_hashcode" name="user_hashcode" value="${user.user_hashcode}" />
										</div>
									</form>
									
									<div class="form-group ">
										<button class="cancel btn btn-primary float-right" type="button" >취소</button>
										<button class="btn btn-primary float-right" type="button" id="submit" style="margin-right : 10px;">회원정보수정</button>
										<button class="delete btn btn-primary float-right" type="button" id="submit" style="margin-right : 10px;">회원 탈퇴</button>
									</div>
								

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

</body>
</html>