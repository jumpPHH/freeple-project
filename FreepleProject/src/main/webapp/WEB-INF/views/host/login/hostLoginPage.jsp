<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<style type="text/css">

.titleText {
    margin-top: 54px;
    font-family: Noto Sans CJK KR;
    font-size: 32px;
    font-style: normal;
    font-weight: 700;
    line-height: 44px;
    letter-spacing: -.5px;
    text-align: left;
}

.subText{
	font-weight: 400;
    color: #999;
    font-family: Noto Sans CJK KR;
    font-size: 14px;
    font-style: normal;
    line-height: 19px;
    letter-spacing: -.5px;
    text-align: left;
}
.subText2 {
    margin-top: 16px;
    font-size: 10px;
    line-height: 14px;
    color: #ccc;
}	

a:link {
  color : black;
  text-decoration: none;
}
a:visited {
  color : black;
  text-decoration: none;
}
a:hover {
  color : red;
  text-decoration: underline;
}
a:active {
  color : green;
  text-decoration: none;
}

</style>
</head>
<body>
	<div style="margin: 0 auto">
		<div class="container-fluid">
			<div class="row">		
				<div class="col-5">
					<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
					  <div class="carousel-inner">
					    <div class="carousel-item active" data-bs-interval="10000">
					      <img src="/freeple/resources/img/hostloginback01.png" class="d-block w-100" style="width:100%; height: 1200px;">
					    </div>
					    <div class="carousel-item" data-bs-interval="2000" >
					      <img src="/freeple/resources/img/hostloginback02.png" class="d-block w-100" style="width:100%; height: 1200px;">
					    </div>
					    <div class="carousel-item">
					      <img src="/freeple/resources/img/hostloginback03.png" class="d-block w-100" style="width:100%; height: 1200px;">
					    </div>
					  </div>
					  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="visually-hidden"></span>
					  </button>
					  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="visually-hidden"></span>
					  </button>
					</div>				
				</div>
				
				<div class="col-2"></div>
				
				<div class="col">
					<div class="row my-5"></div>
					<div class="row my-5"></div>
					<div class="row my-5"></div>
					<div class="row my-5"></div>
					
					<div class="row">
						<div class="col">
							<a href="/freeple/host/center/centerPage"><img src="/freeple/resources/img/benefitBanner.png" style="width: 100%; height: 100px;"></a> 
						</div>
					</div>
					
					<div class="row">
						<div class="col"><h3 class="titleText">로그인</h3></div>
					</div>
					
					<div class="row">
						<div class="col"><p class="subText">환영합니다.<br>로그인을 부탁드려요!</p></div>
					</div>
					
					<div class="row">
						<div class="col">
						
							<form action="/freeple/host/login/loginProcess" method="post">	
							
							<div class="row my-2"><!-- ID -->
								<div class="col">
									<input type="text" name="mb_id" class="form-control" placeholder="아이디">
								</div>
							</div>
							
							<div class="row my-2"><!-- PW -->
								<div class="col">
									<input type="password" name="mb_pw" class="form-control" placeholder="비밀번호"> 
								</div>					
							</div>
							 
							<div class="row mt-3"> 
								<div class="col-3" style="font-size: 13px;"><a href="/freeple/member/login/firstFindIdPage">아이디 찾기</a></div>
								<div class="col-1" style="font-size: 13px;">|</div>
								<div class="col-4" style="font-size: 13px;"><a href="/freeple/member/login/firstFindPwPage">비밀번호 찾기</a></div>
								<div class="col-1" style="font-size: 13px;">|</div>
								<div class="col-3" style="font-size: 13px;"><a href="/freeple/member/signup/acceptPage">회원가입</a></div>						
							</div>
							
							<div class="row mt-3"><!-- 로그인 버튼 -->
								<div class="col d-grid">
									<input type="submit" value="로그인" class="btn btn-primary">
								</div>
							</div>
							
							</form>
						
						</div>
					</div>
					
					<div class="row">
						<div class="col">
							<p class="subText2">Apple 계정은 호스트 관리 페이지를 이용 할 수 없기에 다른 계정 <br>
							 (이메일, 카카오, 페이스북) 방식으로 이용해주세요.</p>
						</div>
					</div>
				</div>	
				
				<div class="col-2"></div>
			</div>
			
							
		
		</div>	
	</div>
	
		

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>