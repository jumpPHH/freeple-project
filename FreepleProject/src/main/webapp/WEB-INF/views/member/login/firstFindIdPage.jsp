<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지 1</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

<script type="text/javascript">
	function checkEmail() {

		const emailInput = document.getElementById("email").value;
	
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); 
				
				var checkEmailAlertBox = document.getElementById("checkEmailAlert");
				 /* border: 1px solid black; */
				if(result.data == true){ //이메일 있을때
					checkEmailAlertBox.style.border = "2px solid #787878";
					checkEmailAlertBox.innerText = "소셜에 등록된 이메일 입니다.\n보내기 버튼을 눌러주세요.";
					checkEmailAlertBox.classList.remove("text-danger");
					checkEmailAlertBox.classList.add("text-success"); 
										
				}else{ //이메일 없을때
					checkEmailAlertBox.style.border = "2px solid #787878";
					checkEmailAlertBox.innerText = "입력을 하지 않으셨거나 등록된 이메일이 아닙니다.\n소셜 회원이라면 가입한 이메일을 입력 해주세요.";
					checkEmailAlertBox.classList.remove("text-success");
					checkEmailAlertBox.classList.add("text-danger");  
				}
			}
		}
		
		xhr.open("post" , "../login/findEmailInDB"); 
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("mb_email=" + emailInput);
	}

	function doSubmit() {
		
		const form = document.getElementById("form");
		const emailInput = document.getElementById("email");

		if(emailInput.value == null){
			alert("이메일을 입력해주세요.");
			emailInput.focus();			
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
							<div id="checkEmailAlert" style="font-size: small;"></div>
						</div>
					</div>
					
					<div class="row my-2">
						<div class="col">
							<p style="font-size: small;">가입하신 이메일 주소를 입력해주세요.<br>
							이메일로 인증번호를 발송합니다.</p>
						</div>  					
					</div>
					
				<form id="form" action="../login/secondFindIdPage" method="post">	
					<div class="row my-2">
		                <div class="col-7">
		                	<input id="email" type="email" name="mb_email" class="form-control" placeholder="이메일 입력"> 
		                </div>  
		                <div class="col">
		                	<input type="button" class="btn btn-secondary" onclick="checkEmail()" value="이메일 확인">
		                </div>					
					</div>
					
					<div class="row my-2">
						<div class="col d-grid">
							<input type="button" onclick="doSubmit()" value="인증번호 보내기" class="btn btn-primary">
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