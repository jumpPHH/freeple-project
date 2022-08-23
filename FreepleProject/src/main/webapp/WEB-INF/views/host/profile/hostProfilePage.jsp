<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 프로필 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/freeple/resources/css/hostMainPage.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script type="text/javascript">
		/* 회원가입 프로필 미리보기 (제이쿼리) */
		$(function() {
			    //#imgInp에 on속성에 change매서드 사용 함수 만들꺼임 선언.
			    //파일 업로드 버튼 -> 사진을 고르고 -> readURL(this) 함수 실행
		      $("#imgInput").on('change', function(){
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
		  		  
		  function doSubmit() {
			  
			  const Toast = Swal.mixin({
		            toast: true,
		            position: 'center-center',
		            showConfirmButton: false,
		            timer: 3000,
		            timerProgressBar: true,
		            didOpen: (toast) => {
		                toast.addEventListener('mouseenter', Swal.stopTimer)
		                toast.addEventListener('mouseleave', Swal.resumeTimer)
		            },
		        })
		      
			   Toast.fire({
		            icon: 'success',
		            title: '수정이 완료되었습니다. 다시 로그인 해주세요.'
		       });
			  
			  const form = document.getElementById("form");
				
			  setTimeout(function () {
				  form.submit();
				},3000);

			}

		  
	</script>
</head>
<body style="font-weight: bold;">
		<div style="margin: 0 auto">
			<div class="container-fluid">
				<div id="app" class="row">
					<jsp:include page="../global/hostMainLeft.jsp"></jsp:include>
				
						<div class="col-9" >
						
						     <jsp:include page="../global/hostMainTop.jsp"></jsp:include>
								
							<form id="form" action="./updateProfileProcess" method="post" enctype="multipart/form-data">
								<div class="row no-gutters my-2">
									<div class="row">
										<div class="col">
											<div class="card" style="width: 70%; height: 100rem;">
											  <div class="card-body">
											  
											  	<div class="row">
											  		<div class="col">
											  			<h5 class="titleText">내 정보</h5>
											  		</div>
											  	</div>
											  	
											  	<div class="row my-4">
											  		<div class="col" style="border-bottom: 2px solid;">
											  			<h6 style="font-size: 25px; line-height: 30px; color: #333;">프로필 관리</h6>
											  		</div>
											  	</div>
										  	
										  		<div class="row" style="border-bottom: 1px solid; padding-bottom: 20px;">
										  			<div class="row">
														<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;">
												  		<b style="color: red">*</b> 프로필 사진
												  		</div>
												  		
												  		<div class="col">
															<img style="width:200px; height:200px; background: #BDBDBD; border-radius: 70%; overflow: hidden;" id="blah" src="/uploadFiles/${sessionUserInfo.mb_image_link }">
														</div>	
										  			</div>
				
							  						<div class="row my-3">
							  							<div class="col">
															<input  type="file" id="imgInput" name="files" class="form-control" accept="image/*" required multiple>
														</div>
							  						</div>
							  						
							  						<div class="row">
							  							<div class="col">
							  								<p style="color: #999; font-size: .8rem; ">용량 2MB 이하 JPG,PNG</p>
							  							</div>
							  						</div>
										  	   </div>
											  	
											  	<div class="row my-3" style="border-bottom: 1px solid; padding-bottom: 20px;">
										  			<div class="row">
														<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;">
												  		<b style="color: red">*</b> 호스트 명
												  		</div>
												  		
							  							<div class="col">			
															<input name="mb_nick" type="text" class="form-control" value="${sessionUserInfo.mb_nick }"> 
							  							</div>												  		
										  			</div>
										  			
													<div class="row">
										  				<div class="col-2"></div>
							  							<div class="col">
							  								<p style="color: #999; font-size: .8rem; ">회원에게 보여지는 닉네임 입니다.</p>
							  							</div>
							  						</div>										  			
										  	   </div>
										  	   
										  	   <div class="row my-3" style="border-bottom: 1px solid; padding-bottom: 20px;">
										  			<div class="row">
														<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;">
												  		<b style="color: red">*</b> 이메일
												  		</div>
												  		
							  							<div class="col">			
															<input name="mb_email" type="text" class="form-control" value="${sessionUserInfo.mb_email}"> 
							  							</div>												  		
										  			</div>
										  			
										  			<div class="row">
										  				<div class="col-2"></div>
							  							<div class="col">
							  								<p style="color: #999; font-size: .8rem; ">실제로 사용하시는 이메일 주소를 입력해 주세요.<br>
							  								해당 메일로 공지사항 및 상품 수정 요청 등 중요 알람이 발생됩니다.</p>
							  							</div>
							  						</div>
										  	   </div>
										  	   
										  	   <div class="row my-3" style="padding-bottom: 20px;">
										  			<div class="row">
														<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;">
												  		<b style="color: red">*</b> 소개
												  		</div>												  		
										  			</div>
										  			
										  			<div class="row">
										  				<div class="col">
										  					<div class="form-floating">
															  <textarea class="form-control" placeholder="Leave a comment here" id="mb_host_info" name="mb_host_info" style="height: 400px"></textarea>
															  <label for="mb_host_info">${sessionUserInfo.mb_host_info }</label>
															</div>
										  				</div>
										  			</div>
										  			
										  			<div class="row my-4">
										  				
							  							<div class="col">
							  								
							  								<p><b style="font-size: 1rem;">소개 예시보기</b></p>

															<p style="color: #999; font-size: .8rem;">프립 대원(회원)에게 호스트님을 소개해 주세요.<br>
															호스트님만의 개성을 담거나, 신뢰감을 줄 수 있는 전문적인 사항들을 입력하시면 좋습니다.</p>
															
															<p style="color: red; font-size:.8rem;">* 경력, 보유 자격증, 수상 이력, 대외 활동 등</p> 
															<p style="color: red; font-size:.8rem;">* 개인 연락처(전화번호, 카카오톡 ID, 개인 SNS, 홈페이지 등은 입력할 수 없습니다.</p>
							  							</div>
							  						</div>
							  						
							  						<div class="row">
							  							<div class="col d-grid">
							  							
							  								<div id="toastStart" onclick="doSubmit()" class="btn btn-info">프로필 수정</div>
							  							</div>
							  						</div>
										  	   </div>										  	   
											  	
								     </div>		 			  	
									</div>			  	
								   </div>				  	
								  </div> 			  	
								 </div>	  	
							</form>
							
						</div>				
					
				</div>	
			</div>				
		</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>			
</body>
</html>