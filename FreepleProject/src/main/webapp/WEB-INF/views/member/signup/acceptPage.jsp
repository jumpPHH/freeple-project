<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관 동의 페이지</title>
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
							<h4>약관동의</h4>
						</div>
					</div>
						
					<div id="checkAlert"></div>	
			
					<div class="row my-2">
						<div class="col">
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" id="checkbox1" onclick="is_checked()" checked="checked">
							  <label class="form-check-label" for="inlineRadio1">개인정보 활용동의 및 사이트약관에 <br> 모두 동의합니다.</label>
							</div>
					   </div> 
					 </div> 	

					 <div class="row my-2">
						<div class="col">
							<div style="min-height: 120px;">
							  
							    <div class="card card-body" style="width: 400px;">
							    *개인정보보호법에 따라 당사이트에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 
							    개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 
							    불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
								*여러분을 환영합니다.
								THE Fitness의 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 
								본 약관은 다양한 서비스의 이용과 관련하여 서비스를 제공하는 ....
							    </div>
							  
							</div>
						 </div> 
					 </div>
					 
					 
					<div class="row my-2">
						<div class="col">
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="checkbox" id="checkbox2" onclick="is_checked()" checked="checked">
							  <label class="form-check-label" for="inlineRadio1">프로모션 정보 수신 동의</label>
							</div>
					   </div> 
					 </div> 
							
					 <div class="row my-2">
						<div class="col">
							<div style="min-height: 120px;">
							 
							    <div class="card card-body" style="width: 400px;">
									사이트에서 제공하는 이벤트/혜택 등 다양한 정보를 문자또는 이메일로 받아보실 수 있습니다.
							    </div>
							 
							</div>
						 </div> 
					 </div>
					 
				 	<div class="row my-2">
					  <div class="col-7"></div>	
					  <div class="col">
					  	 <a href="../login/loginPage" class="btn btn-secondary">이전</a>
					  </div>
					  
					  <div class="col">	
					     <a href="./signupPage" class="btn btn-primary">다음</a>
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