<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프립 목록 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/freeple/resources/css/hostMainPage.css">

</head>
<body style="font-weight: bold;">
	<div style="margin: 0 auto">
		<div class="container-fluid">
			<div id="app" class="row">
				
				<jsp:include page="../global/hostMainLeft.jsp"></jsp:include>
				
			<div class="col-9">
			
			    <jsp:include page="../global/hostMainTop.jsp"></jsp:include>
					
				<form action="./hostFreepListPage" method="post">
					
					<div class="row no-gutters my-3">
						<div class="row">
							<div class="col">
								<div class="card" style="width: 100%; height: 20rem;">
									  <div class="card-body">
									  
									  	<div class="row">
									  		<div class="col">
									  			<h5 class="titleText">프립 목록</h5>
									  		</div>
									  	</div>
									  	
									  	<div class="row my-4">
									  		<div class="col" style="border-bottom: 1px solid;">
									  			<h6 style="font-size: 25px; line-height: 30px; color: #333;">프립 조회</h6>
									  		</div>
									  	</div>

									  	<div class="row my-5">
									  		<div class="col">
									  			<h6 style="font-size: 15px; color: #333; font-weight: bold; margin-top: 20px;">검색어</h6>
									  		</div>
									  	
									  		<div class="col">
												<div class="form-floating">
												  <select name="searchType" class="form-select" id="floatingSelect" aria-label="Floating label select example"
												  style="font-size: 15px; color: #333; font-weight: bold; padding: 10px;">
												    <option selected value="title">상품명</option>
												    <option value="content">상품내용</option>
												  </select>
												</div>
									  		</div>
									  		
									  		<div class="col-6">
									  			<div class="form-floating">
												  <textarea name="searchWord" class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
												  <label for="floatingTextarea" style="font-size: 15px;">검색어를 입력해주세요.</label>
												</div>
									  		</div>
									  		
									  		<div class="col">
									  			<button type="submit" class="btn btn-primary btn-lg" style="height: 60px; font-size: 15px;"><i class="bi bi-search">검색</i></button>
									  		</div>									  											  											  		
									  	</div>
									  	
								
										
									</div>
							  	</div>
						  	</div>	
				  		</div>
				  	</div>
			   	
			  	<div class="row no-gutters my-4">
						<div class="row">
							<div class="col">
								<div class="card" style="width: 100%; height: 60rem;">
								
								  <div class="card-body">
								  
								  	<div class="row my-4">
								  		<div class="col">
								  			<h6 style="font-size: 25px; line-height: 30px; color: #333;">검색 결과 : ${freepVoCount[0].hostFreepVoCount}  건</h6>
								  		</div>
								  	</div>
								  	
 								<c:if test="${not empty getThumbnail}">
 									<div class="row">
							  			<c:forEach items="${getThumbnail}" var="getThumbnail" begin="0" end="3">
							  			
									 		<div class="card" style="width: 30rem; height: 30rem; margin-left: 10px;">
											  <img src="/uploadFiles/freep/freepImage/${getThumbnail.thumbnail[0].freep_image_link}" 
											  style="width: 300px; height: 300px; align-self: center; margin-top: 60px;">
											  <div class="card-body">
											  
											   	<div class="row">
											   		<div class="col" style="padding-right: 0px; padding-left: 90px;">
												   		<div class="badge bg-primary text-wrap" 
												   		style="width: 6rem; height: 3rem; padding-top: 15px; font-weight: bold;">
															  검수신청 
														</div>
													</div>
											   		<div class="col">
												   		<div class="badge bg-primary text-wrap" 
												   		style="width: 6rem; height: 3rem; padding-top: 15px; font-weight: bold;">
															  검수중 
														</div>
													</div>
											   	</div>
											   	
											  </div>
											</div>
								 		</c:forEach>  
								  	 </div>
 								</c:if>

								<c:if test="${empty getThumbnail}"></c:if>	
								
								<c:if test="${not empty hostFreepDataList}">								  
								 <div class="row my-4">
									 <c:forEach items="${hostFreepDataList }" var="hostFreepDataList" begin="0" end="3">	
									 	<div class="card" style="width: 30rem; height: 15rem; margin-left: 10px;">
										 	 <div class="card-body">	
												<h6 style="font-weight: bold; font-size: 15px;">NO.${hostFreepDataList.HostFreepVo.freep_no}</h6>		  	
						  						<h6 style="font-weight: bold; font-size: 20px;"
						  						> ${hostFreepDataList.HostFreepVo.freep_title }</h6>  
									   			<h6>등록 날짜 : <fmt:formatDate value="${hostFreepDataList.HostFreepVo.freep_writedate }" pattern="yy.MM.dd"/></h6> 					   													   		<div class="row">
									   			<h6>강의 시간 : ${hostFreepDataList.HostFreepVo.freep_time }</h6>
												 
											</div>
											</div>		
										</div>
									</c:forEach>										 			
								 </div>
							    </c:if>
							    
							    <c:if test="${empty hostFreepDataList}"> </c:if>
								   
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