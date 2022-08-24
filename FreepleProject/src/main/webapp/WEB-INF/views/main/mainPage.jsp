<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<meta charset="UTF-8">
<title>프리플</title>

<style type="text/css">
	*{
		margin: 0;
		padding: 0;
	}
	.carousel-control-prev-icon{
		margin-left: 15%;
	}
	.carousel-control-next-icon{
		margin-right: 15%;
	}
</style>

<script type="text/javascript">



</script>

</head>
<body>
<jsp:include page="../global/mainTop.jsp"></jsp:include>

<div class="row container-fluid" style="margin: 0 auto; padding: 0 auto">
	<div class="col">
		<div class="row">
			<div class="col"></div>
			<div class="col-7">
			
			  <div class="row">
			  	<div class="col">
			  		<div id="carouselExampleFade" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="3000">
							<img src="../resources/img/bannerImg1.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="3000">
							<img src="../resources/img/bannerImg2.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="3000">
							<img src="../resources/img/bannerImg3.jpg" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				  	</div>
				  </div>
				</div>
				
				<div class="row my-5" style="padding-left: 30px; padding-top: 60px;">
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=1"><img
								src="/freeple/resources/img/category-fitness.webp" 
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 17px; padding-top: 10px;">피트니스</div>
						</div>
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=2"><img
								src="/freeple/resources/img/category-outdoor.webp"
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 17px; padding-top: 10px;">아웃도어</div>
						</div>
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=3"><img
								src="/freeple/resources/img/category-diy.webp"
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 17px; padding-top: 10px;">공예DIY</div>
						</div>
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=4"><img
								src="/freeple/resources/img/category-cooking.webp"
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 35px; padding-top: 10px;">쿠킹</div>
						</div>
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=5"><img
								src="/freeple/resources/img/category-sports.webp"
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 25px; padding-top: 10px;">스포츠</div>
						</div>
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=6"><img
								src="/freeple/resources/img/category-culture.webp"
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 17px; padding-top: 10px;">문화예술</div>
						</div>
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=7"><img
								src="/freeple/resources/img/category-beauty.webp"
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 32px; padding-top: 10px;">뷰티</div>
						</div>
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=8"><img
								src="/freeple/resources/img/category-travel.webp"
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 32px; padding-top: 10px;" >여행</div>
						</div>
						<div class="col">
							<a href="/freeple/freep/freepListPage?freep_ctg_no=9"><img
								src="/freeple/resources/img/category-baking.webp"
								style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
							<div class="row" style="color: rgb(170, 170, 170); font-size: 17px;
    						font-weight: 700; padding-left: 28px; padding-top: 10px;">베이킹</div>
						</div>																																																
					</div>
				
				<div class="row" style="padding-top: 60px;">
						<div class="col-4">
							<b
								style="font-weight: bold; color: black; font-size: inherit; font-size: 23px;">
								MD가 주목하는 프립🔍</b>
								
						</div>
						<div class="col"></div>
						<div class="col-1">
							<a style="font-weight: 500; color: black; font-size: inherit; font-size: 16px; text-decoration: none; margin-top: 30px;">전체보기</a>		
						</div>
					</div>
				
				<div class="row my-5">
						<div class="col">

							<div class="row">
								<img src="/freeple/resources/img/t05.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									마포/서대문/은평 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [언프리티 쿡스타]
									못난이 채소로 만드는 JMT 쿠킹 강습 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기4</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								<div class="row">
									<b
										style="color: rgb(204, 204, 204); font-size: 15px; text-decoration: line-through; padding-left: 15px">69,000원</b>

								</div>
								<div class="col">
									<b
										style="margin: 0px 2px 0px 0px; color: rgb(255, 63, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										20% </b> <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										55,000원</b>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										신규 </span>
								</div>
								<div class="col-5">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										당일 사용 </span>
								</div>
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										ONLY </span>
								</div>
								
							</div>

						</div>


						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t06.jfif"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									영등포/구로 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;">[문래] 은반지 만들기 주얼리 원데이클래스</b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기2</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
							
								
								<div class="col">
									
										<b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										40,000원</b>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										신규 </span>
								</div>


								<div class="col"></div>

							</div>

						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t07.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									마포/서대문/은평</b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [연남동] "나에게 쓰는 편지" 혼자를 위한 소셜클럽</b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기1</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										35,000원</b>
								</div>
							</div>


						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t08.jfif"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									부천/인천 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [인천] 패들보드 : 일상 스트레스 해소, 힐링 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기8</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										40,000원</b>
								</div>
							</div>

						</div>

					</div>
					
			<div class="row my-5" style="padding-top: 20px;">
			  	<div class="col">
			  		<div id="carouselExampleFade" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="3000">
							<img src="../resources/img/mainWeb01.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="3000">
							<img src="../resources/img/mainWeb02.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="3000">
							<img src="../resources/img/mainWeb03.webp" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				  	</div>
				  </div>
				</div>
				
				<div class="row" style="padding-top: 60px;">
						<div class="col-4">
							<b
								style="font-weight: bold; color: black; font-size: inherit; font-size: 23px;">
								방구석 아이돌 데뷔각⭐</b>
								
						</div>
						<div class="col"></div>
						<div class="col-1">
							<a style="font-weight: 500; color: black; font-size: inherit; font-size: 16px; text-decoration: none; margin-top: 30px;">전체보기</a>		
						</div>
					</div>
				
				<div class="row my-5">
						<div class="col">

							<div class="row">
								<img src="/freeple/resources/img/s01.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									마포/서대문/은평 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [홍대,신림] 추가금 없이 원하는 k-pop 골라 배우 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기34</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										50,000원</b>
								</div>
							</div>

						</div>


						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/s02.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									영등포/구로 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;">[마포] 역시 노래는 혜인쌤 원데이, 원포인트 족집게</b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기164</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								<div class="row">
									<b
										style="color: rgb(204, 204, 204); font-size: 15px; text-decoration: line-through; padding-left: 15px">69,000원</b>

								</div>
								<div class="col">
									<b
										style="margin: 0px 2px 0px 0px; color: rgb(255, 63, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										50% </b> <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										20,000원</b>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										가수 </span>
								</div>


								<div class="col"></div>

							</div>

						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/s03.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									마포/서대문/은평</b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [합정] 싱어송라이터에게 배우는 프라이빗 레슨 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기2</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										30,000원</b>
								</div>
							</div>


						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/s04.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									송파/강동 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> 아둥바둥 함께하는 원데이 방송댄스, 릴스! 경력많은 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기23</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								<div class="row">
									<b
										style="color: rgb(204, 204, 204); font-size: 15px; text-decoration: line-through; padding-left: 15px">28,000원</b>

								</div>
								<div class="col">
									<b
										style="margin: 0px 2px 0px 0px; color: rgb(255, 63, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										11% </b> <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										25,000원</b>
								</div>
							</div>

						</div>

					</div>

					<div class="row" style="padding-top: 60px;">
						<div class="col-3">
							<b
								style="font-weight: bold; color: black; font-size: inherit; font-size: 23px;">
								기획전</b>
								
						</div>
						<div class="col"></div>
						<div class="col-1">
							<a style="font-weight: 500; color: black; font-size: inherit; font-size: 16px; text-decoration: none; margin-top: 30px;">전체보기</a>		
						</div>
					</div>
					
					
					<div class="row my-5">
			  	<div class="col">
			  		<div id="carouselExampleFade" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active" data-bs-interval="3000">
							<img src="../resources/img/g01.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="3000">
							<img src="../resources/img/g02.webp" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item" data-bs-interval="3000">
							<img src="../resources/img/g03.webp" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				  	</div>
				  </div>
				</div>
			   	
			   	<div class="row" style="padding-top: 60px;">
						<div class="col-3">
							<b
								style="font-weight: bold; color: black; font-size: inherit; font-size: 23px;">
								주간 베스트💜</b>
								
						</div>
						<div class="col"></div>
						<div class="col-1">
							<a style="font-weight: 500; color: black; font-size: inherit; font-size: 16px; text-decoration: none; margin-top: 30px;">전체보기</a>		
						</div>
					</div>
			   	
			   					<div class="row my-5">
						<div class="col">

							<div class="row">
								<img src="/freeple/resources/img/t01.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									강남/서초 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [특가 매진 임박] 치킨 공짜!! 한강뷰 요트에서 치맥파티 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기28</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								<div class="row">
									<b
										style="color: rgb(204, 204, 204); font-size: 15px; text-decoration: line-through; padding-left: 15px">25,000원</b>

								</div>
								<div class="col">
									<b
										style="margin: 0px 2px 0px 0px; color: rgb(255, 63, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										20% </b> <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										20,000원</b>
								</div>
							</div>

						</div>


						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t02.jfif"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									강원 전체 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;">[양양] 하와이 스멜 뿜뿜~ 서핑하면 로컬서프!</b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기1</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								<div class="row">
									<b
										style="color: rgb(204, 204, 204); font-size: 15px; text-decoration: line-through; padding-left: 15px">700,000원</b>

								</div>
								<div class="col">
									<b
										style="margin: 0px 2px 0px 0px; color: rgb(255, 63, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										90% </b> <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										70,000원</b>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										피크닉 </span>
								</div>


								<div class="col"></div>

							</div>

						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t03.jfif"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									성동/광진</b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> 떠나요 피크닉, 2030 bloom 토크 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기16</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										29,000원</b>
								</div>
							</div>


						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t04.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									송파/강동 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [서울,경기33%할인] 프리다이빙 자격증 따기 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기233</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								<div class="row">
									<b
										style="color: rgb(204, 204, 204); font-size: 15px; text-decoration: line-through; padding-left: 15px">200,000원</b>

								</div>
								<div class="col">
									<b
										style="margin: 0px 2px 0px 0px; color: rgb(255, 63, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										33% </b> <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										135,000원</b>
								</div>
							</div>

						</div>

					</div>
			   		
			   		<div class="row" style="padding-top: 60px;">
						<div class="col-3">
							<b
								style="font-weight: bold; color: black; font-size: inherit; font-size: 23px;">
								밥은 먹고 다니냐🍱</b>
								
						</div>
						<div class="col"></div>
						<div class="col-1">
							<a style="font-weight: 500; color: black; font-size: inherit; font-size: 16px; text-decoration: none; margin-top: 30px;">전체보기</a>		
						</div>
					</div>	
						
					<div class="row my-5">
						<div class="col">

							<div class="row">
								<img src="/freeple/resources/img/t08.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									마포/서대문/은평 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> 지니아빠의 존맛탱 파스타 만들기!! </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기15</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">

								<div class="col">
										<b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										22,500원</b>
								</div>
							</div>

						</div>


						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t09.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									강서/금천/양천 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;">퇴근하고, 요리하고, 집밥 먹자! (예약 가능)</b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기1</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">

								<div class="col">
										<b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										59,000원</b>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										수제 </span>
								</div>


								<div class="col"></div>

							</div>

						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t10.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									영등포/구로</b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [서울] 다이닝파티 닭갈비&치즈볶음밥편 </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기10</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										27,000원</b>
								</div>
							</div>


						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t11.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									영등포/구로 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> 한식 제대로 배우기 [원모어트립] 칼질부터!!</b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기33</b>
								</div>
							</div>

							
							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										55,000원</b>
								</div>
							</div>
							

						</div>

					</div>
			   		
			   					   		
			   		<div class="row" style="padding-top: 60px;">
						<div class="col-3">
							<b
								style="font-weight: bold; color: black; font-size: inherit; font-size: 23px;">
								매거진</b>
								
						</div>
						<div class="col"></div>
						<div class="col-1">
							<a style="font-weight: 500; color: black; font-size: inherit; font-size: 16px; text-decoration: none; margin-top: 30px;">전체보기</a>		
						</div>
					</div>
					
					
					<div class="row my-5">
						<div class="col">
							<div class="card" style="width: 21rem;">
							  <img src="/freeple/resources/img/product_banner_1.webp" class="card-img-top" >
							  <div class="card-body">
									<h5 class="card-title"
										style="margin-bottom: 10px; height: 29px; line-height: normal; font-size: 20px; font-weight: bold; width: 100%;">8월엔
										춤.신.춤.왕!</h5>
									<p class="card-text"
										style="margin-bottom: 10px; height: 29px; line-height: normal; font-size: 15px; font-weight: bold; width: 100%;">(8월)
										언제나 #프립과몰입!</p>

								</div>
							</div>
						</div>
						
						<div class="col">
							<div class="card" style="width: 21rem;">
							  <img src="/freeple/resources/img/product_banner_2.webp" class="card-img-top" >
							  <div class="card-body">
									<h5 class="card-title"
										style="margin-bottom: 10px; height: 29px; line-height: normal; font-size: 20px; font-weight: bold; width: 100%;">8월엔
										여름에 하기 좋은 성향</h5>
									<p class="card-text"
										style="margin-bottom: 10px; height: 29px; line-height: normal; font-size: 15px; font-weight: bold; width: 100%;">(8월)
										요즘 핫한 취미 클래스 BEST 6</p>

								</div>
							</div>
						</div>
						
						<div class="col">
							<div class="card" style="width: 21rem;">
							  <img src="/freeple/resources/img/product_banner_3.webp" class="card-img-top" >
							  <div class="card-body">
									<h5 class="card-title"
										style="margin-bottom: 10px; height: 29px; line-height: normal; font-size: 20px; font-weight: bold; width: 100%;">8월엔
										핫플 성지 성수동 데이트</h5>
									<p class="card-text"
										style="margin-bottom: 10px; height: 29px; line-height: normal; font-size: 15px; font-weight: bold; width: 100%;">(8월)
										성수동 핫해도 너무 핫해~</p>

								</div>
							</div>
						</div>
					</div>
						
					<div class="row" style="padding-top: 60px;">
						<div class="col-3">
							<b
								style="font-weight: bold; color: black; font-size: inherit; font-size: 23px;">
								신규 프립</b>
								
						</div>
						<div class="col"></div>
						<div class="col-1">
							<a style="font-weight: 500; color: black; font-size: inherit; font-size: 16px; text-decoration: none; margin-top: 30px;">전체보기</a>		
						</div>
					</div>
					
					<div class="row my-5">
						<div class="col">

							<div class="row">
								<img src="/freeple/resources/img/t12.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									마포/서대문/은평 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> 추석 송편&화과자 비누 클래스 가자!! </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기5</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">

								<div class="col">
										<b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										50,000원</b>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										신규 </span>
								</div>


								<div class="col"></div>

							</div>

						</div>


						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t13.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									강남/서초 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;">[서울/서초]버블 테라피 With 아몬드</b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기3</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">

								<div class="col">
										<b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										35,000원</b>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										신규 </span>
								</div>


								<div class="col"></div>

							</div>

						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t14.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									전라 전체</b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> 못난이 복숭아의 달콤한 변신 하기!! </b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기1</b>
								</div>
							</div>

							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										15,000원</b>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										신규 </span>
								</div>


								<div class="col"></div>

							</div>


						</div>


						
						<div class="col" style="padding-left: 20px;">

							<div class="row">
								<img src="/freeple/resources/img/t15.webp"
									style="border-radius: 10px; width: 100%; height: 100%; object-fit: cover;">
							</div>

							<div class="row my-2">
								<b
									style="color: rgb(119, 119, 119); font-size: 13px; font-weight: 600;">
									강남/서초 </b>
							</div>

							<div class="row my-2">
								<b style="font-weight: 600; font-size: 18px;"> [서울/청계산]헬시 버블 청계산행 !!!!</b>
							</div>

							<div class="row my-4">
								<div class="col">
									<img style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <img
										style="width: 20px; height: 20px; margin: 0; padding: 0;"
										src="/freeple/resources/img/mainStar.svg"> <b
										style="padding-left: 10px;">후기2</b>
								</div>
							</div>

							
							<div class="row my-5">					
								<div class="col">
									<hr style="background-color: #dda3ff; height: 2px;">
								</div>
							</div>

							<div class="row my-5">
								
								<div class="col">
									 <b
										style="color: rgb(51, 51, 51); font-size: 20px; font-weight: 700; line-height: 22px;">
										45,000원</b>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<span
										style="padding: 6px 8px; font-size: 15px; font-weight: 700; line-height: 14px; border-radius: 5px; color: rgb(255, 63, 51); background-color: rgb(244, 244, 244);">
										신규 </span>
								</div>


								<div class="col"></div>

							</div>
							

						</div>

					</div>	
						
 			 	<div class="row my-5" style="padding-top: 50px;">
					
					<a href="../host/center/hostCenterPage">
							<img style="width: 100%; height: 180px;" src="/freeple/resources/img/freepHost.png">
						</a>
				</div> 

			</div>
			<div class="col"></div>
		</div>
	</div>
</div>
<br><br><br>
okok
<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>