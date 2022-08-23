<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 페이지 2</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../global/mainTop.jsp"></jsp:include>
	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">
		
			<div class="row my-5">
				<div class="col"></div>
				<div class="col">
				
					<div class="row my-4">
						<div class="col">
							<h4>비밀번호 찾기</h4>
						</div>
					</div>
	
					<div class="row my-2">
						<div class="col">
							<p style="font-size: small;">입력하신 이메일 주소로<br>
							비밀번호 재 설정 링크를 보내드렸습니다.</p>
						</div>  					
					</div>

					<div class="row my-4">
						<div class="col d-grid">
							<a href="../login/loginPage" class="btn btn-primary">확인</a>							
						</div>						
					</div>
				
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
	<br><br><br><br>
<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>