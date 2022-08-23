<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프립 상세 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
	
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	
<link rel="stylesheet"
	href="/freeple/resources/css/freepContentPage.css">
	



<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
	var userNo = 0;
	var freep_no = ${fp_FreepVo.freep_no};

	function getUserNo(){
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); 
				
				if(jsonObj.result == 'success'){
					userNo = jsonObj.data; 
				}
			}
		}
		
		xhr.open("get" , "../member/login/getUserNo" , false); 
		xhr.send(); 			
	}
	function doFreepReviewLike(target) {
	
		var review_no = $(target).next().text();
		
		if(userNo == 0){
			var result = confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?");
			if(result == true){
				location.href = "../member/login/loginPage";
			}
			return;
		}
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);
					
				refreshReviewLike();
				refreshCountReviewLikeByFreepNo();
			}
		}
		
		xhr.open("post" , "./doFreepReviewLike"); 
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("review_no=" + review_no +"&freep_no=" + freep_no);
		
		
	}
	
	function refreshReviewLike(){
		if(userNo == 0) return;
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				
				var jsonObj = JSON.parse(xhr.responseText); 
				
				var reviewLikeBox = document.getElementsByClassName("reviewLike");
				
				
				for (var i = 0; i < reviewLikeBox.length; i++) {
					
					if(jsonObj.likePushOX[i] == true){
						
						reviewLikeBox[i].setAttribute("class" , "reviewLike bi bi-heart-fill text-danger");
					}else{
						reviewLikeBox[i].setAttribute("class" , "reviewLike bi bi-heart text-danger");
					}			
				}
					
			}
		}
		
		xhr.open("get" , "./isReviewLiked?freep_no=" + freep_no); 
		xhr.send();			
	}
	

	function refreshCountReviewLikeByFreepNo(){
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); 
				var count = jsonObj.count;
				var countSize = jsonObj.countSize;
				
				var totalReviewLikeCountBox = document.getElementsByClassName("reviewlikeCount");
				
				
				for (var i = 0; i < countSize; i++) {
					totalReviewLikeCountBox[i].innerText = count[i];
				}
			}
		}
		
		xhr.open("get" , "./getCountReviewLikeByFreepNo?freep_no=" + freep_no); 
		xhr.send(); 	
	}
	
	window.addEventListener("DOMContentLoaded" , function (){
		
		getUserNo(); 
		refreshReviewLike();
		refreshCountReviewLikeByFreepNo();
		
	});
	

</script>

