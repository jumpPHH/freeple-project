<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 메인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" href="/freeple/resources/css/hostMainPage.css">
<script type="text/javascript">

		$().ready(function () { 
		
		    $("#freep_title").blur(function () {
				if(freep_title.value == ""){
		        Swal.fire({
		            title: '기본정보 미입력',
		            text: "프립명이 입력되지 않았습니다.",
		            icon: 'warning'
		        })
			   }	 
		     });
		   $("#freep_title").focus();
		});
		
		$().ready(function () { 
			
		    $("#freep_time").blur(function () {
				if(freep_time.value == ""){
		        Swal.fire({
		            title: '기본정보 미입력',
		            text: "강의시간이 입력되지 않았습니다.",
		            icon: 'warning'
		        })
			   }	 
		     });
		  
		});
		
		$().ready(function () { 
			
		    $("#freep_price").blur(function () {
				if(freep_price.value == ""){
		        Swal.fire({
		            title: '기본정보 미입력',
		            text: "강의금액이 입력되지 않았습니다.",
		            icon: 'warning'
		        })
			   }	 
		     });
		 
		});
		
		
		$().ready(function () { 
			
		    $("#freep_content").blur(function () {
				if(freep_content.value == ""){
		        Swal.fire({
		            title: '기본정보 미입력',
		            text: "프립 상세설명이 입력되지 않았습니다.",
		            icon: 'warning'
		        })
			   }	 
		     });
		 
		});
		
		$().ready(function () {
		    $("#toastStart").click(function () {
		        const Toast = Swal.mixin({
		            toast: true,
		            position: 'center-center',
		            showConfirmButton: false,
		            timer: 3000,
		            timerProgressBar: true,
		            didOpen: (toast) => {
		                toast.addEventListener('mouseenter', Swal.stopTimer)
		                toast.addEventListener('mouseleave', Swal.resumeTimer)
		            }
		        })
		
		        Toast.fire({
		            icon: 'success',
		            title: '프립 등록이 정상적으로 되었습니다.'
		        })
		    });
		});
		
		function doSubmit() {
			const form = document.getElementById("form");
			
			$("#form").slideUp( 2000 ).delay( 5000 ).fadeIn( 2000 );

			form.submit();
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
					
				<form id="form" action="./freepRegisterProcess" method="post" enctype="multipart/form-data">	
					<div class="row no-gutters my-2">
						<div class="row">
							<div class="col-8">
								<div class="card" style="width: 100%; height: 250rem;">
								  <div class="card-body">
								  
								  	<div class="row">
								  		<div class="col">
								  			<h5 class="titleText">프립 등록</h5>
								  		</div>
								  	</div>
								  	
								  	<div class="row my-4">
								  		<div class="col" style="border-bottom: 2px solid;">
								  			<h6 style="font-size: 25px; line-height: 30px; color: #333;">기본정보</h6>
								  		</div>
								  	</div>
								  	
								  	<div class="row" style="border-bottom: 1px solid; padding-bottom: 50px;">
								  		<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;"><b style="color: red">*</b> 프립 유형</div>
								  		
								  		<div class="col">
									  			<div class="row">
									  				<div class="col" style="color: #999; font-size: .8rem; ">어떤 프립을 호스팅하고 싶으신가요?</div>
									  			</div>	
									  		
									  			 <div class="row">	
									  				<div class="col">
									  					<div class="card form-check" style="width: 15rem; height: 10rem;
									  				   background-color:white; border: 1px solid black;">

									  				   	  <input class="form-check-input" type="radio" name="freep_onoff" value="오프라인" id="freep_onoff" checked="checked">
									  				   	    <label class="form-check-label" for="freep_onoff">
															   	 <b>오프라인</b><br><br>
										  				   	     대원과 오프라인에서 직접 대면하면서 진행되는 프립
														    </label>
														    
									  				   	</div>
									  				</div>
									  			 </div>
								  			 	
								  				<div class="row">
								  					<div class="col" style="color: #eb385e!important; font-size: .8rem;">프립유형은 최초 등록 후에는 변경이 불가능합니다.</div>
								  				</div>
								  		 </div>
								  		
								  		<div class="col">
							  			  		<div class="row">
									  				<div class="col"><p></p></div>
									  			</div>	
									  			
									  			 <div class="row">	
									  				<div class="col">
									  					<div class="card form-check" style="width: 15rem; height: 10rem;
									  				   background-color:white; border: 1px solid black;">
									  				   
									  				   <input class="form-check-input" type="radio" name="freep_onoff" value="온라인" id="freep_onoff2">
										  				   <label class="form-check-label" for="freep_onoff2">
														     <b>온라인</b><br><br>
														     대원과 실시간 채팅,전화,영상 등의 방법으로 만나는 비대면 프립
														  </label>
									  				   	</div>
									  				</div>
									  			 </div>
								  			 	
								  				<div class="row">
								  					<div class="col"><p></p></div>
								  				</div>								  		
								  		</div>
								  	</div>
								  	
							  		<div class="row my-5">
 										<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;">
 										<b style="color: red">*</b> 카테고리</div>
							  		  	  
							  		  	 <select name="freep_ctg_no" style="width: 80%">
							  		  	 	
							  		  	 <c:forEach items="${CategoryList}" var="CategoryList">
							  		  	  	<option value="${CategoryList.freep_ctg_no}">${CategoryList.freep_ctg_name}</option>
							  		  	  	<!-- <input type="radio" name="freep_ctg_no" value="${CategoryList.freep_ctg_no}">${CategoryList.freep_ctg_name}  -->
							  		  	 </c:forEach>
							  		  	 </select>
							  		 </div>
							  		  
							  		  <div class="row my-5" style="border-bottom: 1px solid; padding-bottom: 50px;">
							  		  	<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333; padding-bottom: 30px;"><b style="color: red">*</b> 프립 명</div>
							  		  	<div class="form-floating">
										  <textarea class="form-control" placeholder="Leave a comment here" id="freep_title"  name="freep_title"></textarea>
										  <label for="freep_title">프립의 특징이 잘 드러나도록 프립명을 입력해주세요.</label>
										</div>
							  		  </div>
							  		  
							  		  <div class="row">
								  		<div class="col">
								  			<h5 class="titleText">판매 정보</h5>
								  		</div>
								  	</div>
								  	
								  	<div class="row my-4">
								  		<div class="col" style="border-bottom: 2px solid;">
								  			<h6 style="font-size: 25px; line-height: 30px; color: #333;">판매 기간</h6>
								  		</div>
								  	</div>
								  	
								  	<div class="row my-5">
							  		  	  <div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;"><b style="color: red">*</b> 판매 기간</div>
							  		      <div class="col" style="color: #999; font-size: .8rem;">검수완료일부터</div> 
								  		  <div class="col"><input type="checkbox" checked="checked">1년</div>
								  		  <div class="col"><input type="checkbox">2년</div>
								  		  <div class="col"><input type="checkbox">3년</div>		  	
							  		 </div>
							  		 
							  		 <div class="row my-5" style="padding-bottom: 50px;">
							  		  	<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333; padding-bottom: 30px;"><b style="color: red">*</b> 강의 시간</div>
							  		  	<div class="form-floating">
										  <textarea class="form-control" placeholder="Leave a comment here" id="freep_time" name="freep_time"></textarea>
										  <label for="freep_time">강의 시간을 입력해주세요.</label>
										</div>
							  		  </div>
							  		  
							  		 <div class="row my-4">
								  		<div class="col" style="border-bottom: 2px solid;">
								  			<h6 style="font-size: 25px; line-height: 30px; color: #333;">판매 옵션</h6>
								  		</div>
								  	 </div>
								  	 
								  	 <div class="row my-5" style="padding-bottom: 50px;">
							  		  	<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333; padding-bottom: 30px;"><b style="color: red">*</b> 금액 정하기</div>
							  		  	<div class="form-floating">
										  <textarea class="form-control" placeholder="Leave a comment here" id="freep_price" name="freep_price"></textarea>
										  <label for="freep_price">금액을 입력해주세요.</label>
										</div>
							  		  </div>
								    
								     <div class="row my-4">
								  		<div class="col" style="border-bottom: 2px solid;">
								  			<h6 style="font-size: 25px; line-height: 30px; color: #333;">프립 설명</h6>
								  		</div>
								  	 </div>
								  	 
								  	 <div class="row my-5">
							  		  	<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;"><b style="color: red">*</b> 대표 이미지</div>
							  		  </div>
							  		  
							  		  
							  		  <div class="row my-4" style="border-bottom: 2px solid;">
								  		<div class="col">
									  	   <div class="input-group mb-3">
											  <input type="file" name="files" class="form-control" accept="image/*" required multiple >
									       </div>
								  		</div>
								  		
								  		<div class="row">
								  			<div class="col" style="color: #eb385e!important; font-size: .8rem; padding-bottom: 10px;">
								  			텍스트를 사용한 대표 이미지는 노출이 불가능합니다. 우측 가이드를 반드시 준수하여 대표이미지를 등록해주세요.</div>
								  		</div>
								  		
								  		<div class="row">
								  			<div class="col" style="color: blue; font-size: .8rem; padding-bottom: 10px;">
								  			권장 사이즈 : 가로 1000px * 세로 1000px</div>
								  		</div>
								  		
								  		<div class="row">
								  			<div class="col" style="color: blue; font-size: .8rem; padding-bottom: 10px;">
								  			최소 사이즈 : 가로 600px * 세로 600px</div>
								  		</div>
								  		
								  		<div class="row">
								  			<div class="col" style="color: blue; font-size: .8rem; padding-bottom: 40px;">
								  			용량 : 10MB 이하, 파일유형 : JPG,PNG,GIF 최소 1장 ~ 최대 5장 까지 등록가능</div>
								  		</div>
								  	 </div>
								  	 
								  	 <div class="row my-5">
							  		  	<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;"><b style="color: red">*</b> 프립 상세 설명</div>
							  		  </div>
										
										
									  <div class="row my-5" style="border-bottom: 2px solid; padding-bottom: 40px;">
							  		  	<div class="form-floating">
										  <textarea class="form-control" placeholder="Leave a comment here" id="freep_content" name="freep_content" style="height: 400px"></textarea>
										  <label for="freep_content">호스트님의 상품을 소개해주세요. :)</label>
										</div>
							  		  </div>
							  		  
							  		  <div class="row my-5" style="padding-bottom: 40px;">
							  		  	<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;"><b style="color: red">*</b> 프립 태그</div>
							  		  	<div class="col">
							  		  		<div class="row">
							  		  			<div class="col" style="color: #999; font-size: .8rem; padding-bottom: 10px;">프립을 표현할수 있는 태그를 등록해 주세요.</div>
							  		  		</div>
							  		  		
							  		  		<div class="row">
							  		  			<div class="col">
										  		  	<div class="form-floating">
													  <textarea class="form-control" placeholder="Leave a comment here" id="freep_tag" name="freep_tag"></textarea>
													  <label for="freep_tag" >#건강한운동#운동일상화</label>
													</div>
							  		  			</div>
							  		  		</div>
							  		  	</div>
							  		  </div>
							  		  
							  		 <div class="row my-4">
								  		<div class="col" style="border-bottom: 2px solid;">
								  			<h6 style="font-size: 25px; line-height: 30px; color: #333;">거래정보</h6>
								  		</div>
								  	 </div>
								  	 
								  	  <div class="row my-5">
							  		  	<div class="col-2" style="font-size: 15px; line-height: 30px; color: #333;"><b style="color: red">*</b> 거래정보</div>
							  		  	<div class="col">
							  		  		<div class="row">
							  		  			<div class="col" style="font-size: 15px; line-height: 30px; color: #333; padding-bottom: 10px;">
							  		  				신청시 유의사항
							  		  			</div>
							  		  		</div>  		
	
							  		  		<div class="row">
							  		  			<div class="col card form-check" style="width: 5rem; height: 10rem;
									  				   background-color:white; border: 1px solid black; background-color:#f0f8ff; ">
								  		  			[신청 시 유의사항] <br>
													· 구매시 호스트 연락처를 카톡 혹은 문자로 보내드립니다.<br>
													· 호스트 연락처로 진행 가능한 날짜 예약 바랍니다.<br>
													· 예약 확정 시 환불이 불가합니다.<br>
													· 예약 시간에 맞추어 늦지 않게 도착해주시기 바랍니다.<br>
												</div>
												<div class="col-3"></div>
							  		  		</div>
							  		  		
							  		  		<div class="row">
							  		  			<div class="col" style="color: #eb385e!important; font-size: .8rem; padding-bottom: 30px;">
							  		  				대원에게 보여지는 유의사항입니다. 확인 후 알맞게 변경해주세요 :)
							  		  			</div>
							  		  		</div>
							  		  		
							  		  		<div class="row">
							  		  			<div class="col" style="font-size: 15px; line-height: 30px; color: #333; padding-bottom: 10px;">
							  		  				환불 규정
							  		  			</div>
							  		  		</div>
							  		  		
							  		  		<div class="row">
							  		  			<div class="col card form-check" style="width: 5rem; height: 30rem;
									  				   background-color:white; border: 1px solid black; background-color:#f0f8ff;">
														1. 결제 후 14일 이내 취소 시 : 전액 환불<br>
														(단, 결제 후 14일 이내라도 호스트와 프립 진행일 예약 확정 후 환불 불가)<br>
														2. 결제 후 14일 이후 취소 시 : 환불 불가<br>
														※ 상품의 유효기간 만료 시 연장은 불가하며, 기간 내 호스트와 예약 확정 되지 않은 프립은 프립 에너지로 환불 됩니다.<br>
														※ 환불된 에너지의 유효기간은 지급일로부터 180일이며, 유효기간 종료 후 기간연장 및 환불이 불가합니다.<br>
														※ 배송상품의 경우 배송 준비 전 전액 환불 가능, 배송 준비 후 환불 불가 합니다.<br>
														※ 다회권의 경우, 1회라도 사용시 부분 환불이 불가하며, 기간 내 호스트와 예약 확정 되지 않은 프립은 프립 에너지로 환불 됩니다.<br>
														[환불 신청 방법]<br>
														1. 해당 프립 결제한 계정으로 로그인<br>
														2. 마이 - 신청내역 or 결제내역<br>
												</div>
												<div class="col-3"></div>
							  		  		</div>
							  		  		
							  		  		<div class="row my-4">
								  		  			<div class="col d-grid">
								  		  				
														<button id="toastStart" onclick="doSubmit()" class="btn btn-info">검수 요청</button>
								  		  			</div>
								  		  		
							  		  			<div class="col-3"></div>
							  		  		</div> 
							  		  	
							  		  	</div>
							  		  </div>	
								  	 
								  </div>
								</div>
							</div>
							
							<div class="col">
								<div class="card" style="width: 100%; height: 180rem;">
								  <div class="card-body">
								  
								  	<div class="row">
								  		<div class="col">
								  			<h5 class="titleText" style="font-size: 20px;">상품 등록 가이드</h5>
								  		</div>
								  	</div>
								  	
								  	<div class="row my-4">
								  		<div class="col">
								  			<p style="font-size: 1.8em; line-height: 30px; color: #333;">
								  			프립 만들기 전 고려 사항</p>
								  			</div>
								  		</div>
								  		
								  		<div class="row">
								  			<div class="col">
								  				<div class="card" style="width: 100%; height: 13em;
								  				background-color:#f0f8ff;">
								  				
								  				<div class="row" style="margin-bottom: 30px; margin-top: 15px;">
								  					<div class="col-1 fs-4" style="margin-top: 30px;">⚠️</div>
								  					<div class="col">
								  						<ul >
								  							<li>프립 진행 시 주의해야 하는 부분을 먼저 확인 부탁드립니다.</li>
								  							<li>법률 규정 이슈가 있을 경우, 프립은 어떠한 경우에도 책임을 지지 않습니다.</li>
								  							<li>안전 규정 및 법률은 호스트님과 대원들을 위해 개별적으로 확인 후 진행 부탁드립니다.</li>
								  						</ul>
								  					</div>
								  				</div>
								  				
								  				<div class="row my-3" style="background-color:#f0f8ff; border-top:50px;">
								  					<div class="col">								  	
								  						<p style="font-size: 18px; font-weight: bold; text-decoration: underline;">오픈 불가 프립</p>
									  						<ul>
									  							<li>소개팅 / 남녀 만남 주선 프립</li>
									  							<li>영화 상영 프립</li>
									  							<li>드라이브, 안전이 보장되지 않은 장소에서 하는 프립</li>
									  						</ul>
								  					</div>
								  				</div> 
								  				
								  				<div class="row my-3" style="background-color:#f0f8ff;">
								  					<div class="col">								  	
								  						<p style="font-size: 18px; font-weight: bold; text-decoration: underline;">주의가 필요한 프립</p>
									  						<ul >
									  							<li>활동적인 액티비티 프립</li>
									  							<li>개인 과외 프립</li>
									  							<li>요리,음료를 제공하는 프립</li>
									  							<li>주류를 제공하는 프립</li>
									  						</ul>
								  					</div>
								  				</div>
								  				
								  				<div class="row my-3" style="background-color:#f0f8ff;">
								  					<div class="col">								  	
								  						<p style="font-size: 18px; font-weight: bold; text-decoration: underline;">기타 주의사항</p>
									  						<ul>
									  							<li>참가자의 개인정보 (전화번호, 이메일, SNS등)는 수집하실 수 없습니다.</li>
									  							<li>사주 프립 등 필수적으로 추가 개인 정보가 필요한 경우 대원의 정보 제공 동의가 필요하며, 자료가 남는 형태(설문지, 메일, 문자 메시지 등)로 직접 동의를 받아야 합니다.</li>
									  						</ul>
								  					</div>
								  				</div>
								  				
									  		<div class="row my-4">
									  			<div class="col">
									  			<h6 style="font-size: 35px; line-height: 30px; color: #333; text-decoration: underline;">
									  			기본 작성 가이드</h6>
									  			</div>
									  		</div>
								  		
							  				<div class="row my-3" style="background-color:#f0f8ff;">
							  					<div class="col">								  	
							  						<p style="font-size: 18px; font-weight: bold;">프립 유형</p>
								  						<ul>
								  							<li>프립 유형은 추후 수정이 불가하며, 동일한 프립을 온라인과 오프라인 동시에 운영 원하신다면 각각 하나의 프립으로 오픈 부탁드립니다.</li>
								  						</ul>
							  					</div>
							  				</div>
							  				
							  				<div class="row my-3" style="background-color:#f0f8ff;">
							  					<div class="col">								  	
							  						<p style="font-size: 18px; font-weight: bold;">카테고리</p>
								  						<ul>
								  							<li><b>직접 선택</b> 호스트님의 프립 컨텐츠에 알맞게 1차 카테고리를 선택하신 후, 더 세부적인 2차, 3차, 4차 카테고리도 선택해주시기 바랍니다.</li>
								  							<li><b>카테고리명 검색</b> 호스트님의 프립에 적절한 카테고리를 직접 검색하시면 추천해드립니다.</li>
								  						</ul>
							  					</div>
							  				</div>
							  				
							  				<div class="row my-3" style="background-color:#f0f8ff;">
							  					<div class="col">								  	
							  						<p style="font-size: 18px; font-weight: bold; text-decoration: underline;">프립 속성</p>
								  						<ul>
								  							<li>호스트님께서 운영하실 프립의 성격을 하나 혹은 그 이상으로 복수 선택 가능합니다.</li>								  							
								  						</ul>
							  					</div>
							  				</div>	
							  				
							  				<div class="row my-3" style="background-color:#f0f8ff;">
							  					<div class="col">								  	
							  						<p style="font-size: 18px; font-weight: bold; text-decoration: underline;">프립 명</p>
								  					클래스 제목에 해당하며, 작성 시 아래의 주의사항을 확인해주시기 바랍니다.	
								  						<ul>
								  							<li>장소와 액티비티를 프립명에 넣어주시면 좋습니다. (예시 : [홍대] 밸리댄스를 배워봐요!)</li>
								  							<li>욕설 및 선정적인 단어는 사용이 불가능합니다.</li>
								  							<li>특수문자는 괄호 외에는 사용이 불가능합니다. (예시 : '', ☆, ♥, ♠)</li>
								  							<li>확인되지 않은 과도한 홍보 문구는 사용이 불가능합니다. (예시 : 국내 최고의 클래스)</li>								  							
								  						</ul>
							  					</div>
							  				</div>
							  				
							  				
							  				<div class="row my-3" style="background-color:#f0f8ff;">
							  					<div class="col">								  	
							  						<p style="font-size: 18px; font-weight: bold; text-decoration: underline;">진행 장소 (오프라인 프립만 해당)</p>
								  				
								  						<ul>
								  							<li>프립이 진행되는 장소입니다.</li>
								  							<li>각 일정마다 진행되는 장소가 다르다면, +진행 장소 추가 > 장소 명(파란색 글씨) 을 클릭하여 한 개의 프립에 두 개 이상의 장소를 지정할 수 있습니다.</li>
								  							<li>상세하게 작성해주셔야 대원들이 헤매지 않고 찾아갈 수 있습니다. (예시 : 헤이그라운드 601호 (에스콰이어 빌딩 정문 오른쪽으로 들어오시면 됩니다.))</li>				  							
								  						</ul>
							  					</div>
							  				</div>
							  				
							  											  											  											  													  		  							  				<div class="row my-3" style="background-color:#f0f8ff;">
						  					<div class="col">								  	
						  						<p style="font-size: 18px; font-weight: bold; text-decoration: underline;">집결 장소 (오프라인 프립만 해당)</p>
							  				
							  						<ul>
							  							<li>진행지와 집결지가 다른 경우에만 작성해주세요. (예시 - 3호선 독립문역 1번 출구에서 만나 인왕산을 등산하는 프립)</li>
							  							<li>혼선 방지를 위하여 집결 장소는 한 군데만 지정할 수 있습니다.</li>
							  							<li>상세하게 작성해주셔야 대원들이 헤매지 않고 집결할 수 있습니다. (예시 : 헤이그라운드 1층 우편함 앞에서 집결)</li>				  							
							  						</ul>
						  					</div>
						  					
							  				</div>	
								  												  				 								  				
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