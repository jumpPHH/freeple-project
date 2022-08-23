<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

<script type="text/javascript">
	function login() {
		var mng_id = document.getElementById("mng_id").value;
		var mng_pw = document.getElementById("mng_pw").value;
		
		var loginResultText = document.getElementById("loginResultText");
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState  == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				if(jsonObj.isManager){
					location.href="../main/managerMainPage";
					return;
				}
				loginResultText.innerText="로그인 실패-아이디 비밀번호를 확인하세요";
			}
		};	
		
		xhr.open("post","./managerLoginProcess?mng_id="+mng_id+"&mng_pw="+mng_pw );

		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
	}
	 
	 
	/*
	 function templeteAjax() {
			var 변수1 = document.getElementById("아이디").value;
			//해당 아이디의 밸류값을 변수에저장
			
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function(){
				if(xhr.readyState  == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText);  
				}
			};	
			
			xhr.open("get","../컨트롤러매핑주소?변수1 ="+변수1 );
			//xhr.open( 전송방식 , URL , 동기(true) or 비동기(false) )

			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			//post방식일때는 위 코드 한줄이 있어야됨.
			xhr.send();
		}
	*/
	 
</script>

</head>
<body>

<div class="row container-fluid">
	<div class="col">
	
		<div class="row">
		
			<!-- 나중에 지워야됨 임시 링크 -->
			<div class="col">
				<a href="../../member/main/mainPage">메인페이지 링크</a>
			</div>
			
			
			
			<div class="col-6 text-center">
				<br>
				<img src="../../resources/img/managerMainPageFreepleLogo.jpg">
				<br><br>
			</div>
			<div class="col"></div>	
		</div>
		
		<div class="row">
			<div class="col" style="background-color: #E2E2E2"><br><br></div>
		</div>
		
	</div>
</div>


<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">	
		
			<div class="row"><div class="col"></div></div>

			<div class="row">
			
				<div class="col"></div>
				
				<div class="col-6">
					
					<div class="row my-5">
						<div class="col"><h3 class="text-center">로그인</h3></div>
					</div>
					
					<div class="row my-2"><!-- ID -->
						<div class="col">
							<input id="mng_id" type="text" name="mng_id" class="form-control" placeholder="아이디" onkeyup="if(window.event.keyCode==13){login()}">
						</div>
					</div>
					
					<div class="row my-2"><!-- PW -->
						<div class="col">
							<input id="mng_pw" type="password" name="mng_pw" class="form-control" placeholder="비밀번호" onkeyup="if(window.event.keyCode==13){login()}"> 
						</div>					
					</div>
					
					<div class="row mt-3"><!-- 로그인 버튼 -->
						<div class="col d-grid">
							<button onclick="login()" class="btn btn-primary">로그인</button>
						</div>
					</div>
					
					<div class="row">
						<div class="col">
							<span id="loginResultText" style="color: red"></span>
						</div>
					</div>
					
				</div>
				
				<div class="col"></div>
				
			</div>		
		</div>
	</div>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>	

</body>
</html>