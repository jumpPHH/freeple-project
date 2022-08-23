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

<style>
    #cafeList{
        float: left;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
    
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
        <div class="row border-bottom border-balck py-4">
            <div class="col text-center fs-5 fw-bold ">카페 목록</div>
            <div class="col"></div>
            <div class="col"></div>
        </div>

        <div class="row pt-4"><!--본문-->
            <div class="col"><!--반복문 돌림-->
                <div class="row">
                <div class="col">
                <div class="row">
                <c:forEach items="${dataList}" var="data">
                    <div class="col-6 py-4 text-center border-bottom border-black rounded"  id="cafeList">
                        <div class="row py-2">
                        	<div class="col"><!--이미지-->
                        		<img class="rounded-3 img-fluid" src="/uploadFiles/${data.cafeVo.cafe_image_link }">
                        	</div>
                        	<div class="col-9">
                        		<div class="row"><!--카페이름-->
		                        	<div class="col fs-4 fw-bold py-2 text-start">
		                                ${data.cafeVo.cafe_name}
		                            </div>
                        		</div>
                        		<div class="row"> <!-- 카페소개 -->
		                            <div class="col text-secondary text-start">
		                                 ${data.cafeVo.cafeIntroduce_content }
		                            </div>	                       		
                        		</div>                        	
		                        <div class="row"><!--인원제한-->
		                        	<div class="col">
		                        		<div class="row">
				                            <div class="col text-start text-secondary">
				                                인원제한: ${data.cafeVo.cafeMember_limit }
				                            </div>
				                            <div class="col text-start text-secondary">
				                                현재 인원: ${data.CurrentMember.cafeMember_limit }
				                            </div>                        		
		                        		</div>
		                        	</div>
		                        </div>                        	
		                        <div class="row py-2"><!--개설일-->
		                            <div class="col text-secondary text-start">
		                                개설일:<fmt:formatDate value="${data.cafeVo.cafe_date }" pattern="yyyy.MM.dd"/>
		                            </div>
		                        </div>                        	                     	
                        	</div>
                        </div>	
                       <c:choose>
                       <c:when test="${!empty sessionUserInfo}">
                       <div class="row pb-2">
                           <div class="col"></div>
                           <div class="col d-grid">
                               <a class="btn" style="color: #ab79d1; border: 2px solid #ab79d1;" href="./TransferCafeProcess?cafe_no=${data.cafeVo.cafe_no }" role="button">
                                   카페로 가기
                               </a>
                           </div>
                           <div class="col"></div>
                       </div>
                       </c:when>
                       <c:otherwise>
                           <div class="row pb-2"">
                               <div class="col"></div>
                               <div class="col-6 d-grid">
                                   <a class="btn" style="color: #ab79d1; border: 2px solid #ab79d1;" href="../member/login/loginPage" role="button">
                                       로그인이 필요합니다
                                   </a>
                               </div>
                               <div class="col"></div>
                           </div>    
                       </c:otherwise>
                       </c:choose>                           
					</div> 
                </c:forEach>   
                </div>
                </div>        
                </div>
            </div>
        </div>

        <div class="row pt-5">
            <c:if test="${!empty sessionUserInfo }">
            <div class="col"></div>
            <div class="col d-grid">
                <a class="btn" style="background-color: #ab79d1; color: white;" href="./createCafePage" role="button">
                    카페 만들기
                </a>
            </div>
            <div class="col"></div>
             </c:if>
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