</head>
<body>
	<jsp:include page="../global/mainTop.jsp"></jsp:include>
	<jsp:include page="./freepJoinModal.jsp"></jsp:include>

	<div style="margin: 0 auto;">
		<div class="container-fluid">
			<div class="row">

				<div class="col-2"></div>

				<div class="col">

					<div class="row my-5">
						<div class="col">
							<c:if test="${empty freepImageList}">
								<img src="../resources/img/noImage.png">
							</c:if>
							<c:if test="${not empty freepImageList}">

								<div id="carouselExampleControls" class="carousel slide"
									data-bs-ride="carousel"
									style="width: 100%; max-width: 500px;">

									<div class="carousel-inner">
										<div class="carousel-item active">
											<img
												src="/uploadFiles/freep/freepImage/${freepImageList[0].freep_image_link}"
												class="d-block w-100" alt="...">
										</div>
										<c:forEach begin="1" end="${freepImageList.size()-1}" var="i">
											<div class="carousel-item">
												<img
													src="/uploadFiles/freep/freepImage/${freepImageList[i].freep_image_link}"
													class="d-block w-100" alt="...">
											</div>
										</c:forEach>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleControls" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleControls" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>

							</c:if>
						</div>

						<div class="col">

							<div class="row">
								<div class="col">
									<span style="font-size: 20pt;" class="cWsrnE">${fp_FreepVo.freep_title}</span>
								</div>
							</div>

							<div class="row my-2">
								<div class="col">
									<span class="iRfDsw">${priceStringFormat} <span
										class="kWprXL">원</span>
									</span>
								</div>
							</div>

							<div class="row my-5"></div>
							<div class="row my-5"></div>
							<div class="row my-5"></div>
							<div class="row my-5"></div>
							<div class="row my-5"></div>
							
							<div class="row">

								<div class="col-2 jFAUTZ"
									style="padding-top: 20px; padding-bottom: 20px;">
									<a
										href="./freepHostProfilePage?freep_no=${fp_FreepVo.freep_no}"><img
										src="/uploadFiles/${hostInfo.mb_image_link }"
										style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;"></a>
								</div>

								<div class="col-6 jYAYJP jFAUTZ"
									style="padding-top: 40px; padding-bottom: 20px; text-align: left; padding-top: 10px;">
									<a
										href="./freepHostProfilePage?freep_no=${fp_FreepVo.freep_no}"
										style="color: black; text-decoration-line: none;">${hostInfo.mb_nick }
										〉</a> <img src="/freeple/resources/img/superHost.svg"
										style="padding-top: 15px; padding-bottom: 20px;">

									<div class="row cUDkmC" style="padding-left: 5px;">
										<div class="col">프립 3| 후기 1041| 저장 419</div>
									</div>
								</div>

								<div class="col-1 jFAUTZ"
									style="padding-top: 20px; padding-bottom: 20px;">
									<img src="/freeple/resources/img/hostProfileBookmark.svg"
										style="padding-top: 10px;">
								</div>

					


							</div>
						</div>

					</div>

					<div class="row my-3">
						
						<div class="col-3" style="padding-left: 0px;">
							<span
								style="width: 89.45px; height: 20px; letter-spacing: -5px; position: relative; filter: opacity(0.7) drop-shadow(0 0 0 #d1625a) brightness(1.8); z-index: 9">

								<span 
								style="width:${freepReviewDataList[0].avgStarScore/5.0*100}%; height:20px;position:absolute; background-color: white; z-index: 7"></span>

								<span 
								style="width:${freepReviewDataList[0].avgStarScore/5.0*100}%; height:20px; overflow:hidden;
													letter-spacing:-5px; white-space:nowrap; text-overflow:clip; position:absolute; 
													color:red; filter: opacity(0.7) drop-shadow(0 0 0 Crimson) brightness(1.8); z-index: 8">
									<img src="../resources/img/star-fill.png" height="14px">
									<img src="../resources/img/star-fill.png" height="14px">
									<img src="../resources/img/star-fill.png" height="14px">
									<img src="../resources/img/star-fill.png" height="14px">
									<img src="../resources/img/star-fill.png" height="14px">

							</span> <img src="../resources/img/star-fill.png" height="14px"
								style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">
								<img src="../resources/img/star-fill.png" height="14px"
								style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">
								<img src="../resources/img/star-fill.png" height="14px"
								style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">
								<img src="../resources/img/star-fill.png" height="14px"
								style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">
								<img src="../resources/img/star-fill.png" height="14px"
								style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">

							</span> <span
								style="padding-left: 0.4em; padding-top: 0.2em; position: absolute; font-weight: bold;">
								${freepReviewDataList[0].avgStarScore} 
						
								</span>
								<span
								style="font-size: 8px; color: rgb(119, 119, 119); padding-left: 35px;">●</span>
								<span
								style="font-size: 15px; vertical-align: sub; padding-left: 5px; color: rgb(119, 119, 119); font-weight: bold;">${reviewCount}
								개후기</span>  
						</div>
						
					</div>

					<div class="row">
						
						<div class="col-4"
							style="color: rgb(51, 51, 51); font-size: 18px; line-height: 26px; letter-spacing: -0.54px; padding-left: 0px; font-weight: bold;">
							경험한 대원의 ${freepReviewDataList[0].avgStarScore/5.0*100}%가 ${freepReviewDataList[0].avgStarScore}점을 줬어요!</div>
					
					</div>

					<div class="row my-5">
						
						<div class="col-10"
							style="background-color: rgb(250, 250, 250); width: 100%; padding-left: 30px; padding-top: 30px;">

							<c:if test="${freepReviewDataList.size() > 0}">
								<div id="carouselExampleControlsNoTouching"
									class="carousel slide carousel-dark" data-bs-touch="false">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<div class="row">

												<c:forEach begin="0" end="${freepReviewDataList.size()-1}"
													var="i">
													<c:if test="${i <= 2}">
														<div class="col">
															<div class="card"
																style="width: 24rem; padding: 0; margin: 0;">

																<img
																	src="/uploadFiles/freep/freepImage/${freepReviewDataList[i].freepReviewImgThumbnail.review_image_link}"
																	class="card-img-top" alt="..." />

																<div class="card-body">
																	<div class="col">

																		<img
																			src="/uploadFiles/${freepReviewDataList[i].freepReviewList.mb_image_link }"
																			style="width: 50px; height: 50px; border-radius: 70%; overflow: hidden;">

																		<b
																			style="font-size: 15px; color: rgb(51, 51, 51); padding-left: 10px;">${freepReviewDataList[i].freepReviewList.mb_nick }</b>
																	</div>

																	<p class="card-text cWsrnE"
																		style="font-weight: bold; font-size: 15px; color: rgb(51, 51, 51); padding-top: 20px;">
																		${freepReviewDataList[i].freepReviewList.comment_content }</p>
																	<i class="reviewLike bi bi-heart text-danger"
																		onclick="doFreepReviewLike(this)"></i>
																	<div hidden="hidden" class="review_no">${freepReviewDataList[i].freepReviewList.review_no}</div>
																	<span class="reviewlikeCount"></span>
																</div>
															</div>
														</div>
													</c:if>
												</c:forEach>

											</div>
										</div>
										<div class="carousel-item">
											<div class="row">

												<c:forEach begin="3" end="${freepReviewDataList.size()-1}"
													var="i">
													<c:if test="${i <= 5}">
														<div class="col">
															<div class="card"
																style="width: 24rem; padding: 0; margin: 0;">

																<img
																	src="/uploadFiles/freep/freepImage/${freepReviewDataList[i].freepReviewImgThumbnail.review_image_link}"
																	class="card-img-top" alt="..." />

																<div class="card-body">
																	<div class="col">

																		<img
																			src="/uploadFiles/${freepReviewDataList[i].freepReviewList.mb_image_link }"
																			style="width: 50px; height: 50px; border-radius: 70%; overflow: hidden;">

																		<b
																			style="font-size: 15px; color: rgb(51, 51, 51); padding-left: 10px;">${freepReviewDataList[i].freepReviewList.mb_nick }</b>
																	</div>

																	<p class="card-text cWsrnE"
																		style="font-weight: bold; font-size: 15px; color: rgb(51, 51, 51); padding-top: 20px; text-overflow: ellipsis">
																		${freepReviewDataList[i].freepReviewList.comment_content }</p>
																	<i class="reviewLike bi bi-heart text-danger"
																		onclick="doFreepReviewLike(this)"></i>
																	<div hidden="hidden" class="review_no">${freepReviewDataList[i].freepReviewList.review_no}</div>
																	<span class="reviewlikeCount"></span>
																</div>
															</div>
														</div>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleControlsNoTouching"
										data-bs-slide="prev"
										style="height: 100px; margin: auto; margin-left: -85px;">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleControlsNoTouching"
										data-bs-slide="next"
										style="height: 100px; margin: auto; margin-right: -65px;">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</c:if>
							<div
								style="font-weight: bold; color: blue; font-size: 18px; text-align: center; padding-top: 80px; padding-bottom: 30px;">
								<c:if test="${not empty sessionUserInfo }">
								<a href="./freepReviewListPage?freep_no=${fp_FreepVo.freep_no}"
									style="text-decoration-line: none;">${reviewCount}개 후기 더보기 ></a>
								</c:if>
								<c:if test="${empty sessionUserInfo }"></c:if>
							</div>
						</div>
						
					</div>

					<div class="row my-5" style="padding-bottom: 50px;">
						
						<div class="col">
							<h4 class="bZNoYF">프립 정보</h4>
						</div>
						
					</div>

					<div class="row my-5" style="padding-bottom: 50px;">
						
						<div class="col-2 bremOa">
							<h4 class="bZNoYF">프립 소개</h4>
						</div>
						<div class="col-7 bremOa"></div>
					
					</div>

					<div class="row my-5">
						
						<div class="col"
							style="font-weight: bold; text-align: center; padding-bottom: 50px; border-bottom: 1px solid rgb(238, 238, 238);">
							${fp_FreepVo.freep_content }
							
							<div class="row">
							<div class="col-1"></div>
							
							<div class="col">
													<c:forEach begin="0" end="${freepImageList.size()-1}" var="i">

								<img
									src="/uploadFiles/freep/freepImage/${freepImageList[i].freep_image_link}"
								
									style="width: 700px; height: 540px; padding-top: 50px;">

							</c:forEach>
							</div>

							<div class="col-1"></div>
						</div>
						</div>
						
					
					</div>

					<div class="row my-5" style="padding-bottom: 50px;">
						
						<div class="col">
							<h4 class="bZNoYF">진행하는 장소</h4>
						</div>
						
					</div>

					<div class="row my-5">
						
						<div class="col">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.793095414915!2d126.87631921564743!3d37.53637433361191!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9e9825bc27f7%3A0x6662bd7a5253af53!2z7Jqw7ISx7JeQ7Y6g7YOA7Jq0!5e0!3m2!1sko!2skr!4v1613310853103!5m2!1sko!2skr"
								width="100%" height="450px;" frameborder="0" style="border: 0;"
								allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
						</div>
						
					</div>

					<div class="row my-5" style="padding-top: 50px;">
					
						<div class="col" style="border-top: 1px solid rgb(238, 238, 238);">
							<h4 class="bZNoYF"
								style="padding-top: 50px; padding-bottom: 50px;">프립 태크</h4>
							<span class="jXxsiv" style="font-weight: bold;">${fp_FreepVo.freep_tag}</span>
						</div>
					
					</div>

					<div class="row my-5"
						style="padding-bottom: 50px; padding-top: 50px;">
					
						<div class="col">
							<h5
								style="border-top: 1px solid rgb(238, 238, 238); padding-top: 80px;">
								<a href="..">1:1문의</a>
							</h5>
							<h5
								style="border-top: 1px solid rgb(238, 238, 238); padding-top: 20px;">
								<a href="..">유의 사항</a>
							</h5>
							<h5
								style="border-top: 1px solid rgb(238, 238, 238); padding-top: 20px;">
								<a href="..">환불정책</a>
							</h5>
						</div>
					
					</div>

					<div class="row my-5" style="padding-top: 50px;">
						
						<div class="col" style="border-top: 1px solid rgb(238, 238, 238);">
							<h4 class="bZNoYF"
								style="padding-top: 50px; padding-bottom: 50px;">이런 프립 어때요?</h4>
						</div>
					
					</div>

					<div class="row my-5" style="padding-bottom: 120px;">
						
						<div class="col">
							<img
								style="display: initial; border-radius: 0px; width: 100%; height: 200px; object-fit: cover;"
								src="../resources/img/product01.webp">
							<h6
								style="margin: 0px 0px 3px; color: rgb(119, 119, 119); font-size: 10px; font-weight: 600; line-height: 14px;">영등포/구로</h6>
							<p
								style="color: rgb(51, 51, 51); font-size: 12px; font-weight: 600; line-height: 16px; word-break: keep-all; overflow-wrap: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical;">[영등포]
								영등포구청역 yogaG 요가 스튜디오</p>
						</div>
						<div class="col">
							<img
								style="display: initial; border-radius: 0px; width: 100%; height: 200px; object-fit: cover;"
								src="../resources/img/product02.webp">
							<h6
								style="margin: 0px 0px 3px; color: rgb(119, 119, 119); font-size: 10px; font-weight: 600; line-height: 14px;">성동/광진</h6>
							<p
								style="color: rgb(51, 51, 51); font-size: 12px; font-weight: 600; line-height: 16px; word-break: keep-all; overflow-wrap: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical;">
								[성수] 체형교정 & 코어강화 필라테스/요가 (소규모) (예약 가능)</p>
						</div>
						<div class="col">
							<img
								style="display: initial; border-radius: 0px; width: 100%; height: 200px; object-fit: cover;"
								src="../resources/img/product03.webp">
							<h6
								style="margin: 0px 0px 3px; color: rgb(119, 119, 119); font-size: 10px; font-weight: 600; line-height: 14px;">강남/서초</h6>
							<p
								style="color: rgb(51, 51, 51); font-size: 12px; font-weight: 600; line-height: 16px; word-break: keep-all; overflow-wrap: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical;">
								[강남] 힐링 런치 요가 (소규모) (예약 가능)</p>
						</div>
						<div class="col">
							<img
								style="display: initial; border-radius: 0px; width: 100%; height: 200px; object-fit: cover;"
								src="../resources/img/product04.webp">
							<h6
								style="margin: 0px 0px 3px; color: rgb(119, 119, 119); font-size: 10px; font-weight: 600; line-height: 14px;">노원/강북/도봉/중랑</h6>
							<p
								style="color: rgb(51, 51, 51); font-size: 12px; font-weight: 600; line-height: 16px; word-break: keep-all; overflow-wrap: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical;">
								[노원] 한밤에 중랑천에서 즐기는 요가 #다이어트 #</p>
						</div>
						<div class="col">
							<img
								style="display: initial; border-radius: 0px; width: 100%; height: 200px; object-fit: cover;"
								src="../resources/img/product05.webp">
							<h6
								style="margin: 0px 0px 3px; color: rgb(119, 119, 119); font-size: 10px; font-weight: 600; line-height: 14px;">경상
								전체</h6>
							<p
								style="color: rgb(51, 51, 51); font-size: 12px; font-weight: 600; line-height: 16px; word-break: keep-all; overflow-wrap: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical;">
								브레인요가 & 명상 (예약 가능)</p>
						</div>
						<div class="col">
							<img
								style="display: initial; border-radius: 0px; width: 100%; height: 200px; object-fit: cover;"
								src="../resources/img/product06.webp">
							<h6
								style="margin: 0px 0px 3px; color: rgb(119, 119, 119); font-size: 10px; font-weight: 600; line-height: 14px;">제주시</h6>
							<p
								style="color: rgb(51, 51, 51); font-size: 12px; font-weight: 600; line-height: 16px; word-break: keep-all; overflow-wrap: break-word; overflow: hidden; text-overflow: ellipsis; -webkit-line-clamp: 2; display: -webkit-box; -webkit-box-orient: vertical;">
								[제주] 푸르메가 살고 있는 곳, 요가 스튜디오 (예약 가능)</p>
						</div>
					
					</div>

				</div>

				<div class="col-2"></div>

			</div>
		</div>
	</div>


	<jsp:include page="../global/freepContentBottomButton.jsp"></jsp:include>

	<jsp:include page="../global/mainBottom.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>