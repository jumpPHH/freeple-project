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
			<a href="../user/stopUserListPage">회원제제관리</a>
		</div>			
		<div class="col">
			<div class="row-2">
				<div class="col">
					<h1>회원목록</h1>
					<hr>
				</div>
				<div class="col-8"></div>
			</div>
			<form action="./totalUserListPage" method="main">
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
			
			
			
			<ol class="list-group list-group-numbered">
			  <c:forEach begin="0" end="${memberList.size()-1 }" var="i">
			  <li class="list-group-item d-flex justify-content-between align-items-start">
			    <div class="ms-2 me-auto">
			      <div class="fw-bold">${memberList[i].mb_nick }</div>
			      Content for list item
			    </div>
			  </li>
			  </c:forEach>  
			 </ol> 
			
			
			
		</div>
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>