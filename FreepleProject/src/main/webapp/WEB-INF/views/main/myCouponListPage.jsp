<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 가진 쿠폰 목록</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

</head>
<body>
<jsp:include page="../global/mainTop.jsp"></jsp:include>

<div style="width:1200px; margin: 0 auto">
	<div class="container-fluid">
		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<div class="row">
					<div class="col"  style="font-size: 20pt; margin-top: 4%; margin-bottom: 2%">
						보유 쿠폰 목록
					</div>
				</div>
				<div class="row">
					<div class="col">
						<table class="table table-hover">
							<tr>
								<th>쿠폰</th>
								<th>할인가격</th>
								<th>사용기한</th>
							</tr>
							
<c:forEach items="${couponList}" var="fP_MemberCouponVo">
							<tr>
								<td>${fP_MemberCouponVo.coupon_expiration}</td>					
								<td>-${fP_MemberCouponVo.sale_price}원</td>
								<td>무제한</td>
							</tr>
</c:forEach>
						</table>							
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
</div>


<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>