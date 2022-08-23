<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 화면</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

<script type="text/javascript">
		
		function doSubmit() {
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
		      
		      frmRegister.submit();
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
							<h4>비밀번호 재설정</h4>
						</div>
					</div>
					
					<div class="row my-2">
						<div class="col">
							<div id="checkPwAlert" style="font-size: small;"></div>
						</div>
					</div>
					<div>
						
					</div>
				<form id="frmRegister" action="../login/changePwCompletProcess?auth_key=${maileKey}" method="post">	
							
					<div class="row my-2">
			            <div class="col">
		                	<input id="password" type="password" name="mb_pw" class="form-control" placeholder="새로운 비밀번호를 입력해주세요.">
		                </div> 
		            </div>
		            
		            <div class="row my-2">
		            	<div class="col">
		                	<input id="passwordConfirm" type="password" class="form-control" placeholder="비밀번호 재확인">
		                </div> 
		            </div>   
	                	
					<div class="row my-4">
						<div class="col d-grid">
							<input type="button" onclick="doSubmit()" value="등록" class="btn btn-primary">
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