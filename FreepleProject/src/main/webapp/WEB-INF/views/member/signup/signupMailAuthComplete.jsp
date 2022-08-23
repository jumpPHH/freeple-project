<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증 완료</title>
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
							    <h5 class="card-title">메일 인증이 완료되었습니다. <br> 로그인 하여 서비스를 이용해주세요.</h5>
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