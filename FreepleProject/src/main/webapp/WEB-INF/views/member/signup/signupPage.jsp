<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

		function checkId(){
			var idValue = document.getElementById("id").value;

			var xhr = new XMLHttpRequest(); 
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText); 
					var checkIdAlertBox = document.getElementById("checkIdAlert");
					
					if(result.data == true){
						//존재 하는 경우.
						isChecked = false; //사용 할 수 없는 아이디 일때.
						checkIdAlertBox.innerText = "이미 존재하는 아이디 입니다.";
						checkIdAlertBox.classList.remove("text-success");
						checkIdAlertBox.classList.add("text-danger");
					}else{
						isChecked = true; //사용 가능한 아이디 일때.
						checkIdAlertBox.innerText = "사용 가능한 아이디 입니다.";
						checkIdAlertBox.classList.remove("text-danger");
						checkIdAlertBox.classList.add("text-success"); 
					}
				}
			}
			xhr.open("get" , "../signup/isExistId?mb_id=" + idValue); 
			xhr.send(); 
		}
		
		
		function checkNick(){ 
			var nickValue = document.getElementById("nick").value;
	
			var xhr = new XMLHttpRequest(); 
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText); 
					var checkNkckAlertBox = document.getElementById("checkNkckAlert");
					
					if(result.data == true){
						//존재 하는 경우.
						checkNkckAlertBox.innerText = "이미 존재하는 닉네임 입니다.";
						checkNkckAlertBox.classList.remove("text-success");
						checkNkckAlertBox.classList.add("text-danger");
					}else{
						checkNkckAlertBox.innerText = "사용 가능한 닉네임 입니다.";
						checkNkckAlertBox.classList.remove("text-danger");
						checkNkckAlertBox.classList.add("text-success"); 
					}
				}
			} 
			xhr.open("get" , "../signup/isExistNick?mb_nick=" + nickValue); 
			xhr.send(); 	
		}
		
		function checkEmail(){ 
			var emailValue = document.getElementById("email").value;
			
			var xhr = new XMLHttpRequest(); 
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText); 
					var checkEmailAlertBox = document.getElementById("checkEmailAlert");
						
					if(result.data == true){
						//존재 하는 경우.
						checkEmailAlertBox.innerText = "이미 가입된 이메일 입니다.";
						checkEmailAlertBox.classList.remove("text-success");
						checkEmailAlertBox.classList.add("text-danger");
					}else{
						checkEmailAlertBox.innerText = "가입 가능한 이메일 입니다.";
						checkEmailAlertBox.classList.remove("text-danger");
						checkEmailAlertBox.classList.add("text-success");						
					}
				}
			} 
			xhr.open("get" , "../signup/isExistEamil?mb_email=" + emailValue); 
			xhr.send(); 	
		}
		
		 function doSubmit(){
		 
		  const frmRegister = document.getElementById("frmRegister");
	      const passwordInput = document.getElementById("password");
	      const passwordConfirmInput = document.getElementById("passwordConfirm");
	      
	      if(passwordInput.value != passwordConfirmInput.value){
	          alert("비밀 번호를 확인 해 주세요");
	          passwordInput.value = "";
	          passwordConfirmInput.value = "";
	          
	          passwordInput.focus();
	          return;
	       }
	      
	      const birthInput = document.getElementById("birth");
	      if(birth.value == ""){
	         alert("생년월일은 필수로 입력해야 합니다");
	         return;
	      }
	         
	      frmRegister.submit();
		  
		 }
		 
		 /* 회원가입 프로필 미리보기 (제이쿼리) */
		  $(function() {
			    //#imgInp에 on속성에 change매서드 사용 함수 만들꺼임 선언.
			    //파일 업로드 버튼 -> 사진을 고르고 -> readURL(this) 함수 실행
	            $("#imgInp").on('change', function(){
	                readURL(this);
	            });
	        });

	        function readURL(input) {
	            if (input.files && input.files[0]) {
	            var reader = new FileReader();

	            reader.onload = function (e) {
	                    $('#blah').attr('src', e.target.result);
	                }

	              reader.readAsDataURL(input.files[0]);
	            }
	        }
	

