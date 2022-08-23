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
<title></title>

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
            <div class="col"><!--네비바-->
				<jsp:include page="./global/leftSideBar.jsp"></jsp:include>	
            </div>
            <div class="col-10"><!--본문-->
            	<div class="row mx-5">
	            	<div class="col">
               			<div class="row border-2 border-bottom border-balck py-4">
							<div class="col fw-bold fs-3"><i class="bi bi-person-plus"></i>&nbsp;회원관리</div>                				
               			</div>	   
		                <div class="row border-2 border-bottom border-balck py-4">
		                    <div class="col-2 fw-bold fs-5">현재회원수:${cafeVo2.cafeMember_limit}</div>
		                    <div class="col fw-bold fs-5">인원제한수: ${cafeVo.cafeMember_limit }</div>
		                </div>               			
		                <div class="row py-3 bg-light">
		                	<div class="col">닉네임</div>
		                  	<div class="col">카페닉네임</div>
		                  	<div class="col-2">회원등급</div>
		                  	<div class="col">게시글</div>
		                  	<div class="col">댓글</div>
		                  	<div class="col">가입일</div>
		                  	<div class="col"></div>
			            </div>		                
		                
		                
		                <div class="row">
		                    <div class="col">
		                        <div class="row">
		                            <div class="col"><!--반목분-->
										<c:forEach items="${dataList }" var="data">
										<c:if test="${data.cafeMemberVo.cafe_grade == 2 }">
		                                <div class="row border-bottom border-balck py-3"><!--닉네임, 회원 등급-->
		                                    <div class="col">${data.memberVo.mb_nick }</div>
		                                    <div class="col">(미정)</div>
		                                    <div class="col-2">${data.cafeMemberVo.cafe_grade }</div>
						                  	<div class="col">${data.cafeMemberVo2.cafe_grade}</div><!-- 게시글수 -->
						                  	<div class="col">${data.cafeMemberVo3.cafe_grade}</div><!-- 댓글수 -->			                                    
		                                    <div class="col"><fmt:formatDate value="${data.requestToJoinVo.accpetToJoin_date }" pattern="yyyy.MM.dd"/></div>
		                                    <div class="col"><button class="btn btn-secondary">탈퇴</button></div>
		                                </div>
		                                </c:if>
		                                </c:forEach>
		                            </div>
		                        </div>
		                    </div>
		                </div>	            	
	            	</div>
            	</div>
            </div>
        </div>

    </div><!--col-10끝나는--> 
    
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