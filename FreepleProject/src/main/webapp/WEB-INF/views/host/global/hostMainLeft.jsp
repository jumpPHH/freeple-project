<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/freeple/resources/css/hostMainPage.css">


			<div class="col" style="background-color: #fff!important; border-right-style: groove;">
			 
					<div class="row my-2">
						<div class="col">
							<a href="/freeple/host/main/hostMainPage"><img style="width: 100%; height: 80px; margin-left: 15px;" src="/freeple/resources/img/freepleLogo3.png"></a>
						</div>
						<div class="col"></div>
					</div>
					<c:if test="${not empty sessionUserInfo}">
						<div class="row px-4 py-3 d-flex">
							<div class="col d-grid" style="padding-right: 10px;">
								<a href="/freeple/host/register/hostFreepRegisterPage"  class="btn btn-outline-primary btn-lg">프립 등록</a>
							</div> 
							<div class="col d-grid" style="padding-right: 10px;">
								<a href="/freeple/host/list/hostFreepListPage"  class="btn btn-outline-secondary btn-lg">프립 목록</a>
							</div>
						</div>
					</c:if>
					
					<div class="row my-3">
						<div class="col">
							<p>
							  <a href=".." data-bs-toggle="collapse" data-bs-target="#collapseWidthExample1" aria-expanded="false" aria-controls="collapseWidthExample1"
							  style="font-weight: bold;">
							    <img src="/freeple/resources/img/info01.svg" style="width: 35px; height: 35px; margin-left: 15px;" class="mr-1">내 정보 
							  </a>
							</p>
							<div style="min-height: 10px;">
							  <div class="collapse" id="collapseWidthExample1">
							    <div class="card card-body" style="width: 200px; left: 20px;">
							     	<a href="/freeple/host/profile/hostProfilePage" style="font-weight: bold; padding-bottom: 5px;">프로필 관리</a>
							     	<a href=".." style="font-weight: bold; padding-bottom: 5px;">정산정보 관리</a>
							    </div>
							  </div>
							</div>
						</div>
					</div>
					
					<div class="row my-3">
						<div class="col">
							<p>
							  <a href=".." data-bs-toggle="collapse" data-bs-target="#collapseWidthExample2" aria-expanded="false" aria-controls="collapseWidthExample2"
							  style="font-weight: bold;">
							    <img src="/freeple/resources/img/info02.svg" style="width: 35px; height: 35px; margin-left: 15px;" class="mr-1">프립 관리 
							  </a>
							</p>
							<div style="min-height: 10px;">
							  <div class="collapse" id="collapseWidthExample2">
							    <div class="card card-body" style="width: 200px; left: 20px;">
							     	<a href="/freeple/host/list/hostFreepListPage" style="font-weight: bold; padding-bottom: 5px;">프립 목록</a>
							     	<a href="/freeple/host/register/hostFreepRegisterPage" style="font-weight: bold; padding-bottom: 5px;">프립 등록</a>
							     	<a href=".." style="font-weight: bold; padding-bottom: 5px;">판매 관리</a>
							     	<a href=".." style="font-weight: bold; padding-bottom: 5px;">예약 관리</a>
							     	<a href=".." style="font-weight: bold; padding-bottom: 5px;">문의 관리</a>
							     	<a href=".." style="font-weight: bold; padding-bottom: 5px;">후기 관리</a>
							    </div>
							  </div>
							</div>
						</div>
					</div>
					
					
					<div class="row my-3">
						<div class="col">
							<p>
							  <a href=".." data-bs-toggle="collapse" data-bs-target="#collapseWidthExample3" aria-expanded="false" aria-controls="collapseWidthExample3"
							  style="font-weight: bold;">
							    <img src="/freeple/resources/img/info03.svg" style="width: 35px; height: 35px; margin-left: 15px;" class="mr-1">정산 관리
							  </a>
							</p>
							<div style="min-height: 10px;">
							  <div class="collapse" id="collapseWidthExample3">
							    <div class="card card-body" style="width: 200px; left: 20px;">
							     	<a href=".." style="font-weight: bold;">정산 관리</a>
							    </div>
							  </div>
							</div>
						</div>
					</div>
					
															
					<div class="row my-3">
						<div class="col">
							<p>
							  <a href=".." data-bs-toggle="collapse" data-bs-target="#collapseWidthExample4" aria-expanded="false" aria-controls="collapseWidthExample4"
							  style="font-weight: bold;">
							    <img src="/freeple/resources/img/info04.svg" style="width: 35px; height: 35px; margin-left: 15px;" class="mr-1">공지사항 관리 
							  </a>
							</p>
							<div style="min-height: 10px;">
							  <div class="collapse" id="collapseWidthExample4">
							    <div class="card card-body" style="width: 200px; left: 20px;">
							     	<a href=".." style="font-weight: bold;">공지사항</a>
							    </div>
							  </div>
							</div>
						</div>
					</div>
					
					<div class="row"> 
						<div class="col">
							<img src="/freeple/resources/img/shareitBanner.jpg" style="width: 100%">
						</div>
					</div>
					
				</div>
				
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>		
 