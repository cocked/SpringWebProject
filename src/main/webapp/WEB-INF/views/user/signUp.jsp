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
<title>회원가입</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#user_email").val()==""){
					alert("아이디를 입력해주세요.");
					$("#user_email").focus();
					return false;
				}
				if($("#user_password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#user_password").focus();
					return false;
				}
				if($("#user_name").val()==""){
					alert("성명을 입력해주세요.");
					$("#user_name").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
<body>
	<div class="container">
		<section id="container">
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
					<button class="cancel btn btn-primary" type="button">취소</button>
				</div>
			</form>
		</section>
	</div>
	
	<button type="button" data-toggle="modal" data-target="signIn">asdasdasd </button>
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
</body>

</html>