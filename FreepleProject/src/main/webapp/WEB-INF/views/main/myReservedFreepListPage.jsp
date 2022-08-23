<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여한 프립 목록</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">


<script type="text/javascript">
	

function showBeforeJoinFreepList() {
	document.getElementById("afterJoinFreepListDiv").style.display='none';
	document.getElementById("beforeJoinFreepListDiv").style.display='block';
	
	document.getElementById("afterJoinFreepBtn").style.fontWeight='lighter';
	document.getElementById("beforeJoinFreepBtn").style.fontWeight='bold';
}
function showAfterJoinFreepList() {
	document.getElementById("beforeJoinFreepListDiv").style.display='none';
	document.getElementById("afterJoinFreepListDiv").style.display='block';
	
	document.getElementById("beforeJoinFreepBtn").style.fontWeight='lighter';
	document.getElementById("afterJoinFreepBtn").style.fontWeight='bold';
}


	
window.addEventListener("DOMContentLoaded",function(){
	
});
</script>


</head>
<body>
<jsp:include page="../global/mainTop.jsp"></jsp:include>




<div style="width:1200px; margin: 0 auto">
	<div class="container-fluid">
		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<div class="row">
					<div class="col">
						<div style="font-size: 20pt; margin-top: 4%">참여프립목록</div>				
					</div>
				</div>
				<div class="row">
					<div class="col-2">
						<span id="beforeJoinFreepBtn" onclick="showBeforeJoinFreepList()" style="cursor: pointer; font-weight: bold">예약한 프립</span>
					</div>
					<div class="col-2">
						<span id="afterJoinFreepBtn" onclick="showAfterJoinFreepList()" style="cursor: pointer;">완료한 프립</span>
					</div>
					<div class="col"></div>
				</div>
				<div class="row">
					<div class="col"><!-- 프립목록 시작 -->
					
					
			
			
						<div id="beforeJoinFreepListDiv" class="text-center">
<c:if test="${empty beforeJoinFreepList}">
							<div class="text-center" style="margin-Top: 5%; height: 25em">
								<img src="../resources/img/noReservedFreepImg.jpg">
								<div>예약한 프립이 없어요!</div>
								<div>지금 바로 프립을 시작해보세요.</div>
								<a href="./mainPage"><button class="btn btn-primary">홈으로 이동</button></a>
							</div>
					
</c:if>
<c:if test="${not empty beforeJoinFreepList}">
					
	<c:forEach items="${beforeJoinFreepList}" var="beforeJoinFreep">
							<div style="margin-Top: 4%; margin-left:5%; margin-right:5%; height: 10em; background-color: #f0f2fc">
								<div style="width: 18%; display: inline-block;">
									<img style="margin-top: 0.5em; magin-bottom: 0.5em;width: 9em; height: 9em; border-radius: 15px" src="/uploadFiles/freep/freepImage/${beforeJoinFreep.fP_FreepImageVo.freep_image_link}"></img>
								</div>
								<div style="width: 80%; display: inline-block; text-align: left; float: right; padding-right: 3%; padding-left: 3%">
									<div style="width: 100%">
										<span>
											프립명 : ${beforeJoinFreep.fP_FreepVo.freep_title}
										</span>
										<span style="float: right;">
											참여형식 : ${beforeJoinFreep.fP_FreepVo.freep_onoff}
										</span>
									</div>
									<div>
										예약일시 : <fmt:formatDate value="${beforeJoinFreep.fp_PaymentVo.payment_freepJoin_date}" pattern="yyyy년 MM월 dd일"/>
										${beforeJoinFreep.fP_FreepVo.freep_time}
										<br>
										결제방식 : ${beforeJoinFreep.fp_PaymentVo.payment_method}
										<br>
										사용된 쿠폰 : 
<c:if test="${empty beforeJoinFreep.fp_MemberCouponVo}">-</c:if>
<c:if test="${not empty beforeJoinFreep.fp_MemberCouponVo}">${beforeJoinFreep.fp_MemberCouponVo.coupon_expiration}</c:if>

										<br>
										결제일시 : <fmt:formatDate value="${beforeJoinFreep.fp_PaymentVo.payment_date}" pattern="yyyy년 MM월 dd일 hh시 mm분"/>
										<br>
										결제금액 : ${beforeJoinFreep.resultPriceStringFormat}원
									</div>
								</div>
								
								
							</div>		
	</c:forEach>
	
</c:if>
						</div>	
				
				
				
				
				
						<div id="afterJoinFreepListDiv" class="text-center" style="display: none;">	
<c:if test="${empty afterJoinFreepList}">
							<div class="text-center" style="margin-Top: 5%; height: 25em">
								<img src="../resources/img/noReservedFreepImg.jpg">
								<div>완료한 프립이 없어요!</div>
								<a href="./mainPage"><button class="btn btn-primary">홈으로 이동</button></a>
							</div>
</c:if>
<c:if test="${not empty afterJoinFreepList}">
					
	<c:forEach items="${afterJoinFreepList}" var="afterJoinFreep">
							<div style="margin-Top: 4%; margin-left:5%; margin-right:5%; height: 10em; background-color: #faf0fc">
								<div style="width: 18%; display: inline-block;">
									<img style="margin-top: 0.5em; magin-bottom: 0.5em;width: 9em; height: 9em; border-radius: 15px" src="/uploadFiles/freep/freepImage/${afterJoinFreep.fP_FreepImageVo.freep_image_link}"></img>
								</div>
								<div style="width: 80%; display: inline-block; text-align: left; float: right; padding-right: 3%; padding-left: 3%">
									<div style="width: 100%">
										<span>
											프립명 : ${afterJoinFreep.fP_FreepVo.freep_title}
										</span>
										<span style="float: right;">
											참여형식 : ${afterJoinFreep.fP_FreepVo.freep_onoff}
										</span>
									</div>
									<div>
										참여일시 : <fmt:formatDate value="${afterJoinFreep.fp_PaymentVo.payment_freepJoin_date}" pattern="yyyy년 MM월 dd일"/>
										${afterJoinFreep.fP_FreepVo.freep_time}
										<br>
										결제방식 : ${afterJoinFreep.fp_PaymentVo.payment_method}
										<br>
										사용된 쿠폰 : 
<c:if test="${empty afterJoinFreep.fp_MemberCouponVo}">-</c:if>
<c:if test="${not empty afterJoinFreep.fp_MemberCouponVo}">${afterJoinFreep.fp_MemberCouponVo.coupon_expiration}</c:if>
										
										<br>
										결제일시 : <fmt:formatDate value="${afterJoinFreep.fp_PaymentVo.payment_date}" pattern="yyyy년 MM월 dd일 hh시 mm분"/>
										<br>
										결제금액 : ${afterJoinFreep.resultPriceStringFormat}원
									</div>
								</div>
								
								
							</div>	
	</c:forEach>
	
</c:if>
							
						</div>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
					</div> <!-- 프립목록 끝 -->
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
</div>


<a href="./myReservedFreepPage">참여프립상세페이지</a>




<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>