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
						<div class="row fs-3 fw-bold py-4">
							<div class="col text-center"><i class="bi bi-info-circle"></i>&nbsp;카페 정원이 초과되었습니다.</div>
						</div>
						<div class="row py-2">
							<div class="col fs-5 text-center">정원이 초과하여 가입하실 수 없습니다. 다른 카페를 이용해 주세요!</div>
						</div>
						<div class="row pt-5">
							<div class="col"></div>
							<div class="col-6 d-grid"><a href="./cafeListPage" class="btn" type="button" style="background-color: #ab79d1; color: white;">카페 목록으로</a></div>
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

<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>