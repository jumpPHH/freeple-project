<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="col"><!--네비바-->
					<jsp:include page="./global/leftSideBar.jsp"></jsp:include>	
                </div>
                <div class="col-10"><!--본문-->
                    <div class="row py-5"> 
                        <div class="col text-center fs-2">
                            가입요청이 완료되었습니다.
                        </div>
                    </div>
                    <div class="row pt-2 pb-2">
                    	<div class="col fs-5 text-center">
                    		카페관리자가 가입을 승인하면 회원가입이 완료되며, 카페를 이용할 수 있습니다
                    	</div>
                    </div>
                    <div class="row py-4">
                    	<div class="col"></div>
                        <div class="col-6 d-grid">
                            <a class="btn btn-outline-secondery btn-lg" href="./cafePage?cafe_no=${cafeVo.cafe_no}" role="button">카페홈으로</a>
                        </div>
                        <div class="col"></div>
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