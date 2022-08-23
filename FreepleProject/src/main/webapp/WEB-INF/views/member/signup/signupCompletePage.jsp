<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../../global/mainTop.jsp"></jsp:include>

	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">
				<div class="row my-5">
					
				    <div class="row my-4">
	
						<div class="col"></div>
						
						 <div class="col">
							 <div class="card" style="width: 40rem;">
							  <img src="../../resources/img/complete.jpg" class="card-img-top">
							  <div class="card-body">
							    <h5 class="card-title">회원가입을 진심으로 축하드립니다.<br>등록된 이메일로 인증 링크를 발송하였습니다.</h5>
							    <p class="card-text"></p>
							    <a href="../login/loginPage" class="btn btn-primary" style="float:right;">로그인</a>
							  </div>
							 </div>
						 </div>
						
						<div class="col"></div>
					</div>
				</div>		
		</div>
	</div>
	
	<br><br><br><br>		
	<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
	

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>