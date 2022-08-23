<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/freeple/resources/css/hostMainPage.css">	
	
					<div class="row" style="background-color: #fff!important; border-bottom-style: groove;">
					
						<div class="col">
							<div class="row my-4">
								<div class="col">
								  <p style="color: #333!important; font-weight: bold; font-size: 1.5em;">호스트 관리 페이지&nbsp;&nbsp;|</p>	
								</div>
							</div> 	
						</div>
						
					    <div class="col-4">					    
						    <div class="row my-4">
						    	<div class="col">
						    	   <a href="/freeple/host/center/hostCenterPage" class="btn btn-primary" style="text-decoration: none; color: white; font-weight: bold;">호스트 가이드</a>
						    	 </div>
						    </div>
						</div>
					    <div class="col"></div>
					    <div class="col-3">
							
					    			<!-- 로그인 안되어있을때 -->
									<c:if test="${empty sessionUserInfo}">
										
										<div class="row my-4">
											<div class="col">
												<a class="btn btn-primary" style="text-decoration: none; color: white; font-weight: bold;" 
												href="/freeple/host/login/hostLoginPage">로그인</a>
											</div>
										</div>
										
									</c:if>
									
									<!-- 로그인 되어있을때 -->
									<c:if test="${not empty sessionUserInfo}">
										
										<div class="row my-4">
										
											<div class="col-3" >
												<img style="width: 70px; height: 65px; object-fit: cover; border-radius: 70%; overflow: hidden;" src="/uploadFiles/${sessionUserInfo.mb_image_link}">			
											</div>
											
											<div class="col-4 fs-5" style="border-top: 30px; text-align: center;">
											<b>${sessionUserInfo.mb_nick}</b>
											</div>
											
											<div class="col">
											<a class="btn btn-primary" style="text-decoration: none; color: white; font-weight: bold; font-size: 5px;" 
											href="/freeple/host/login/logoutProcess">로그아웃</a>
											
										</div>
										</div>
									</c:if>
						     </div>
						</div>	
						
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>		