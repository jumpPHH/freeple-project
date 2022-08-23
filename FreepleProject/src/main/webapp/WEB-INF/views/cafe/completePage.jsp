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
        <div class="row border-bottom border-balck py-4">
            <div class="col ">
            	<div class="row pt-2 pb-3">
            		<div class="col text-center fs-2 fw-bold ">카페 만들기</div>
            		<div class="col"></div>
            		<div class="col"></div>
            	</div>
            	<div class="row py-2">
            		<div class="col text-center">나와 같은 관심사를 가진 멤버를 모집하고 열심히 운영하여 카페를 성장시켜 보세요</div>
            	</div>
            </div>
        </div>

       	<form action="./addcafeMemberProcess" method="get">        
        <div class="row">
            <div class="col"></div>

            <div class="col-10">
                <div class="row py-3 fs-5">
                    <div class="col">카페 활동을 위한 닉네임을 만들어주세요.</div>
                </div>
                <div class="row py-4 border-bottom border-balck">
                    <div class="col-3 p-0 fw-bold fs-4">카페 닉네임</div>
                    <div class="col">
                        <input class="form-control form-control-lg" name="cafeMember_nickname" type="text" placeholder="카페주인장">
                    </div>
                </div>
                <div class="row pt-3">
                    <div class="col"></div>
                    <div class="col p-0 d-grid">
                        <button type="submit" class="btn btn-lg" style="color: #ab79d1; border: 2px solid #ab79d1;">생성하기</button>
                        <input type="hidden" name="mb_no" value="${sessionUserInfo.mb_no}">
                        <input type="hidden" name=cafe_grade value="1">
                        <input type="hidden" name="cafe_no" value="${cafeVo.cafe_no}">
                    </div>
                    <div class="col"></div>
                </div>
            </div>
           
            <div class="col"></div>
        </div>
       </form>
       
    </div>
    
    <div class="col"></div><!--여백-->
</div>



<!-- ㅈㅣ우면 안됨 -->	 
</div>
</div>	
<br><br><br>
<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>