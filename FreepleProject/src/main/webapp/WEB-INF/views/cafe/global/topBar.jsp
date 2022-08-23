<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row pt-4">
    <div class="col fs-4 fw-bold " onclick="location.href='./cafePage?cafe_no=${cafeVo.cafe_no}'">
    ${cafeVo.cafe_name }</div>
</div>
<div class="row border-bottom border-balck py-4">
	<div class="col fs-5 text-center">${cafeVo.cafeIntroduce_content }</div>
</div>
<div class="row">
	<div class="col"></div>
	<div class="col"></div>
	<div class="col">
		<div class="row py-3"><!-- 꾸미기용, 나중에 기능넣기 -->
			<div class="col"><input class="form-control form-control" type="text"></div>
			<div class="col-3 d-grid"><button class="btn btn btn-secondary">검색</button></div>
		</div>
	</div>
</div>