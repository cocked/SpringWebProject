<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 등록</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
		<form role="form" action="uploadFormPOST" method="post" enctype="multipart/form-data" autocomplete="off">

			

			<div class="inputArea" style="margin-bottom: 50px;">
				<label for="raw_image_path">이미지</label> <input type="file" id="raw_image_path" name="file" />

				<div class="select_img" style="margin: 50px 0;">
					<img id="loadImg" src="" />
				</div>

				<script>
			$("#raw_image_path").change(function() {
						if (this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$("#loadImg").attr("src",
										data.target.result).width(500);
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
			</script>


				<%=request.getRealPath("/") %>
			</div>
			
			<label for="price">금액</label> <input type="text" id="price" name="price"> <br> 
			<label for="price">제목</label> <input type="text" id="raw_image_title" name="raw_image_title"><br> 
			<label for="price">설명</label> <input type="textarea" id="raw_image_content" name="raw_image_content"><br>

			<button type="submit" value="업로드!" style="margin-top: 50px;">등록</button>

		</form>
	</div>
</body>
</html>