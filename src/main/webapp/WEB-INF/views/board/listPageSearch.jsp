<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
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
<title>게시판</title>
</head>

<body>
	<%-- <div id="root">
		<header>
			<h1>게시판</h1>
			<c:if test="${user != null}">
				<c:out value="${user.user_name}"></c:out> 님 환영합니다!
			<form role="form" method=" post" action="/user/logout">
					<button type="submit">로그아웃</button>
				</form>
			</c:if>
		</header>
		<hr />

		<nav>홈 - 글 작성</nav>
		<hr /> --%>

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
							<li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-user text-light fa-lg mr-3"></i>Profile</a></li>
							<li class="nav-item"><a href="/myPage/contractManage" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-chart-line text-light fa-lg mr-3"></i>Analytics</a></li>
							<li class="nav-item"><a href="/board/listPageSearch?num=1" class="nav-link text-white p-3 mb-2 current"><i class="fa fa-sticky-note text-light fa-lg mr-3"></i>Board</a></li>
							<li class="nav-item"><a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-wrench text-light fa-lg mr-3"></i>Settings</a></li>
							<li class="nav-item"><a href="/image/uploadForm" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Image upload</a></li>
						</ul>
					</div>
					<!-- end of sidebar -->

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
					<button type="button" class="btn btn-danger" data-dismiss="modal">Logout</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of modal -->

	<!-- tables -->
	<section>
		<div class="container-fluid">
			<div class="row mb-5">
				<div class="col-xl-10 col-lg-9 col-md-8 ml-auto mt-4">
					<div class="row align-items-center" style>
						<div class="col-xl-10 col-12">
							<h2 class="text-muted text-center mb-5 mt-5" style="margin-left : 10%;">게시판</h2>
							<div class="container">
								<div id="content" style="margin-left: 10%;">
									<!-- <div class="container">
		<section id="container"> -->
									<form role="form" method="post" action="/board/write">
										<table class="table table-hover">
											<tr>
												<th class="col-md-1 " scope="col">번호</th>
												<th class="col-md-5 " scope="col">제목</th>
												<th class="col-md-2 " scope="col">작성자</th>
												<th class="col-md-2 " scope="col">작성일</th>
												<th class="col-md-1 " scope="col">조회수</th>
											</tr>


											<c:forEach items="${list}" var="list">
												<tr>
													<td>
														<c:out value="${list.num}"></c:out>
													</td>
													<td>
														<a href="/board/readView?num=${list.num}"><c:out value="${list.title}"></c:out></a>
													</td>
													<td>
														<c:out value="${list.writer}"></c:out>
													</td>
													<td>
														<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
													</td>
													<td>
														<c:out value="${list.count}"></c:out>
													</td>
												</tr>
											</c:forEach>
										</table>
									</form>

									<div class="list_footer">
										<select name="searchType">
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="title_content">제목+내용</option>
											<option value="writer">작성자</option>
										</select>

										<input type="text" name="keyword" />

										<button class="btn btn-primary" type="button" id="searchBtn" style="margin-left: 1%;">검색</button>


										<a href="/board/writeView" class="btn btn-primary float-right">글쓰기</a>
									</div>
								</div>
							</div>

							<hr />

							<div class="text-center" style="margin-left: 40%; margin-top: 0px;">
								<nav aria-label="...">
									<ul class="pagination">
										<c:if test="${page.prev}">
											<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${page.startPageNum - 1}" tabindex="-1">이전</a></li>
											<%-- <span>[ <a href="/board/listPageSearch?num=${page.startPageNum - 1}">이전</a> ]
					</span> --%>
										</c:if>

										<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
											<!-- <span>  -->
											<li <c:out value="${select == num ? 'class=page-item active' : 'class=page-item'}" />><a class="page-link" href="/board/listPageSearch?num=${num}">${num} <span class="sr-only">(current)</span>
											</a></li>


											<%-- <c:if test="${select != num}">
						<a href="/board/listPageSearch?num=${num}">${num}</a>
					</c:if>
					<c:if test="${select == num}">
						<b>${num}</b>
					</c:if>
					</span> --%>
										</c:forEach>

										<c:if test="${page.next}">
											<li class="page-item"><a class="page-link" href="/board/listPageSearch?num=${page.endPageNum + 1}" " tabindex="-1">다음</a></li>
											<%-- <span>[ <a href="/board/listPageSearch?num=${page.endPageNum + 1}">다음</a> ]
						</span> --%>
										</c:if>
									</ul>


								</nav>


							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

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
	<script>
		document.getElementById("searchBtn").onclick = function() {

			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;

			location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
		};
	</script>
</body>
</html>