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
			<a href="../notice/registNoticePage">공지사항</a><br>
			<a href="../ask/memberAskListPage">일반회원 1:1 문의</a><br>
			<a href="../ask/hostAskListPage">호스트 1:1 문의</a>
		</div>
		<div class="col">
			<div class="row-2">
				<div class="col">
					<h1>일반 회원1:1문의</h1>
					<hr>
				</div>
				<div class="col-8"></div>
			</div>
			
			
			<c:forEach begin="0" end="${dataList.size()-1}" var="i">
			<div class="accordion" id="accordionPanelsStayOpenExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
			      <button class="accordion-button" style="background-color: rgb(240, 212, 240)" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${i}" aria-expanded="true" aria-controls="panelsStayOpen-collapse${i}">
			       	<div class="row">
						<div class="col">
							<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">닉네임</th>
							      <th scope="col">제목</th>
							      <th scope="col">내용</th>
							      <th scope="col">처리상태</th>
							      <th scope="col">작성일</th>
							    </tr>
							  </thead>
							  <tbody>
								    <tr>
								      <th scope="row">${dataList[i].memberVo.mb_nick }</th>
								      <td>${dataList[i].askVo.mb_mng_ask_title }</td>
								      <td>${dataList[i].askVo.mb_mng_ask_content }</td>
								      <c:choose>
								      	<c:when test="${dataList[i].askVo.mb_mng_ask_status eq '답변대기'}">
									      	<th scope="row" style="color: blue;">${dataList[i].askVo.mb_mng_ask_status }</td>
								      	</c:when>
								      	<c:otherwise>
								      		<th scope="row" style="color: green;">${dataList[i].askVo.mb_mng_ask_status }</td>
								      	</c:otherwise>
								      </c:choose>
								      <td><fmt:formatDate value="${dataList[i].askVo.mb_mng_ask_date }" pattern="yy.MM.dd"/></td>
								    </tr>							  	
							  </tbody>
							</table>							
						</div>
						
					</div>
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapse${i}" class="accordion-collapse collapse" style="background-color: rgb(233, 217, 234)" aria-labelledby="panelsStayOpen-headingOne">
			      <div class="accordion-body">
			      	
						<c:choose>
							<c:when test="${!empty dataList[i].askVo.mb_mng_answer_content }">
								<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">닉네임</th>
							      <th scope="col">내용</th>
							      <th scope="col">작성일</th>
							    </tr>
							  </thead>
							  <tbody>
								    <tr>
								      <th scope="row">관리자</th>
								      <td>${dataList[i].askVo.mb_mng_answer_content }</td>
								      <td><fmt:formatDate value="${dataList[i].askVo.mb_mng_answer_date }" pattern="yy.MM.dd"/></td>
								    </tr>							  	
							  </tbody>
							</table>			
							</c:when>
							<c:otherwise>
								<strong>답변미등록</strong>
							</c:otherwise>
						</c:choose>
			      	
			      </div>
			    </div>
			  </div>
			</div>
			<c:choose>
				<c:when test="${empty dataList[i].askVo.mb_mng_answer_content }">
					<div class="row">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col"></div>
				<div class="col">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${i}">
					  답변작성하기!
					</button>
					<!-- Modal -->
						<div class="modal fade" id="exampleModal${i}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">답변작성</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      
						      
						      <form action="./memberAskListProcess" method="post">
						      <div class="modal-body">
						      	<table class="table">
							  <thead>
							    <tr>
							      <th scope="col">닉네임</th>
							      <th scope="col">제목</th>
							      <th scope="col">내용</th>
							    </tr>
							  </thead>
							  <tbody>
								    <tr>
								      <th scope="row">${dataList[i].memberVo.mb_nick }</th>
								      <td>${dataList[i].askVo.mb_mng_ask_title }</td>
								      <td>${dataList[i].askVo.mb_mng_ask_content }</td>
								    </tr>							  	
							  </tbody>
							</table>		
								<!-- 답변다는 내용작성 textarea... -->
						       	<div class="form-floating">
								  <textarea name="mb_mng_answer_content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
								  <input type="hidden" name="mb_mng_ask_no" value="${dataList[i].askVo.mb_mng_ask_no }"> 
								  <label for="floatingTextarea2">Comments</label>
								</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button type="submit" class="btn btn-primary">등록하기</button>
						      </div>
						      </form>
						      
						      
						    </div>
						  </div>
						</div>
				</div>
			</div>
				</c:when>
			</c:choose>
			<br>
			 </c:forEach>
			 
			<div class="row">
				<div class="col"> <!-- 페이징 -->
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						  <c:choose>
						 		<c:when test="${startPage <= 1 }">
							  		<li class="page-item disabled"><a class="page-link">&lt;</a></li>
						  		</c:when>
						  		<c:otherwise>
						  		    <li class="page-item"><a class="page-link" href="./memberAskListPage?pageNum=${startPage - 1 }">&lt;</a></li>
						  		</c:otherwise>
						  </c:choose>
							   <c:forEach begin="${startPage }" end="${endPage }" var="i">
								   	<c:choose>
								   		<c:when test="${i == currentPageNum }">
											<li class="page-item active"><a class="page-link" href="./memberAskListPage?pageNum=${i}">${i}</a></li>  		
							    		</c:when>
							    		<c:otherwise>
							    			<li class="page-item"><a class="page-link" href="./memberAskListPage?pageNum=${i}">${i}</a></li>
							    		</c:otherwise>
							    	</c:choose>
						    	</c:forEach>
						    	<c:choose>
							    	<c:when test="${endPage >= totalPageCount }">
								    	<li class="page-item disabled"><a class="page-link">&gt;</a></li>
							    	</c:when>
							    	<c:otherwise>
							    		<li class="page-item"><a class="page-link" href="./memberAskListPage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
							    	</c:otherwise>
							    </c:choose>
							  </ul>
							</nav>
														
						</div>
					</div>
		</div>
	</div>


<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>