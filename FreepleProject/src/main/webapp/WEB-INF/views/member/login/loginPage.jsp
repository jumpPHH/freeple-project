<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<style type="text/css">
a:link {
  color : black;
  text-decoration: none;
}
a:visited {
  color : black;
  text-decoration: none;
}
a:hover {
  color : red;
  text-decoration: underline;
}
a:active {
  color : green;
  text-decoration: none;
}
</style>

<script type="text/javascript">
 
	function doSubmit() {
		
		const form = document.getElementById("form");

		form.submit();
	}
	
</script>
</head>
<body>
	<jsp:include page="../../global/mainTop.jsp"></jsp:include>
   
	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">	
		
			<div class="row my-2"><div class="col"></div></div>

			<div class="row">
			
				<div class="col"></div>
				
				<div class="col-6">
					<form id="form" action="../login/loginProcess" method="post">
					
					<div class="row my-5">
						<div class="col"><h3 class="text-center">로그인</h3></div>
					</div>
					
					<div id="checkAlertBox" style="font-size: small;"></div>
					
					<div class="row my-2"><!-- ID -->
						<div class="col">
							<input id="id" type="text" name="mb_id" class="form-control" placeholder="아이디">
						</div>
					</div>
					
					<div class="row my-2"><!-- PW -->
						<div class="col">
							<input id="pw" type="password" name="mb_pw" class="form-control" placeholder="비밀번호"> 
						</div>					
					</div>
					 
					<div class="row mt-3">
						<div class="col-3"><a href="../login/firstFindIdPage">아이디 찾기</a></div>
						<div class="col">|</div>
						<div class="col-3"><a href="../login/firstFindPwPage">비밀번호 찾기</a></div>
						<div class="col">|</div>
						<div class="col-4"><a href="../signup/acceptPage">회원가입</a></div>						
					</div>
					
					<div class="row mt-3"><!-- 로그인 버튼 -->
						<div class="col d-grid">
							<button onclick="doSubmit()" class="btn btn-primary">로그인</button>
						</div>
					</div>
					
					</form>
				</div>
				
				<div class="col"></div>
				
			</div>		
		</div> 
	</div>
	
	<br><br><br><br>
		
	<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>	
</body>
</body>
</html>