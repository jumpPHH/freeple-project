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
        <form action="./createCafeProcess" method="post" enctype="multipart/form-data">
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

        <div class="row">
            <div class="col"></div>
            <div class="col-10">
            	<div class="row py-4 border-bottom border-balck"><!--카페이미지-->
                    <div class="col-3 p-0 fw-bold fs-4">카페 아이콘</div>
                    <div class="col">
                    	<img class="rounded" style="width:200px; height:200px;" id="blah" src="https://dummyimage.com/200x200/e6d5ed/000000.png&text=Profile+image">
                    	<div class="row pt-3">
                    		<div class="col">
                    			<input class="form-control" type="file" id="imgInp" name="file" multiple accept="image/*">
                    		</div>
                    	</div>
                    </div>
                </div>
                <div class="row py-4 border-bottom border-balck"><!--카페이름-->
                    <div class="col-3 p-0 fw-bold fs-4">카페 이름</div>
                    <div class="col">
                        <input class="form-control form-control-lg" name="cafe_name" type="text" placeholder="카페이름을 입력하세요">
                    </div>
                </div>
                <div class="row py-4 border-bottom border-balck"><!--카페소개글-->
                    <div class="col-3 p-0 fw-bold fs-4">카페 소개</div>
                    <div class="col">
                        <input class="form-control form-control-lg" name="cafeIntroduce_content" type="text" placeholder="만든 카페를 소개해 주세요">
                    </div>
                </div>
                <div class="row py-4 border-bottom border-balck"><!--카페 카테고리-->
                    <div class="col-3 p-0 fw-bold fs-4">카페 주제</div>
                    <div class="col">
                    	<div class="row pb-2">
                    		<div class="col">카페와 관련된 주제를 선택하세요</div>
                    	</div>
                    	<div class="row">
                    		<div class="col">
		                    	<div class="form-floating">
								  <select class="form-select fs-4 p-2" id="floatingSelect" aria-label="Floating label select example">
								    <option selected>주제 선택</option>
								    <option value="1" class="fs-4">아웃도어</option>
								    <option value="2" class="fs-4">피트니스</option>
								    <option value="3" class="fs-4">쿠킹</option>
								    <option value="4" class="fs-4">공예DIV</option>
								    <option value="5" class="fs-4">스포츠</option>
								    <option value="6"class="fs-4">여행</option>
								  </select>
								</div>
                    		</div>
                    	</div>
                    </div>
                </div>
                <div class="row py-4 border-bottom border-balck"><!--가입제한-->
                    <div class="col-3 p-0 fw-bold fs-4">최대 회원 수</div>
                    <div class="col"><input class="form-control form-control-lg" name="cafeMember_limit" type="text" placeholder="ex)100"></div>
                </div>
                <div class="row py-4 border-bottom border-balck">
                	<div class="col-3 p-0 fw-bold fs-4">카페 공개 설정</div>
                	<div class="col p-0 fs-5 ms-2">관리자 승인 후 멤버 가입이 완료되며, 카페를 이용할 수 있습니다</div>
                </div>
            </div>
            <div class="col"></div>
        </div>
        <div class="row pt-3">
            <div class="col"></div>
            <div class="col p-0 d-grid">
                <button type="submit" class="btn btn-lg" style="color: #ab79d1; border: 2px solid #ab79d1;">다음</button>
                <input type="hidden" name="cafeMember_no" value="${sessionUserInfo.mb_no }">
            </div>    
            <div class="col"></div>
        </div>
        </form>
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