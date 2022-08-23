<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<meta charset="UTF-8">

<style type="text/css">
    *{
    font-family : Jua;
    }
</style>

</head>
<body>
<jsp:include page="../../global/mainTop.jsp"></jsp:include>
<div class="row container-fluid" style="margin: 0 auto; padding: 0 auto">
<div class="col">
	
<div class="row">
    <div class="col"></div><!--여백-->
          
    <div class="col-10">
		<jsp:include page="./global/cafeBoardTopBar.jsp"></jsp:include>         
        
        <div class="row">
        	<div class="col">
        		<jsp:include page="./global/cafeBoardLeftNevi.jsp"></jsp:include>	
        	</div>
            <div class="col-10">
            	<div class="row ms-5">
            		<div class="col">
            			<div class="row border-2 border-bottom border-balck py-4">
            				<div class="col">
            					<div class="row"><div class="col fw-bold fs-3"><i class="bi bi-file-text"></i>&nbsp;전체글 보기</div></div>
            					<div class="row pt-3">
            					<div class="col">총 ${countText }개글</div>
	            					<div class="col"></div>
	            					<div class="col-2">
										<div class="form-floating">
										  <select class="form-select fs-5 p-2">
										    <option selected>20개씩</option>
										    <option value="1" class="fs-5">10개씩</option>
										    <option value="2" class="fs-5">30개씩</option>
										    <option value="3" class="fs-5">50개씩</option>
										  </select>
										</div>            					
	            					</div>           					
            					</div>
            				</div>
            			</div>
            			<div class="row py-3 border-2 border-bottom border-balck">
            				<div class="col">
            					<div class="row">
            						<div class="col-3"></div>
            						<div class="col fw-bold">제목</div>
            						<div class="col-2 fw-bold">작성자</div>
            						<div class="col-2 fw-bold">작성일</div>
            						<div class="col-1 fw-bold">조회수</div>
            					</div>
            				</div>
            			</div>
            			<div class="row">
            				<c:forEach items="${boardList }" var="data">
            				<div class="col-12"><!-- 반목문돌기 -->
            					<div class="row border-bottom border-balck py-3" onclick="location.href='./cafeBoardViewPage?writeBoard_no=${data.writeBoardVo.writeBoard_no}'">
            						<div class="col-3">${data.categoryVo.cafeBoard_Category_name }</div>
            						<div class="col">${data.writeBoardVo.writeBoard_title }</div>
            						<c:choose>
            							<c:when test="${data.cafeMemberVo.cafe_grade == 2}">
            								<div class="col-2">${data.memberVo.mb_nick }</div>
            							</c:when>
            							<c:otherwise>
            								<div class="col-2">${data.cafeMemberVo.cafeMember_nickname }</div>
            							</c:otherwise>
            						</c:choose>
            						<div class="col-2"><fmt:formatDate value="${data.writeBoardVo.writeBoard_date }" pattern="yyyy.MM.dd"/></div>
            						<div class="col-1">${data.writeBoardVo.writeBoard_readcount }</div>
            					</div>
            				</div>
            				</c:forEach>
            			</div>
            		</div>
            	</div>
	            <div class="row ms-5"><!-- 페이징이랑 게시판검색 -->
	            	<div class="col">
		                <div class="row py-3 ms-5"><!-- 페이징 -->
		                	<div class="col"></div>
		                	<div class="col"><!-- 페이징꾸미기 -->
								<nav aria-label="Page navigation example" class="text-center">
								  <ul class="pagination">
								    <li class="page-item">
								      <a class="page-link" href="./" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								    <li class="page-item"><a class="page-link" href="#">1</a></li>
								    <li class="page-item">
								      <a class="page-link" href="./" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
								  </ul>
								</nav>                	
		                	</div>
		                	<div class="col"></div>
		                </div>
	         			<div class="row"><!-- 검색 -->
	         				<div class="col"></div>
	         				<div class="col-6">
	         					<div class="row">
	         						<div class="col">
	         							<select class="form-control">
	         								<option value="title">제목</option>
	         								<option value="content">내용</option>
	         								<option value="nickname">작성자</option>
	         							</select>
	         						</div>
	         						<div class="col-6">
	         							<input class="form-control">
	         						</div>
	         						<div class="col d-grid">
	         							<button class="btn btn-secondary">검색</button>
	         						</div>
	         					</div>
	         				</div>
	         				<div class="col"></div>
	         			</div>
	            	</div>
	            </div>            	
            </div>
        </div>

    </div>
    
    <div class="col"></div><!--여백-->
</div>
	

<!-- 지우면 안됨 -->
</div>
</div>	
<br><br><br>

<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>