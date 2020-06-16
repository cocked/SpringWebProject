<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 부가적인 테마 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<title>Jayasou</title>


</head>

<style>
.content-wrapper {
	margin: 0 0px;
	margin-top: 40px;
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


<body>
	 <nav class="navbar navbar-fixed-top navbar-inverse">
        <div class="container-fluid">            
            <div class="row" style="padding: 25px;">
                <div class="navbar-header col-xs-offset-1">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand active" href="/" style="color: white; font-size: 30px;">JAYASOU</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 1px; font-size: 20px;">
                                   
                    <ul class="nav navbar-nav pull-right">
						<c:if test="${user == null}">
							<li class="">
								<a href="#" data-toggle="modal" data-target="#signIn">Login</a>
							</li>
							<li>
								<a href="#" data-toggle="modal" data-target="#signUp">Sign Up</a>
							</li>
						</c:if>

						<c:if test="${user != null}">						
							<c:if test="${user.user_avaliable == 9}">
								<form role="form" method="post" action="/admin">
									<button type="submit">관리자 메뉴</button>
								</form>
							</c:if>
							<li class="">
								<a href="/user/userUpdateView">MyPage</a>
							</li>
							<li>
								<a href="/user/logout" >Logout</a>
							</li>
						</c:if>
					</ul>
                </div>
            </div>
            <!-- /.nav-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="margin-top: 100px;">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
           <%-- <div class="item">
                <img src="${path}/resources/images/yajasu.jpg" alt="Los Angeles" style="display: block; margin: 0px auto; height: 500px;">
                <div class="carousel-caption">
                    <h3>Hayagou</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero, adipisci.</p>
                </div>
            </div>

            <div class="item " >
                <img src="img/bg-about.jpg" alt="Chicago" style="display: block; margin: 0px auto; height: 500px;">
                <div class="carousel-caption">
                    <h3>Hayagou</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero, adipisci.</p>
                </div>
            </div>
            
            <div class="item">
                <img src="img/bg-index.jpg" alt="New York">
                <div class="carousel-caption">
                    <h3>Hayagou</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero, adipisci.</p>
                </div>
            </div> --%> 
			
			<c:set var="imgCount" value="0"/>
			<c:forEach items="${topImgList}" var="topImgList">
				<c:set var="imgCount" value="${imgCount+1}"></c:set>
				<c:choose>
					<c:when test="${imgCount eq 1}">
						<div class="item active">
							<img src="${topImgList.raw_image_path}" alt="${topImgList.raw_image_title}" style="display: block; margin: 0px auto; height: 500px;">
							<div class="carousel-caption">
								<h3>
									<c:out value="${topImgList.raw_image_title}"></c:out>
								</h3>

								<p>
									<c:out value="${topImgList.raw_image_content}"></c:out>
								</p>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="item">
							<img src="${topImgList.raw_image_path}" alt="${topImgList.raw_image_title}" style="display: block; margin: 0px auto; height: 500px;">
							<div class="carousel-caption">
								<h3>
									<c:out value="${topImgList.raw_image_title}"></c:out>
								</h3>

								<p>
									<c:out value="${topImgList.raw_image_content}"></c:out>
								</p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

	<div class="container">
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

	<!-- signin Modal -->
    <div class="modal fade" id="signIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">로그인</h4>
                </div>
                
                <div class="modal-body">
                    <form role="form" action="/user/login" method="post" autocomplete="off">
                        <div class="form-group">
                            <label for="user_email">아이디</label> 
                            <input class="form-control" type="email" id="user_email" name="user_email" placeholder="example@email.com" required="required" />
                        </div>
        
                        <div class="form-group">
                            <label for="user_password">패스워드</label> 
                            <input class="form-control" type="password" id="user_password" name="user_password" placeholder="영문,숫자,특수문자 포함 8글자 이상" required="required" />
                        </div>
        
                        <div class="form-group">
                            <button class="btn btn-primary" type="submit" id="signin_btn" name="signin_btn">로그인</button>
                        </div>
        
                        <c:if test="${msg == false}">
                            <p style="color: #f00;">로그인에 실패했습니다.</p>
                        </c:if>        
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	<!-- "signUp" Modal -->
    <div class="modal fade" id="signUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">회원가입</h4>
                </div>
                <div class="modal-body">
                    <form action="/user/signUp" method="post">
                        <div class="form-group has-feedback">
                            <label class="control-label" for="user_email">이메일</label> 
                            <input class="form-control" type="text" id="user_email" name="user_email" placeholder="example@email.com" required="required"/>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="control-label" for="user_password">비밀번호</label> 
                            <input class="form-control" type="password" id="user_password" name="user_password" placeholder="영문,숫자,특수문자 포함 8글자 이상" required="required"/>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="control-label" for="user_name">성명</label> 
                            <input class="form-control" type="text" id="user_name" name="user_name" placeholder="ex) 홍길동" required="required"/>
                        </div>
                        <div class="form-group has-feedback">
                            <label class="control-label" for="user_hashcode">지갑 주소</label> 
                            <input class="form-control" type="text" id="user_hashcode" name="user_hashcode" placeholder="0x129kev28asd..." required="required"/>
                        </div>
                        <div class="form-group has-feedback">
                            <button class="btn btn-primary" type="submit" id="submit">회원가입</button>
                            <button class="cancle btn btn-primary" type="button">취소</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    
    

	
	<%-- <div class="container">
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
				<form role="form" method="post" action="/admin">
					<button type="submit">관리자 메뉴</button>
				</form>
			</c:if>
			
			<c:out value="${user.user_name}"></c:out> 님 환영합니다!
			
			<form role="form" method=" post" action="/user/userUpdateView">
				<button type="submit">회원 정보 수정</button>
			</form>
			
			<form role="form" method=" post" action="/user/userDeleteView">
				<button type="submit">회원 탈퇴</button>
			</form>
			
			<form role="form" method=" post" action="/user/logout">
				<button type="submit">로그아웃</button>
			</form>

			<form role="form" method=" post" action="/board/listPage?num=1">
				<button type="submit">글 목록(페이징)</button>
			</form>

			<form role="form" method=" post" action="/board/list">
				<button type="submit">글 목록</button>
			</form>

			<form role="form" method=" post" action="/image/uploadForm">
				<button type="submit">이미지 등록</button>
			</form>
		</c:if>
		
	</div> --%>
</body>
</html>

