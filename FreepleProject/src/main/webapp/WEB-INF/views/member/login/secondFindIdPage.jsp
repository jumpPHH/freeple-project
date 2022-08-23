<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지 2</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script type="text/javascript">
	
	function checkEmailKey() {
		
		const auth_key = document.getElementById("auth_key").value;
		
		var xhr = new XMLHttpRequest(); 
		
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); 
				
				var checkAuthKeyAlertBox = document.getElementById("checkAuthKeyAlertBox");

				if(result.data == true){ //메일 인증번호가 맞을때
					checkAuthKeyAlertBox.style.border = "2px solid #787878";
					checkAuthKeyAlertBox.innerText = "인증번호가 확인 되었습니다. \n 아아디 찾기 버튼을 눌러주세요.";
					checkAuthKeyAlertBox.classList.remove("text-danger");
					checkAuthKeyAlertBox.classList.add("text-success"); 
										
				}else{ //메일 인증번호가 틀릴때
					checkAuthKeyAlertBox.style.border = "2px solid #787878";
					checkAuthKeyAlertBox.innerText = "인증번호가 올바르지 않습니다. \n 다시한번 확인해주세요.";
					checkAuthKeyAlertBox.classList.remove("text-success");
					checkAuthKeyAlertBox.classList.add("text-danger");  
				}
			}
		}
		
		xhr.open("post" , "../login/authKeyCheck"); 
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("auth_key=" + auth_key);
	}
	
	function doSubmit() {
		
		const form = document.getElementById("form");
		const auth_keyInput = document.getElementById("auth_key");

		if(auth_keyInput.value == null){
			alert("인증번호를 입력해주세요.");
			auth_keyInput.focus();			
			return;
		}
		
		form.submit();
	}
	
</script>
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
							<h4>아이디 찾기</h4>
						</div>
					</div>
					
					<div class="row my-2">
						<div class="col">
							<div id="checkAuthKeyAlertBox" style="font-size: small;"></div>
						</div>
					</div>
					
					<div class="row my-2">
						<div class="col">
							<p style="font-size: small;">
							아이디 확인을 위해 등록된 이메일로<br>
							인증번호를 보내드렸습니다.<br>
							인증번호 확인 후 아이디 찾기 버튼을 눌러주세요.</p>
						</div>  					
					</div>
					
				<form id="form" action="../login/lastFindIdPage" method="post">	
					<div class="row my-2">
		                <div class="col">
		                	<input id="auth_key" type="text" name="auth_key"  class="form-control" placeholder="인증번호 입력">
		                </div>
		                 <div class="col">
		                	<input type="button" class="btn btn-secondary" onclick="checkEmailKey()" value="인증번호 확인">
		                </div>	  					
					</div>
					
					<div class="row my-2">
						<div class="col d-grid">
							<input type="button" onclick="doSubmit()" value="아이디 찾기" class="btn btn-primary">
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