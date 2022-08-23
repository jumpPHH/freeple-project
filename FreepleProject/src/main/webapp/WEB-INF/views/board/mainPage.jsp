<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	th {
    	text-align: center;
  	}
  	
  	td {
    	text-align: center;
  	}
</style>

<script type="text/javascript">


</script>
</head>
	<body>
	<jsp:include page="../global/mainTop.jsp"></jsp:include>
	<div class="row my-5">
	<div class="col-2"></div>
		<div class="col-8">
			<div style="width:1200px; margin:0 auto">
				<div class="container-fluid">				
					<div class="row my-3">	
						<h2>자유게시판</h2>
					</div>
					
					<!-- 게시글 리스트... -->
					<div class="row my-3">
						<div class="col">
							<table class="table">
								<thead>
									<tr>
										<th scope="col">글번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성자</th>
										<th scope="col">조회수</th>
										<th scope="col">작성일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="data" items="${dataList }">
										<tr>
											<td>${data.boardVo.board_no }</td>
											<td><a href="./readContentPage?board_no=${data.boardVo.board_no }" style="text-decoration:none;color:black;">${data.boardVo.board_title }</a> [${data.commentCount}]</td>
											<td>${data.memberVo.member_nick }</td>
											<td>${data.boardVo.board_readcount }</td>
											<td><fmt:formatDate value="${data.boardVo.board_writedate }" pattern="yy.MM.dd"/></td>
										</tr>
									</c:forEach>	
								</tbody>	
							</table>
						</div>
					</div>
					
					<form action="./mainPage" method="get">
							<div class="row">
								<div class="col-2">
									<select name="searchType" class="form-control">
										<option value="title"> 제목</option>
										<option value="content"> 내용</option>
										<option value="nickname"> 닉네임</option>
									</select>
								</div>
									<div class="col-9">
										<input name="searchWord" type="text" class="form-control">
									</div>
									<div class="col-1 d-grid">
										<button class="btn btn-primary">검색</button>
									</div>
									</div>
							</form>
					
							<div class="col-2 d-grid">
							<div class="row my-3">
								<c:if test="${!empty sessionUserInfo }">
									<a href="./writeContentPage" class="btn btn-primary" style="loat: right">글쓰기</a>
								</c:if>
								</div>
							</div>
							
					<div class="row">
						<div class="row mt-3">
							<div class="col">
								<nav aria-label="Page navigation example">
								<div class="text-xs-center">
								<ul class="pagination justify-content: center">
									<c:choose>
										<c:when test="${startPage <= 1}">
											<li class = "page-item disabled"><a class="page-link" href="#">&lt;</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="./mainpage?pageNum=${startPage - 1}${additionalParam}">&lt;</a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="${startPage }" end="${endPage }" var="i">
										<c:choose>
											<c:when test="${i == currentPageNum}">
												<li class="page-item active"><a class="page-link" href="./mainPage?pageNum=${i}${additionalParam}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="./mainPage?pageNum=${i}${additionalParam}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${endPage >= totalPageCount}">
											<li class="page-item disabled"><a class="page-link">&gt;</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="./mainPage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>							    	
								    	</c:otherwise>
									</c:choose>
									</ul>
									</div>
								</nav>
							</div>
						</div>
					</div>	
				
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>		
	<jsp:include page="../global/mainBottom.jsp"></jsp:include>	
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>
