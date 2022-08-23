<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

</head>
<body>

<jsp:include page="../global/mainTop.jsp"></jsp:include>
<div style="width:1200px; margin:0 auto">
	<div class="container-fluid">
			<div class="row mt-5">
				<div class="col-6"></div>
				<div class="col"></div>
				<div class="col">
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  문의작성하기!
					</button>
					<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">문의작성</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      
						      
						      <form action="./askWriteContentProcess" method="post">
						      <div class="modal-body">
						      		<div class="form-floating">
						      <table class="table">
							  <thead>
							    <tr>
							      <td scope="col">닉네임</td>
							    </tr>
							  </thead>
							  <tbody>
								    <tr>
								      <th scope="row">${sessionUserInfo.mb_nick }</th>
						 		   </tr>							  	
							  </tbody>
							</table>
							<table class="table">
							  <thead>
							    <tr>
							      <td scope="col">문의제목</td>
							    </tr>
							  </thead>
							  <tbody>
								    <tr>
								      <td><textarea name="mb_mng_ask_title" class="form-control" placeholder="문의제목을 작성해주세요..." id="floatingTextarea" style="height: 100px"></textarea></td>
						 		   </tr>							  	
							  </tbody>
							</table>	
							<table class="table">
							  <thead>
							    <tr>
							      <td scope="col">문의내용</td>
							    </tr>
							  </thead>
							  <tbody>
								    <tr>
								       <td><textarea name="mb_mng_ask_content" class="form-control" placeholder="문의내용을 작성해주세요..." id="floatingTextarea2" style="height: 200px"></textarea></td>
						 		   </tr>							  	
							  </tbody>
							</table>		
								</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button type="submit" class="btn btn-primary">문의하기</button>
						      </div>
						      </form>
						       						       	
						    </div>
						  </div>
						</div>
				</div>
			</div>
			
			<div class="row mt-3">
				<div class="col">
					<h1>문의하기</h1>
				</div>
				<div class="col"></div>
				<div class="col"></div>
				<hr>
			</div>
			<c:if test="${dataMap.myAskList.size() == 0}">
				<div class="row">
					<div class="col">결과가 없습니다.</div>
				</div>
			</c:if>
			<c:if test="${dataMap.myAskList.size() > 0}">
			<c:forEach begin="0" end="${dataMap.myAskList.size()-1}" var="i">
			<div class="accordion" id="accordionPanelsStayOpenExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
			      <button class="accordion-button" style="background-color: rgb(246, 237, 246)" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse${i}" aria-expanded="true" aria-controls="panelsStayOpen-collapse${i}">
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
								      <th scope="row">${dataMap.memberVo.mb_nick }</th>
								      <td>${dataMap.myAskList[i].mb_mng_ask_title }</td>
								      <td>${dataMap.myAskList[i].mb_mng_ask_content }</td>
								      <c:choose>
								      	<c:when test="${dataMap.myAskList[i].mb_mng_ask_status eq '답변대기'}">
									      	<th scope="row" style="color: blue;">${dataMap.myAskList[i].mb_mng_ask_status }</td>
								      	</c:when>
								      	<c:otherwise>
								      		<th scope="row" style="color: green;">${dataMap.myAskList[i].mb_mng_ask_status }</td>
								      	</c:otherwise>
								      </c:choose>
								      <td><fmt:formatDate value="${dataMap.myAskList[i].mb_mng_ask_date }" pattern="yy.MM.dd"/></td>
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
						<c:when test="${!empty dataMap.myAskList[i].mb_mng_answer_content }">
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
							      <td>${dataMap.myAskList[i].mb_mng_answer_content }</td>
							      <td><fmt:formatDate value="${dataMap.myAskList[i].mb_mng_answer_date }" pattern="yy.MM.dd"/></td>
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
				<c:when test="${dataMap.myAskList[i].mb_mng_ask_status eq '답변대기' }">
					<!-- 삭제 -->
				<div class="row">
						<div class="col"></div>
						<div class="col"></div>
						<div class="col"></div>
						<div class="col">	
					<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal-delete${i }">
					  삭제하기!
					</button>
					
					<!-- Modal -->
					<div class="modal fade" id="exampleModal-delete${i }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">삭제하기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      
					      <form action="./deleteAskContentProcess" method="post">
					      <div class="modal-body">
					        정말 삭제하시겠습니까?
					        <input type="hidden" name="mb_mng_ask_no" value="${dataMap.myAskList[i].mb_mng_ask_no }">
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					        <button type="submit" class="btn btn-primary">삭제</button>
					      </div>
					      </form>
					    </div>
					  </div>
					</div>
					
					
					
					
					
					
					
					
				
					<!-- 수정!!!! -->
					
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal-update${i}">
							  수정하기!
							</button>
							<!-- Modal -->
								<div class="modal fade" id="exampleModal-update${i}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      
								      <form action="./updateAskContentProcess" method="post">
								      <div class="modal-body">
								      		<div class="form-floating">
								      <table class="table">
									  <thead>
									    <tr>
									      <td scope="col">닉네임</td>
									    </tr>
									  </thead>
									  <tbody>
										    <tr>
										      <th scope="row">${sessionUserInfo.mb_nick }</th>
								 		   </tr>							  	
									  </tbody>
									</table>
									<table class="table">
									  <thead>
									    <tr>
									      <td scope="col">문의제목</td>
									    </tr>
									  </thead>
									  <tbody>
										    <tr>
										      <td><textarea name="mb_mng_ask_title"  class="form-control" placeholder="문의제목을 작성해주세요..." id="floatingTextarea" style="height: 100px">${dataMap.myAskList[i].mb_mng_ask_title}</textarea></td>
								 		   </tr>							  	
									  </tbody>
									</table>	
									<table class="table">
									  <thead>
									    <tr>
									      <td scope="col">문의내용</td>
									    </tr>
									  </thead>
									  <tbody>
										    <tr>
										       <td><textarea name="mb_mng_ask_content" class="form-control" placeholder="문의내용을 작성해주세요..." id="floatingTextarea2" style="height: 200px">${dataMap.myAskList[i].mb_mng_ask_content }</textarea></td>
								 		   </tr>							  	
									  </tbody>
									</table>		
										</div>
								      </div>
								      <input type="hidden" name="mb_mng_ask_no" value="${dataMap.myAskList[i].mb_mng_ask_no }">
								      
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								        <button type="submit" class="btn btn-primary">수정</button>
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
			 </c:if>
			 
			<div class="row">
				<div class="col"> <!-- 페이징 -->
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						  <c:choose>
						 		<c:when test="${startPage <= 1 }">
							  		<li class="page-item disabled"><a class="page-link">&lt;</a></li>
						  		</c:when>
						  		<c:otherwise>
						  		    <li class="page-item"><a class="page-link" href="./askWriteListPage?pageNum=${startPage - 1 }">&lt;</a></li>
						  		</c:otherwise>
						  </c:choose>
							   <c:forEach begin="${startPage }" end="${endPage }" var="i">
								   	<c:choose>
								   		<c:when test="${i == currentPageNum }">
											<li class="page-item active"><a class="page-link" href="./askWriteListPage?pageNum=${i}">${i}</a></li>  		
							    		</c:when>
							    		<c:otherwise>
							    			<li class="page-item"><a class="page-link" href="./askWriteListPage?pageNum=${i}">${i}</a></li>
							    		</c:otherwise>
							    	</c:choose>
						    	</c:forEach>
						    	<c:choose>
							    	<c:when test="${endPage >= totalPageCount }">
								    	<li class="page-item disabled"><a class="page-link">&gt;</a></li>
							    	</c:when>
							    	<c:otherwise>
							    		<li class="page-item"><a class="page-link" href="./askWriteListPage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
							    	</c:otherwise>
							    </c:choose>
							  </ul>
							</nav>
														
						</div>
					</div>
				</div>
			</div>
			
<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>