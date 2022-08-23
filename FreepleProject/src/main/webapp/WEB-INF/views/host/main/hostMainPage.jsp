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
<link rel="stylesheet" href="/freeple/resources/css/hostMainPage.css">
</head>
<body>
	<div style="margin: 0 auto;">
		<div class="container-fluid">
			<div id="app" class="row">
			
				<jsp:include page="../global/hostMainLeft.jsp"></jsp:include>
				
			<div class="col-9" >	
				<jsp:include page="../global/hostMainTop.jsp"></jsp:include>
				
				<div class="row my-2">
					<div class="col d-grid">
						<a href="/freeple/host/register/hostFreepRegisterPage" style="text-align: left; font-weight: bold;" class="btn btn-warning">
						<img src="/freeple/resources/img/warning-blue.svg">
						호스트님의 첫 프립을 여기에서 만들어보세요.😊
						<img style="float: right;" src="/freeple/resources/img/right-arrow.svg"></a>
					</div>
				</div>
				
				
				<div class="row my-2"> 
					<div class="col d-grid">
						<a href="/freeple/host/profile/hostProfilePage" style="text-align: left; font-weight: bold;" class="btn btn-info">
						<img src="/freeple/resources/img/danger.svg">
						호스트님의 프로필을 입력해주세요.😊 
						<img style="float: right;" src="/freeple/resources/img/right-arrow.svg"> </a>
					</div>
				</div>
				
			<div class="row no-gutters my-2">
					
						<div class="col">
							<div class="card" style="width: 100%; height: 20rem;">
							  <div class="card-body">
							    <h5 class="titleText">안녕하세요!<br>
							     ${sessionUserInfo.mb_nick}&nbsp;호스트님!</h5>
							    <h6 class="card-subtitle mb-2 text-muted">일반 호스트</h6>
							  </div>
							</div>
						</div>
						
						<div class="col">
							<div class="card" style="width: 100%; height: 20rem;">
							  <div class="card-body">
							    <div style="border-bottom: 1px solid #ddd!important;
							    font-size: 20px; font-weight: bold;
							    ">공지사항
							    <a href="" style="font-size: 10px; float: right; color: black;">더보기</a>
							    </div>
							    
								    <div class="row my-2" style="border-bottom: 1px solid #ddd!important;">
								    	<div class="col">
								    		 <p>[8월] 기획전 호스트 모집 공고~(7/31까지)</p>
								    	</div>	
								    	
								    	<div class="col">
								    		 <p style="float: right;">2022-07-21</p>
								    	</div>							    	
								    </div>
								    
								    <div class="row my-2 " style="border-bottom: 1px solid #ddd!important;">
								    	<div class="col">
								    		 <p>[8월] 기획전 호스트 모집 공고~(7/31까지)</p>
								    	</div>	
								    	
								    	<div class="col">
								    		 <p style="float: right;">2022-07-21</p>
								    	</div>								    	
								    </div>
								    
								    <div class="row my-2" style="border-bottom: 1px solid #ddd!important;">
								    	<div class="col">
								    		 <p>[8월] 기획전 호스트 모집 공고~(7/31까지)</p>
								    	</div>
								    	
								    	<div class="col">
								    		 <p style="float: right;">2022-07-21</p>
								    	</div>									    	
								    </div>
								    
								    <div class="row my-2" style="border-bottom: 1px solid #ddd!important;">
								    	<div class="col">
								    		 <p>[8월] 기획전 호스트 모집 공고~(7/31까지)</p>
								    	</div>
								    	
								    	<div class="col">
								    		 <p style="float: right;">2022-07-21</p>
								    	</div>									    	
								    </div>	
								    
								    <div class="row my-2" style="border-bottom: 1px solid #ddd!important;">
								    	<div class="col">
								    		 <p>[8월] 기획전 호스트 모집 공고~(7/31까지)</p>
								    	</div>
								    	
								    	<div class="col">
								    		 <p style="float: right;">2022-07-21</p>
								    	</div>									    	
								    </div>								    							   
							    </div>
							</div>
						</div>
			   </div>
					
					
		         <div class="row no-gutters my-2">
					
						<div class="col">
							<div class="card" style="width: 100%; height: 20rem;">
							  <div class="card-body">
							    	<div class="row">
							    	
							    		<div class="col dashboard-card">
							    			<p class="subText">이번달 진행 프립<br>
							    			<b class="numberText">0</b></p>
								    		
							    		</div>
							    		
							    		<div class="col dashboard-card">
							    			<p class="subText">이번달 취소 건수<br>
							    			<b class="numberText">0</b></p>
								    		
							    		</div>
							    		
							    		<div class="col dashboard-card-bottom">
							    			<p class="subText">전체 결제 건수<br>
							    			<b class="numberText">0</b></p>
							    		</div>
							    		
							    	</div>
							    	
							    	<div class="row">
							    	
							    		<div class="col dashboard-card">
							    			<p class="subText">전체 후기수<br>
							    			<b class="numberText">0</b></p>
							    		</div>
							    		
							    		<div class="col dashboard-card">
							    			<p class="subText">평균 평점<br>
							    			<b class="numberText">0</b></p>
							    		</div>
							    		
							    		<div class="col dashboard-card-bottom">
							    			<p class="subText">문의 응답률<br>
							    			<b class="numberText">0%</b></p>
							    		</div>
							    		
							    	</div>
							    	
							  </div>
							</div>
						</div>
						
						<div class="col">
							<div class="card" style="width: 100%; height: 20rem;">
							  <div class="card-body">
									<div class="row">
										<div class="col dashboard-card-bottom" >
											<p class="subText">이번달 판매금액<br>
							    			<b class="numberText">0</b></p>
										</div>
									</div>
									
									<div class="row">
										<div class="col dashboard-card-no">
											<p class="subText">전체 판매금액<br>
							    			<b class="numberText">0</b></p>
										</div>
									</div>
							    </div>	
							</div>
						</div>
						
					</div>
					
			<div class="row no-gutters my-2">
					
						<div class="col">
							<div class="card" style="width: 100%; height: 15rem;">
							
							  <div class="card-body">
							  
								<div class="row my-4">
								  	<div class="col-4">
								  		<img src="/freeple/resources/img/promotion.svg">
								  	</div>
								  	
								  	<div class="col">
								  		 <h5 class="titleText">특가 프로모션 서비스!</h5>
								    	<p class="blueText">운영하는 콘텐츠를 흥보하기 위해<br>
								    	프립특가 프로모션을 신청해보세요.</p>
								  	</div>
								</div>
								   

							  </div>
							</div>
						</div>
						
						<div class="col">
							<div class="card" style="width: 100%; height: 15rem;">
							  <div class="card-body">
								  
								  <div class="row my-4">
								  	<div class="col-4">
								  		<img src="/freeple/resources/img/hostCenter.svg">
								  	</div>
								  	<div class="col">
								  		 <h5 class="titleText">호스트 지원 센터</h5>
								    	<p class="blueText">운영 시간 10:00 ~ 17:00<br>
								    	점심 시간 12:00 ~ 13:00</p>
								    	<a href=".." class="btn btn-light">1:1 문의</a>
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
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>		
</body>
</html>