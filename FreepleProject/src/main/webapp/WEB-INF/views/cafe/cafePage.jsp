<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<meta charset="UTF-8">
<title>카페생성</title>
<style type="text/css">
    *{
    font-family : Jua;
    }
</style>

</head>
<body>
<jsp:include page="../global/mainTop.jsp"></jsp:include>
<div class="row container-fluid" style="margin: 0 auto; padding: 0 auto">
<div class="col">
	
<div class="row">
    <div class="col"></div><!--여백-->
          
    <div class="col-10">
        <jsp:include page="./global/topBar.jsp"></jsp:include>	
        <div class="row">
        	<div class="col">
        		<jsp:include page="./global/leftSideBar.jsp"></jsp:include>	
        	</div>
            <div class="col-10">
            	<div class="row mx-4 py-3">
            		<div class="col">
            			<div class="row"><!-- 배너,,.사진? -->
            				<div class="col">
            					<img id="cafeBanner" class="img-fluid rounded" src="/freeple/resources/img/cafe/visual01.png"  style="width:80em; height:20em;">
            				</div>
            			</div>
            			<div class="row py-3 border-2 border-bottom border-balck">
	            			<div class="col mt-2 fw-bold fs-3">전체글</div>
	            			<div class="col-2 mt-2 text-end">
	            			<a href="./cafeBoard/fullCafeBoardPage?cafe_no=${cafeVo.cafe_no}" role="button" class="btn btn-outline-secondery">
	            				더보기<i class="bi bi-chevron-right"></i>
	            			</a>
	            			</div>
            			</div>
            			<div class="row">
            				<c:forEach items="${boardList }" var="data">
            				<div class="col-12 py-2"><!-- 반목문돌기 -->
            					<div class="row border-bottom border-balck mx-3 pb-3" onclick="location.href='./cafeBoard/cafeBoardViewPage?writeBoard_no=${data.writeBoardVo.writeBoard_no}'">
            						<div class="col"><i class="bi bi-dot"></i>&nbsp;${data.writeBoardVo.writeBoard_title }</div>
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
            </div>
        </div>

    </div>
    
    <div class="col"></div><!--여백-->
</div>
	

<!-- 지우면 안됨 -->
</div>
</div>	
<br><br><br>

<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>