</script>
</head>
<body>
	<jsp:include page="../../global/mainTop.jsp"></jsp:include>

	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">
			
			<div class="row my-5">
				<div class="col"></div>
				
				<div class="col-6">

					<div class="row my-4">
						<h1 class="text-center">회원 계정정보</h1>
					</div>
				
					<form id="frmRegister" action="./signupProcess" method="post" enctype="multipart/form-data">
		
					<div class="row my-2"><!-- 아이디 -->
						<div class="col">
							<input id="id" name="mb_id" type="text" onblur="checkId()" class="form-control" placeholder="아이디 입력">
						<div id="checkIdAlert"></div><!-- AJAX -->
						</div>
					</div>
					
					<div class="row my-2"><!-- 패스워드 -->
						<div class="col">
							<input id="password" type="password" name="mb_pw" class="form-control" placeholder="비밀번호 입력"> 
						</div>					
					</div>
					
					<div class="row my-2"><!-- 패스워드 재확인 -->
						<div class="col">
							<input id="passwordConfirm" type="password" class="form-control" placeholder="비밀번호 다시 입력"> 
						</div>					
					</div>
					
					<div class="row my-4"><!-- 프로필 사진 등록 -->
						<div class="col">
							<img style="width:200px; height:200px;" id="blah" src="https://dummyimage.com/200x200/e6d5ed/000000.png&text=Profile+image">
						</div>
					</div>
					
					<div class="row my-4">
						<div class="col">
							<input  type="file" id="imgInp" name="file" class="form-control" accept="image/*" required multiple>
						</div>
					</div>
					
					<div class="row my-2"><!-- 닉네임 -->
						<div class="col"> 
							<input id="nick" type="text" name="mb_nick" onblur="checkNick()" class="form-control" placeholder="닉네임을 입력"> 
						</div>
						<div id="checkNkckAlert"></div><!-- AJAX -->					
					</div>
					
					<div class="row my-2"><!-- 전화번호 -->
						<div class="col">
							<input type="text" name="mb_phone" class="form-control" placeholder="010-0000-0000"> 
						</div>					
					</div>	
					
					<div class="row my-2"><!-- 이메일 -->
						<div class="col">
							<input id="email" type="text" name="mb_email" onblur="checkEmail()" class="form-control" placeholder="이메일 example@naver.com"> 
						</div>
						<div id="checkEmailAlert"></div><!-- AJAX -->					
					</div>
			
					<div class="row my-2">
						<div class="col">
							<h5>성별</h5>
						</div>
					</div>
								
					<div class="row my-2"><!-- 성별 -->
						<div class="col">
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="mb_gender" id="inlineRadio1" value="M" checked="checked">
							  <label class="form-check-label" for="inlineRadio1">남자</label>
							</div>
							
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="mb_gender" id="inlineRadio2" value="F">
							  <label class="form-check-label" for="inlineRadio2">여자</label>
							</div>
						</div>					
					</div>
					
					<div class="row my-2">
						<div class="col">
							<h5>생년월일</h5>
						</div>
					</div>
					
					<div class="row my-2"><!-- 생년월일 -->
						<div class="col"> 
							<input id="birth" type="date" name="mb_birth" class="form-control" > 
						</div>					
					</div>
					
					<div class="row my-2"><!-- 회원가입 버튼 --> 
						<div class="col d-grid gap-2">
							<input type="button" onclick="doSubmit()" class="btn btn-primary" value="가입하기">
						</div>					
					</div>
					
					<div class="row my-2"><!-- 이전 버튼 --> 
						<div class="col d-grid gap-2">
							<a href="../login/loginPage" class="btn btn-secondary">이전으로</a>
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
</html>