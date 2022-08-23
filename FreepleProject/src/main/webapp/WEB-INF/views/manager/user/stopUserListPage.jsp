<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../global/managerTop.jsp"></jsp:include>
	<div class="row" style="height: 50em">
		<div class="col-2 text-center" style="height: 50em; background-color: rgba(211, 211, 211, 0.917)">
			<a href="../user/totalUserListPage">회원목록</a><br>
			<a href="../user/reportUserListPage">신고회원목록</a><br>
			<a href="../user/stopUserListPage">제제회원목록</a>
		</div>			
		<div class="col">
			<div class="row-2">
				<div class="col">
					<h1>제제회원목록</h1>
					<hr>
				</div>
				<div class="col-8"></div>
			</div>
			<form action="./stopUserListPage" method="get">
					<div class="row my-3"><!-- 검색 -->
						<div class="col text-center">
							<strong>회원닉네임검색</strong>
							<hr>
						</div>
						<div class="col-8">
							<input name="searchWord" type="text" class="form-control">
						</div>
						<div class="col d-grid">
							<button class="btn btn-primary">검색</button>
						</div>
					</div>
			</form>
			
			
			
			<c:if test="${stopList.size() == 0}">
				결과가 없습니다.
			</c:if>
			<c:if test="${stopList.size() > 0}">
				<ol class="list-group list-group-numbered">
				<c:forEach begin="0" end="${stopList.size()-1}" var="i">
				  <li class="list-group-item d-flex justify-content-between align-items-start">
				    <div class="ms-2 me-auto">
				      	<table class="table" style="width: 600px">
							 <thead>
							    <tr>
							      <td scope="col">제제자</td>	
							      <td scope="col">제제내용</td>
							      <td scope="col">정지해제일</td> 
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">${stopList[i].memberVo.mb_nick }</th>
							      
							      <c:choose>
							      	<c:when test="${stopList[i].reportedCount lt 3 && stopList[i].reportedCount gt 8}">
								      <th scope="row">로그인3일 정지</th>
	           						  <th scope="row"><fmt:formatDate value="${stopList[i].usingStopVo.usingStop_date}" pattern="yy.MM.dd"/></th>
							      	</c:when>
							      	<c:when test="${stopList[i].reportedCount lt 7 && stopList[i].reportedCount gt 16 }">
									  <th scope="row">로그인7일 정지</th>
	           						  <th scope="row"><fmt:formatDate value="${stopList[i].usingStopVo.usingStop_date}" pattern="yy.MM.dd"/></th>								      	
							      	</c:when>
							      	<c:when test="${stopList[i].reportedCount lt 15}">
							      	  <th scope="row">로그인15일 정지</th>
	           						  <th scope="row"><fmt:formatDate value="${stopList[i].usingStopVo.usingStop_date}" pattern="yy.MM.dd"/></th>
							      	</c:when>
							      </c:choose>
							     
					 		   </tr>							  	
							  </tbody>
						</table>
				    </div>
				    <div class="row">
			      <div class="col"></div>
			      <div class="col"></div>
			      <div class="col-6">
			    	<span style="border">신고누적 횟수</span>
			  	    <span class="badge bg-danger rounded-pill">${dataList[i].reportedCount }</span>
			  	  </div>
			  	 <div class="row mt-3">
				  	 <div class="col"></div>
				  	 <div class="col"></div>
			  	 	<div class="col-5">
			  	 		<!-- Button trigger modal -->
			  	 			  <form action="./stopUserClearlingProcess" method="post">	
									<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
									 	정지해제
									</button>
									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel">정지해제</h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									      	<input type="hidden" name="reported_person_mb_no" value="${stopList[i].usingStopVo.reported_person_mb_no }">
									        정말 해제하시겠습니까?
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									        <button type="submit" class="btn btn-primary">정지해제</button>
									      </div>
									    </div>
									  </div>
									</div>
								</form>
			  	 	</div>
			  	 </div>   
			  
			    </div>
				    
				  </li>
				  </c:forEach>
			 	</ol> 
			</c:if>	
			
			
			
			
		</div>
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>