<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>로그인 실패 페이지</title>
<script type="text/javascript">
// function a(){
// 	var aaaaa = document.getElementById("aaaaa");
// 	var h5 = document.createElement("h5");
// 	h5.innerText= "로그인이 실패하였습니다. 아이디와 비밀번호를 다시 입력해주세요";
// 	aaaaa.appendChild(h5);
	
// 	var p = document.createElement("p");
// 	p.classList.add('card-text');
// 	aaaaa.appendChild(p);
	
// 	var a = document.createElement("a");
// 	a.classList.add('btn');
// 	a.classList.add('btn-primary');
// 	a.href = '../login/loginPage';
// 	a.style.float='right';
// 	a.innerText = '로그인';
// 	aaaaa.appendChild(a);
// }

var userByungsin;


function checking() {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var jsonObj = JSON.parse(xhr.responseText);
				var aaaaa = document.getElementById("aaaaa");
				var h5 = document.createElement("h5");
				
				if(userByungsin==true){
					alert();
				}
				
				
				
// 				var span = document.createElement("span");
// 				span.innerText = 사유: jsonObj.reportVo.report_reason
// 				aaaaa.appendChild(span);
			//<h5 class="card-title">회원가입을 진심으로 축하드립니다.</h5>
		 	//<p class="card-text"></p>
			//<a href="../login/loginPage" class="btn btn-primary" style="float:right;">로그인</a>
			
		}
	};

	xhr.open("get", "./checking?mb_no=${sessionUserInfo.mb_no}");
	xhr.send();
}

	 	
window.addEventListener("DOMContentLoaded",function(){
	checking();
	
	if("${empty sessionUserInfo}"=="true"){
		userByungsin=false;
	}
	if("${empty sessionUserInfo}"=="false"){
		userByungsin=true;
	}
});

</script>
	
</head>
<body>
	<jsp:include page="../../global/mainTop.jsp"></jsp:include>
	
	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">
				<div class="row my-5">
				    <div class="row my-3">
						<div class="col"></div>
						 <div class="col">
							 <div class="card" style="width: 40rem;">
							  <img src="/freeple/resources/img/alert.jpg" class="card-img-top">
							  <div class="card-body" id="aaaaa">
							    로그인에 실패하셨습니다.
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