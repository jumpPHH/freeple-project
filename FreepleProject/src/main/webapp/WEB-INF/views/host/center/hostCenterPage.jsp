<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 지원</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/freeple/resources/css/centerPage.css">
</head>
<body>
		<div style="margin: 0 auto">
				<div class="container-fluid">
					   
					   <div class="row">
					   						   
					   		<div class="col-2"></div>
					   				
					   		<div class="col-10">
					   			<div class="row">
					   				<div class="col">
										<a href="/freeple/main/mainPage">
										<img style="width: 140px; height: 40px;" src="/freeple/resources/img/mainPageFreepleLogo.png"></a>
									</div>
					   				<div class="col"></div>
					   				
					   				<!-- 로그인 안되어있을때 -->
									<c:if test="${empty sessionUserInfo}">
										<div class="col-2 text-center">
											<a class="btn btn-primary" href="/freeple/host/login/hostLoginPage">로그인</a>
										</div>
									</c:if>
									
									<!-- 로그인 되어있을때 -->
									<c:if test="${not empty sessionUserInfo}">
										
										<div class="col-3">

										</div>
										<div class="col text-center" >
											<h6 class="sessionComplte">호스트 센터에 오신걸 환영합니다.</h6>
											<b>${sessionUserInfo.mb_nick} 님!</b>
										</div>
										<div class="col text-center">
											<a class="btn btn-primary" href="/freeple/member/login/logoutProcess">로그아웃</a>
										</div>
									</c:if>
					   				
					   			</div>
					   		</div>
					   		
					   		<div class="col-2"></div>
	
					   </div>
					   
					   <div class="row my-4"> 
					     <div class="container">
					     	<img style="padding: 0px; width: 100%; height: 500px;" 
							src="/freeple/resources/img/host-back.jpg"> 
							<h2 class="containerText01">좋아하는 일</h2>
							<h2 class="containerText02">걱정없이 하세요.</h2>
							<h6 class="containerText03">당신의 재능을 마음껏 펼치세요.</h6>
							<h6 class="containerText04">수익은 프립이 만들어 드립니다.</h6>
							
							<c:if test="${not empty sessionUserInfo}"><!-- 로그인 되어있을때 -->
							  <a href="/freeple/host/main/hostMainPage" class="btn btn-primary01">5분안에 호스트 시작하기 ></a>
							</c:if>
							
							<c:if test="${empty sessionUserInfo}"><!-- 로그인이 되어있지 않을때 -->
							  <a href="/freeple/host/login/hostLoginPage" class="btn btn-primary01">5분안에 호스트 시작하기 ></a>
							</c:if>	
													
					     </div>
					  </div>					  
					  
					 <div class="row my-5">
					  	<div class="col"></div>
					    <div class="col">
					      <h3 class="hNqpkK">수익이 궁금해요.</h3>
					      <p class="faJPFm">프립에서는 재미로 시작한 나의 취미로 수익도 내고<br>
					      많은 사람들은 일상을 특별하게 해줄 수 있습니다.</p>
					    </div>
					  	<div class="col"></div>
					 </div>
					 
					 <div class="row my-5">
					 	<div class="col">
					 		<h3 class="igYddE">1.3만 명</h3>
					 		<h3 class="lfJVwF">등록 호스트 수</h3>
					 	</div>
					 	<div class="col">
					 		<h3 class="igYddE">100만 명</h3>
					 		<h3 class="lfJVwF">프립 가입자 수</h3>					 	
					 	</div>
					 	<div class="col">
					 		<h3 class="igYddE">430만 원</h3>
					 		<h3 class="lfJVwF">월 평균 호스트 수익</h3>					 	
					 	</div>
					 </div>
					  
					 <div class="row my-5">
					 	<div class="col">
					 	  <div class="fjtsao"></div>
					 	</div>
					 </div>
					 
					 <div class="row my-5">
					  	<div class="col"></div>
					    <div class="col">
					      <h3 class="hNqpkK">프립과 해야하는 이유</h3>
					      <p class="faJPFm">국내 최대 여가 액티비티 플랫폼 프립과 함께 하면<br>
					      누구나 매력적인 콘텐츠를 가진 인기 호스트님이 될 수 있습니다.</p>
					    </div>
					  	<div class="col"></div>
					 </div>
					 
					 <div class="row">
					 
					 	<div class="col fYPNFX">
						 		<div class="geJNTv">1</div>
						 		<div class="bOpkNx">1:1클래스 관리</div>
						 		<p class="gdcTAa">
						 		1:1 관리로 호스트당 담당자가 배정<br>
						 		되어 콘텐츠 제작, 일정 조율, 커리큘<br>
						 		럼 등 상품 제작에 도움을 드립니다.</p>
					 	</div>
					 	
					 	<div class="col fYPNFX">
						 	
						 		<div class="geJNTv">2</div>
						 		<div class="bOpkNx">나만의 브랜드 구축</div>
						 		<p class="gdcTAa">
	                             모임을 리드하는 호스트로서 인지도<br>
	                             를 쌓으면서 누구도 따라 할 수 없는<br>
	                             자신만의 브랜드를 프립에서 구축할 수 있습니다.
	                             </p> 
	                                 				 	
						</div>
						
					 	<div class="col eHwPsX">
						 	
						 		<div class="geJNTv">3</div>
						 		<div class="bOpkNx">다양한 네트워크</div>
						 		<p class="gdcTAa">
								재능을 가진 호스트와 새로운 경험<br>
								을 원하는 대원들을 연결해드립니<br>
								다. 100만 명의 대원들과 특별한 경<br>
								험을 나누어보세요.</p>					 	
						 	
					    </div>
					 </div>
					 
					 <div class="row">
					 	<div class="col fYPNFX">
						 	
						 		<div class="geJNTv">4</div>
						 		<div class="bOpkNx">마케팅 활성화</div>
						 		<p class="gdcTAa">
								호스트님의 프립에 적합한 고객을<br>
								쉽게 모을 수 있도록 담당자가 다양<br>
								한 마케팅으로 홍보를 도와드립니다.</p>
												 	
					 	</div>
					 				
					 	<div class="col fYPNFX">
						 	
						 		<div class="geJNTv">5</div>
						 		<div class="bOpkNx">프립톡</div>
						 		<p class="gdcTAa">
								프립을 참여하는 대원과 실시간 채<br>
								팅을 통해 일정 조율 및 공지를 간편<br>
								하게 전달할 수 있습니다.</p>					 	
						 	
					 	</div>
					 	
					 	<div class="col eHwPsX">
						 	
						 		<div class="geJNTv">6</div>
						 		<div class="bOpkNx">기업 단체 프립 연결</div>
						 		<p class="gdcTAa">
								팀웍 향상을 위해 단체로 프립을 신<br>
								청하는 기업과 호스트님들을 연결해<br>
								드리고 있습니다. 기업 대상으로도 <br>
								재능을 펼쳐보세요.</p>					 	
						 	
					 	</div>
					 	
					 </div>
					 
					 <div class="row my-5">
					 	<div class="col"></div>
					
					 	<div class="col" style="text-align: center;">
					 	  	<c:if test="${not empty sessionUserInfo}"><!-- 로그인 되어있을때 -->
							  <a href="/freeple/host/main/hostMainPage" class="btn btn-primary02">5분안에 호스트 시작하기 ></a>
							</c:if>
							
							<c:if test="${empty sessionUserInfo}"><!-- 로그인이 되어있지 않을때 -->
							  <a href="/freeple/host/login/hostLoginPage" class="btn btn-primary02">5분안에 호스트 시작하기 ></a>
							</c:if>	
					 	</div>

					 	<div class="col"></div>
					 </div>
					 
					 <div class="row my-5">
					  	<div class="col-2"></div>
					    <div class="col">
					      <h3 class="hNqpkK">
					      경영과 파티를 함께<br>
					      즐길 수 있는,호스트 데이
					      </h3>
					      <p class="faJPFm">호스트 데이란 호스트님들의 프립을 업그레이드하기 위한 강연부터 다른분야의 호스트님들과의<br>
						  네트워킹 파티까지 모두 즐길 수 있는, 오직 프립 호스트님들을 위한 자리입니다.<br></p>
					    </div>
					  	<div class="col-2"></div>
					 </div>

					  <div class="row">
					  	<div class="col"></div>
					  	<div class="col">
					  	<iframe width="800" height="500" src="https://www.youtube.com/embed/xJfRFM7FJsg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					  	</div>
					  	<div class="col"></div>
					  </div>
					
					 
					 <div class="row guveUJ my-5">
					 	
						 	<div class="row my-4">
						 	<div class="col-2"></div>
						    <div class="col">
						      <h3 class="hNqpkK">
						      호스트가 되는 과정
						      </h3>
						      <p class="faJPFm">원스탑 액티비티 서비스를 통해<br>
							  쉽고 편하게 경험을 공유할 수 있습니다.<br></p>
						    </div>
						  	<div class="col-2"></div>
						  	</div>
					  	
						  	<div class="row my-4">
						 	<div class="col">
						 	  <img class="fVhLJp" src="/freeple/resources/img/tobehost1.png">
						 	  <div class="hOSnWD">호스트 등록</div>
						 	  <p class="hIZrvy">
						 	  간편한 방법으로 5분 만에<br>
						 	  호스트가 되어보세요.</p>
						 	</div>
					 	
						 	<div class="col">
						 	  <img class="iZkIHR" src="/freeple/resources/img/allow.png">
						 	</div>
					 	
						 	<div class="col"> 
						 	  <img class="fVhLJp" src="/freeple/resources/img/tobehost2.png">
						 	  <div class="hOSnWD">프립 만들기</div>
						 	  <p class="hIZrvy">
						 	  프립에서 진행할 클래스를<br>
							  등록해주시면 매니저가<br>
							  확인 후 연락을 드립니다.</p>
						 	</div>
					 	
						 	<div class="col">
						 	  <img class="iZkIHR" src="/freeple/resources/img/allow.png">
						 	</div>
					 	
						 	<div class="col">
						 	  <img class="fVhLJp" src="/freeple/resources/img/tobehost3.png">
						 	  <div class="hOSnWD">프립 오픈 및 운영</div>
						 	  <p class="hIZrvy">
						 	  편집부터 오픈까지 모두<br>
							  도와드립니다. 오픈후 고객을<br>
							  위한 각종 홍보 활동을 진행합니다.</p>
						 	</div>
					 	
						 	<div class="col">
						 	  <img class="iZkIHR" src="/freeple/resources/img/allow.png">
						 	</div>
					 	
						 	<div class="col">
						 	  <img class="fVhLJp" src="/freeple/resources/img/tobehost4.png">
						 	  <div class="hOSnWD">정산</div>
						 	  <p class="hIZrvy">
						 	  프립 호스트가 되어 한달에<br>
							  한번 받는 월급을<br>
							  매주 수요일마다 받아보세요.</p>
						 	</div>
					 	</div>
					 	
					 </div>
					 
					 <div class="row my-5">
					  	<div class="col-2"></div>
					    <div class="col">
					      <h3 class="hNqpkK">
					      프립과 함께한 호스트들
					      </h3>
					      <p class="faJPFm">
					      많은 호스트들이 프립에서 사람들과 취미를 공유하며<br>
						  제2의 인생을 시작하고 있습니다.</p>
					    </div>
					  	<div class="col-2"></div>
					 </div>
					
						
					 <div class="row">
					 
					 	<div class="col">
					 	 <section>
					 	 	<img class="gZykYN" src="/freeple/resources/img/first-host1.png">
					 	 	<div class="cvwMAO">
					 	 		<div class="dSgcAI">
					 	 				<p class="cIKEJO">
					 	 				"제가 가지고 있는 재능을<br> 
					 	 				사람들에게 알려줄 수 있어서 좋아요."</p>
					 	 				<p class="ZEtHU">정은샘</p>
					 	 		</div>
					 	 	</div>
					 	 </section>
					 	</div>
					 	
					 	<div class="col">
					 	 <section>
					 	 	<img class="gZykYN" src="/freeple/resources/img/first-host2.png">
					 	 	<div class="cvwMAO">
					 	 		<div class="dSgcAI">
					 	 				<p class="cIKEJO">
					 	 				"프립을 열 때마다 많은<br>
					 	 				다양한 사람들을 만날 수 있는 점이<br>
					 	 				가장 좋아요."</p>
					 	 				<p class="ZEtHU">낭만성지</p>
					 	 		</div>
					 	 	</div>					 	 	
					 	 </section>	
					 	</div>
					 	
					 	<div class="col">
					 	  <section>
					 	  	<img class="gZykYN" src="/freeple/resources/img/first-host3.png">
					 	 	<div class="cvwMAO">
					 	 		<div class="dSgcAI">
					 	 				<p class="cIKEJO">
					 	 				"프립으로 인해서<br>
					 	 				최대 매출을 찍어봤어요."</p>
					 	 				<p class="ZEtHU">레더레스트</p>
					 	 		</div>
					 	 	</div>					 	  	
					 	  </section>
					 	</div>
					 	
					 	<div class="col">
					 	  <section>
					 	  	<img class="gZykYN" src="/freeple/resources/img/first-host4.png">
					 	 	<div class="cvwMAO">
					 	 		<div class="dSgcAI">
					 	 				<p class="cIKEJO">
					 	 				"프립은 직접적으로 홍보할 수 있는<br>
					 	 				공간이 되어서 새로운 도전을 하는데<br>
					 	 				문턱을 낮춰주었습니다."</p>
					 	 				<p class="ZEtHU">고요체</p>
					 	 		</div>
					 	 	</div>					 	  	
					 	  </section>
					 	</div>
					 </div>
					 
							 <div class="row my-5">
							 	<div class="col-2"></div>
							 	<div class="col">
						 			<h3 class="eSynTx">FAQ</h3>
									<h3 class="fqaline"></h3>							 	
							 	</div>
							 	<div class="col-2"></div>
							 </div>
					 
						<div class="row">
					 		<div class="col-2"></div>
						 		<div class="col">
									<p>
									  <button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample1" aria-expanded="false" aria-controls="collapseWidthExample1">
									    프립의 호스트는 누구나 가능한가요?
									  </button>
									</p>
									<div style="min-height: 10px;">
									  <div class="collapse collapse-horizontal" id="collapseWidthExample1">
									    <div class="card card-body" style="width: 1050px;">
									      프립은 어느 누구에게나 열려 있습니다! 마음속에 나만의 액티비티를 갖고 있다면 호스트 가입 후, 프립 만들기를 진행해보시길 바랍니다!
									    </div>
									  </div>
									</div>
									
									<p>
									  <button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample2" aria-expanded="false" aria-controls="collapseWidthExample2">
									    내가 운영하는 프립, 잘 팔릴 수 있을지 고민이신가요?
									  </button>
									</p>
									<div style="min-height: 10px;">
									  <div class="collapse collapse-horizontal" id="collapseWidthExample2">
									    <div class="card card-body" style="width: 1050px;">
									      프립은 개인 컨설팅을 지원해 드립니다. 프립에서 호스트 등록 후에는 담당 매니저가 배정되며, 담당 매니저와 함께 프립에 대한 고민, 운영<br>
									      에 대한 고민을 나눌 수 있습니다. 프립은 혼자 운영하는 방식이 아닌 호스트님과 프립이 함께 만들어나가는 파트너십을 지향합니다.
									    </div>
									  </div>
									</div>
									
									<p>
									  <button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample3" aria-expanded="false" aria-controls="collapseWidthExample3">
									    정산은 어떻게 진행되나요?
									  </button>
									</p>
									<div style="min-height: 10px;">
									  <div class="collapse collapse-horizontal" id="collapseWidthExample3">
									    <div class="card card-body" style="width: 1050px;">
										  프립은 매주 수요일마다 정산을 해드리고 있습니다. 프립 호스트가 되어 한 달에 한번 받는 월급을 매주 수요일마다 받아보세요.
									    </div>
									  </div>
									</div>
									
									
									<p>
									  <button class="btn btn-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample4" aria-expanded="false" aria-controls="collapseWidthExample4">
									    프립에서 판매가 잘 되면 추가적인 혜택이 있나요?
									  </button>
									</p>
									<div style="min-height: 10px;">
									  <div class="collapse collapse-horizontal" id="collapseWidthExample4">
									    <div class="card card-body" style="width: 1050px;">
									      프립에서는 슈퍼호스트 제도가 있습니다. 매달 열심히 활동하신 분들 중 판매가 잘 이루어진 분들을 슈퍼호스트로 선정하여 수수료 환급, 기<br>
									      획전 노출 등 다양한 혜택을 드리고 있습니다.
									    </div>
									  </div>
									</div>																																					 			
								</div>
								
						 <div class="row my-5">
						  	<div class="col-2"></div>
						    <div class="col">
						      <h3 class="hNqpkK">
						      지금 호스트로<br>
						      지원하고 수익을 창출하세요.
						      </h3>
						    </div>
						  	<div class="col-2"></div>
						 </div>	
						 
						 <div class="row my-2">
						 	<div class="col"></div>
						 	
						 	
					 	<div class="col" style="text-align: center;" >
					 	  	<c:if test="${not empty sessionUserInfo}"><!-- 로그인 되어있을때 -->
							  <a href="/freeple/host/main/hostMainPage" class="btn btn-primary02">5분안에 호스트 시작하기 ></a>
							</c:if>
							
							<c:if test="${empty sessionUserInfo}"><!-- 로그인이 되어있지 않을때 -->
							  <a href="/freeple/host/login/hostLoginPage" class="btn btn-primary02">5분안에 호스트 시작하기 ></a>
							</c:if>	
					 	</div>
						 	
						 	
						 	<div class="col"></div>
						 </div>					 							
							 
						  <div class="row my-5">
						  	<div class="col"></div>
						  	<div class="col">
						  	 	<img class="jghvoH" src="/freeple/resources/img/phone-banner.gif">
						  	</div>
						  	<div class="col"></div>
						  </div>	 
							 
						  <div class="row my-2 guveUJ">
						  	<div class="row">
							  	<div class="col"></div>
							  	<div class="col-8">
							  		<a href=".." class="boldfont">프립</a>&nbsp;&nbsp;&nbsp;
							  		<a href=".." class="boldfont">호스트 지원</a>
							  	</div>
							  	<div class="col"></div>
							 </div>
							 
						  <div class="row my-4">
						  	
						  	<div class="col"></div>
						  	<div class="col-8">
						  	  <div class="row">
						  	   	<div class="col">
						  	   		<h6 style="font-weight: bold;">Freeple</h6><br>
						  	   		
						  	   		<p class="eYIWqJ">㈜프리피플  |  사업자 등록번호 : 261-81-04555 | 통신판매업신고번호 : 2016-서울성동-01088<br><br>
						  	   		대표 : 김찬우 | 개인정보 관리 책임자 : 구용진 | 서울시 성동구 왕십리로 115 헤이그라운드 서울숲점 G605 <br><br>
						  	   		㈜프리피플은 통신판매중개자로서 거래당사자가 아니며, 호스트가 등록한 상품정보 및 거래에 대해 ㈜프리피플은 <br><br>
						  	   		일체의 책임을 지지 않습니다.
						  	   		</p>
						  	   		
						  	   		<h6 class="eYIWqJ" style="font-weight: bold;">이용약관 &nbsp;|&nbsp; 개인정보 처리방침 &nbsp;|&nbsp; 위치기반 서비스 이용약관</h6><br>
						  	   		
						  	   		<img class="jghvou" src="/freeple/resources/img/last.png">
						  	   	</div>
							  	   	<div class="col">
							  	   	
							  	   	<h6 style="font-weight: bold;">호스트 지원센터</h6><br>
							  	   	
							  	   	<p class="eYIWqJ">
							  	   	이메일 :frip@frientrip.com<br><br>
						  	   		전화번호 : 070-7111-1522<br><br>
						  	   		업무시간 : 평일 10:00 - 17:00 (점심 : 12:00 - 13:00)<br><br>
						  	   		</p>
									</div>
						  	  </div>
						  	</div>
						  	<div class="col"></div>
						  
						  </div>
						  
						  </div>	 
							 
							<div class="col-2"></div>
					    </div>

					 <div>
				</div>
			</div>
		</div>
		
				

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>