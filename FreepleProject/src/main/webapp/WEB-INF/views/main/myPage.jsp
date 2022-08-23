<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		width: 100%;
		text-align: center;
	}
	.header{
		width: 100%;
		height: 20%;
		background-color: #C55A11;
	}
	.body{
		display: flex;
		height: 60%;
	}
	.content{
		width: 60%;
	}
	.leftSideBar,.rightSideBar{
		width: 20%;
		background-color: ED7D31;
	}
	
</style>
<script type="text/javascript">

$(function() {
      $("#imgInput").on('change', function(){
          readURL(this);
      });
  });

  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
              $('#blah').attr('src', e.target.result);
          }

        reader.readAsDataURL(input.files[0]);
      }
  }
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
<jsp:include page="../global/mainTop.jsp"></jsp:include>
<div class="header"></div>
<div class="body">
	<div class="leftSideBar"></div>
	<div class="content">
		<div class="row mt-5 mb-5">
			<div class="col-1">
			<img style="width:100px; height:100px; background: #BDBDBD; border-radius: 70%; overflow: hidden;" id="blah" src="/uploadFiles/${sessionUserInfo.mb_image_link }">
			</div>
			<div class="col-2 text-center">
				<h3>${sessionUserInfo.mb_nick }</h3>
			</div>
			<div class="col"></div>
		</div>
		<div class="row mb-4">
			<div class="col">
				<div class="row ms-3">
					<div class="col"><a href="" style="text-decoration: none; color: black">에너지</a></div>
					<div class="col"><a href="./myCouponListPage" style="text-decoration: none; color: black">쿠폰</a></div>
					<div class="col"><a href="" style="text-decoration: none; color: black">후기</a></div>
					<div class="col"><a href="" style="text-decoration: none; color: black">피드</a></div>
				</div>
			</div>
			<div class="col"></div>	
			<div class="col"></div>
		</div>
		<div class="row">
			<br>
		</div>
		<hr class="cLsnpe">
		<div class="row mt-4 ms-3">
			<div class="col" style="color: rgb(227, 224, 224);">
				내 활동
			</div>
		</div>
		<div class="row mt-4 ms-3">
			<div class="col">
				<a href="./myReservedFreepListPage" class="btn d-grid" style="text-align: left"><strong>참여한 프립</strong></a>
			</div>
		</div>
		<div class="row mt-5 ms-3">
			<div class="col">
				<a href="" class="btn d-grid" style="text-align: left"><strong>친구 초대</strong></a>
			</div>
			<br><br><br>
			<hr>
		</div>
		<div class="row mt-4 ms-3">
			<div class="col" style="color: rgb(227, 224, 224);">
				고객센터
			</div>
		</div>
		<div class="row mt-4 ms-3">
			<div class="col">
				<a href="" class="btn d-grid" style="text-align: left"><strong>공지사항</strong></a>
			</div>
		</div>
		<div class="row mt-5 ms-3">
			<div class="col">
				<a href="" class="btn d-grid" style="text-align: left"><strong>FAQ</strong></a>
			</div>
		</div>
		<div class="row mt-5 ms-3">
			<div class="col">			
				<a href="./askWriteListPage" class="btn d-grid" style="text-align: left;"><strong>고객센터 문의</strong></a>
			</div> 
			<br><br><br>
			<hr>
		</div>
		<div class="row mt-4 ms-3">
			<div class="col" style="color: rgb(227, 224, 224);">
				제휴 및 호스트
			</div>
		</div>
		<div class="row mt-4 ms-3">
			<div class="col">
				<a href="" class="btn d-grid" style="text-align: left"><strong>호스트 지원</strong></a>
			</div>
		</div>
		<div class="row mt-5 ms-3">
			<div class="col">
				<a href="" class="btn d-grid" style="text-align: left"><strong>제휴 및 제안</strong></a>
			</div>
			<br><br><br>
			<hr>
		</div>	
		<div class="row mt-4 ms-3">
			<div class="col" style="color: rgb(227, 224, 224);">
				설정
			</div>
		</div>
		<div class="row mt-4 ms-3">
			<div class="col">
				<a href="" class="btn d-grid" style="text-align: left"><strong>설정</strong></a>
			</div>
		</div>
		<div class="row mt-5 ms-3 mb-3">
			<div class="col">
				<a href="" class="btn d-grid" style="text-align: left"><strong>약관 및 정책</strong></a>
			</div>

				
			버그버ㄱㅂㅈㄱㅂㅈ3252323623626
			
			
			가나다라가나다라마바사
	<div class="rightSideBar"></div>
</div>
		
		
		
				


<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>