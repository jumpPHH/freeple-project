<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프리플 프립 카테고리페이지</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

html {
	margin: 0 auto;
	padding: 0 auto;
	font-family: "맑은 고딕";
}

.freepMainImgOpacity0 {
	filter: opacity(0);
}

.freepMainImgOpacity1 {
	filter: opacity(1);
	-webkit-transition: all 0.8s ease-in-out;
	transition: all 0.8s ease-in-out;
}

.loadingDisappearTarget {
	opacity: 0;
}

figure.snip1132 {
	position: relative;
	overflow: hidden;
	min-width: 100%;
	max-width: 100%;
	max-height: 100%;
	width: 100%;
	background: white;
	text-align: center;
}

figure.snip1132 * {
	-webkit-transition: all 0.1s ease-in-out;
	transition: all 0.1s ease-in-out;
}

figure.snip1132 img {
	max-width: 100%;
	position: relative;
	opacity: 1;
}

figure.snip1132:hover img, figure.snip1132.hover img {
	opacity: 0.35;
	-webkit-transform: scale(1.15);
	transform: scale(1.15);
}

#filter-btn {
	width: auto;
	background-color: #eed9fa;
	color: #4a1761;
	font-size: 1.3em;
	font-weight: bold;
	border: 0;
	float: right;
}

#filter-btn:hover {
	background-color: #bf97d1;
	border: 0;
}

#filter-btn:active {
	outline: 0;
	border: 0;
}

#filterPriceRange {
	float: right;
	text-align: right;
	width: auto;
	padding: 6px;
	margin-right: 3%;
	background-color: #eed9fa;
	font-size: 13pt;
	font-weight: bold;
	border-radius: 5px;
}

#filter-backgroud {
	position: fixed;
	z-index: 1000;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(88, 88, 88, 0.8);
}

#filter-filterShow {
	position: fixed;
	z-index: 1010;
	top: 10%;
	left: 38%;
	width: 24%;
	height: 70%;
	background-color: #fbf5ff;
	border-radius: 20px;
}

input[type='radio'] {
	background-color: white;
	width: 1.4em;
	height: 1.4em;
	border: 1px solid #dda3ff;
	outline: none;
}

input[type='radio']:focus {
	outline: #dda3ff !important;
	border: 7px solid #dda3ff !important;
	box-shadow: none !important;
	background-color: white !important;
}

input[type='radio']:checked {
	background-color: #dda3ff;
	border: 1px solid #dda3ff;
	box-shadow: none;
	outline: none;
}
}
</style>

<script type="text/javascript">
	$(".hover").mouseleave(
		function () {
			$(this).removeClass("hover");
		}
	);
	
	function changeOpacity() {
		$(".loadingDisappearTarget").css('opacity','1');
		//$(".loadingDiv").css('opacity','0');
		var loadingDivList = document.getElementsByClassName('loadingDiv');
		for(var loadingDiv of loadingDivList) loadingDiv.innerHTML="";
		
		$(".tempImg").removeClass("freepMainImgOpacity0");
		$(".tempImg").addClass("freepMainImgOpacity1");
		
	}
	function addClassName_snip1132() {
		$(".tempFigure").addClass("snip1132");
	}
	
	function filterOpen() {
		document.body.style.overflow = "hidden";
		document.getElementById("filter-backgroud").style.visibility="visible";
		document.getElementById("filter-filterShow").style.visibility="visible";
	}
	
	function filterClose() {
		document.body.style.overflow = "visible";
		document.getElementById("filter-backgroud").style.visibility="hidden";
		document.getElementById("filter-filterShow").style.visibility="hidden";
	}
	

	
	window.addEventListener("DOMContentLoaded",function(){
		document.getElementById("filter-backgroud").addEventListener("click",filterClose);
		setTimeout(changeOpacity,1000);
		setTimeout(addClassName_snip1132,1800);
	});
	
</script>

</head>

<body>

	<jsp:include page="../global/mainTop.jsp"></jsp:include>


	<div class="row container-fluid">
		<div class="col"></div>
		<div class="col-7">

			<div class="row">
				<div class="col" style="margin-top: 3em;">

					<div class="row">
						<div class="col">

							<div style="width: 100%;">
								<div style="position: absolute; width: 58.33%">
									<c:choose>
										<c:when test="${freep_ctg_no>0}">
											<!-- 카테고리 눌러서왔을때 or 카테고리에서 정렬했을때 -->
											<span class="fs-3" style="font-weight: bold">${categoryName}</span>
											<span class="fs-4">${numberOfFreep}</span>
										</c:when>
										<c:when test="${searchWord ne ''}">
											<!-- 검색창에서 검색했을때 -->
											<span class="fs-3" style="font-weight: bold">'${searchWord}'</span>
											<span class="fs-4"> 검색결과 ${numberOfFreep}</span>
										</c:when>
									</c:choose>
									<button id="filter-btn" class="btn" onclick="filterOpen()">
										필터 <span style="font-size: 11pt; color: #a8328f"> <c:if
												test="${filterInOrderType eq 'inOrderMoreReview'}">리뷰많은순 </c:if>
											<c:if test="${filterInOrderType eq 'inOrderHigherAvgStar'}">평점높은순 </c:if>
											<c:if test="${filterInOrderType eq 'inOrderHigherPrice'}">가격높은순 </c:if>
											<c:if test="${filterInOrderType eq 'inOrderLowerPrice'}">가격낮은순 </c:if>
											<c:if test="${filterInOrderType eq 'inOrderRecentDate'}">최신등록일순 </c:if>
										</span>
									</button>

								</div>
							</div>

							<!-- 필터(어차피 fixed라 어디있어도 상관없음) -->
							<div id="filter-backgroud" style="visibility: hidden;"></div>
							<div id="filter-filterShow"
								style="visibility: hidden; color: #300057">

								<div style="width: 100%; height: 100%;">
									<div style="width: 100%; height: 10%; padding-top: 5%;">
										<span
											style="margin-left: 10%; font-weight: bolder; font-size: 18pt">필터</span>
										<i class="bi bi-x-lg fs-3"
											style="cursor: pointer; float: right; margin-right: 10%"
											onclick="filterClose()"></i>
										<hr style="background: #dda3ff; height: 5px">
									</div>


									<form class="form-controll" action="./freepListPage"
										method="get" style="width: 100%; height: 100%;">
										<input type="hidden" name="freep_ctg_no"
											value="${freep_ctg_no}"> <input type="hidden"
											name="searchWord" value="${searchWord}">
										<div
											style="width: 100%; height: 72%; padding-left: 14%; padding-right: 14%; padding-bottom: 14%; padding-top: 9%; margin-top: 5%; font-size: 14pt; overflow: auto;">
											<p
												style="font-weight: bolder; margin-bottom: 2em; font-size: 16pt;">정렬</p>

											<div style="width: 100%; margin-bottom: 2em">






												<span>리뷰많은순</span> <span style="float: right;"> <c:if
														test="${filterInOrderType eq 'inOrderMoreReview'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderMoreReview" type="radio" checked="checked">
													</c:if> <c:if test="${filterInOrderType ne 'inOrderMoreReview'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderMoreReview" type="radio">
													</c:if>
												</span>
											</div>
											<div style="width: 100%; margin-bottom: 2em">
												<span>평점높은순</span> <span style="float: right;"> <c:if
														test="${filterInOrderType eq 'inOrderHigherAvgStar'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderHigherAvgStar" type="radio"
															checked="checked">
													</c:if> <c:if
														test="${filterInOrderType ne 'inOrderHigherAvgStar'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderHigherAvgStar" type="radio">
													</c:if>
												</span>
											</div>
											<div style="width: 100%; margin-bottom: 2em">
												<span>가격높은순</span> <span style="float: right;"> <c:if
														test="${filterInOrderType eq 'inOrderHigherPrice'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderHigherPrice" type="radio" checked="checked">
													</c:if> <c:if test="${filterInOrderType ne 'inOrderHigherPrice'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderHigherPrice" type="radio">
													</c:if>
												</span>
											</div>
											<div style="width: 100%; margin-bottom: 2em">
												<span>가격낮은순</span> <span style="float: right;"> <c:if
														test="${filterInOrderType eq 'inOrderLowerPrice'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderLowerPrice" type="radio" checked="checked">
													</c:if> <c:if test="${filterInOrderType ne 'inOrderLowerPrice'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderLowerPrice" type="radio">
													</c:if>
												</span>
											</div>
											<div style="width: 100%; margin-bottom: 2em">
												<span>최신등록일순</span> <span style="float: right;"> <c:if
														test="${filterInOrderType eq 'inOrderRecentDate'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderRecentDate" type="radio" checked="checked">
													</c:if> <c:if test="${filterInOrderType ne 'inOrderRecentDate'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderRecentDate" type="radio">
													</c:if>
												</span>
											</div>

											<hr style="background-color: #dda3ff; height: 3px">


										</div>

										<div
											style="width: 100%; height: 18%; padding-top: 4%; padding-bottom: 9%"
											class="text-center">
											<button class="btn"
												style="width: 75%; height: 100%; background-color: #dda3ff; color: white; font-size: 18pt; font-weight: bold"
												type="submit">적용하기</button>
										</div>
									</form>
								</div>
							</div>
						</div>


					</div>

				</div>
			</div>


			<div class="row">
				<!-- 프립목록 + 페이징 -->
				<div class="col" style="margin-top: 4em">
					<c:if test="${empty freepList}">
						<div class="row" style="margin-bottom: 10em">
							<div class="col text-center fs-3">
								<img src="../resources/img/noResult.jpg">
							</div>
						</div>
					</c:if>

					<c:if test="${not empty freepList}">
						<div class="row" style="height: 30em auto; padding: 0;">
							<!-- 카테고리 인기프립목록 -->
							<div class="col">

								<c:forEach begin="0" end="${numberOfFreepDevideFour-1}" var="i">
									<!-- 프립목록 한줄(4개) -->
									<div class="row" style="margin-bottom: 5em; padding: 0">
										<div class="loadingDiv"
											style="left: 0%; margin-top: 5em; position: absolute; text-align: center;">
											<img src="../resources/img/Pulse-0.8s-114px.gif">
										</div>


										<c:forEach begin="${i*4}" end="${i*4+3}" var="j">
											<!-- 프립 한개 -->
											<div class="col loadingDisappearTarget"
												style="padding: 1%; height: 30em">
												<a
													style="width: 100%; height: 100%; background-color: white; text-decoration: none; color: #4A4247;"
													href="./freepContentPage?freep_no=${freepList[j].fP_FreepVo.freep_no}">
													<!-- 클릭하면 세부 프립 페이지로 이동 --> <c:if
														test="${not empty freepList[j]}">

														<c:if
															test="${empty freepList[j].fP_FreepImageVo.freep_image_link}">
															<div
																style="width: 100%; height: 16.5em; object-fit: cover; overflow: hidden; margin: 0; padding: 0; border-radius: 23px;">
																<img class="freepMainImgOpacity0 tempImg"
																	style="width: 100%; overflow: hidden;"
																	src="../resources/img/noImage.png">
															</div>
														</c:if>
														<!-- 
			1.커지는사진 크기 정사각형 or 그 외부 박스 크기 고정. 아래 글자 안밀려내려가도록
			2.이미지 준비중도 기존 사진크기랑 동일 넘어가면 오버플로우 히든으로
			 -->

														<c:if
															test="${not empty freepList[j].fP_FreepImageVo.freep_image_link}">
															<div
																style="width: 100%; height: 16.5em; overflow: hidden; margin: 0 auto; padding: 0; border-radius: 23px;">
																<!-- 프립이미지div -->
																<!-- <img style="width:100%;height:100%;object-fit:cover;"
											src="/uploadFiles${freepList[j].fP_FreepImageVo.freep_image_link}"> -->

																<figure class="tempFigure">
																	<img class="freepMainImgOpacity0 tempImg"
																		style="width: 100%; height: 16.5em; object-fit: cover; overflow: hidden;"
																		src="/uploadFiles/freep/freepImage/${freepList[j].fP_FreepImageVo.freep_image_link}">
																</figure>

															</div>
														</c:if>
														<div style="margin-left: 5%; margin-right: 5%;">
															<!-- 프립 텍스트 정보 div -->
															<div
																style="font-size: 0.9em; margin-top: 1.5em; color: #a3a3a3">${freepList[j].fP_FreepVo.freep_onoff}</div>
															<div
																style="font-size: 1.3em; font-weight: bold; color: #454545;">${freepList[j].fP_FreepVo.freep_title}</div>
															<div style="width: 100%;">
																<div style="width: 100%">
																	<!-- 별 평점 -->
																	<span
																		style="width: 89.45px; height: 20px; letter-spacing: -5px; position: relative; filter: opacity(0.7) drop-shadow(0 0 0 #d1625a) brightness(1.8); z-index: 9">

																		<span
																		style="width:${freepList[j].avgStarScore/5.0*100}%; height:20px;position:absolute; background-color: white; z-index: 7"></span>

																		<span
																		style="width:${freepList[j].avgStarScore/5.0*100}%; height:20px; overflow:hidden;
													letter-spacing:-5px; white-space:nowrap; text-overflow:clip; position:absolute; 
													color:red; filter: opacity(0.7) drop-shadow(0 0 0 Crimson) brightness(1.8); z-index: 8">
																			<img src="../resources/img/star-fill.png"
																			height="14px"> <img
																			src="../resources/img/star-fill.png" height="14px">
																			<img src="../resources/img/star-fill.png"
																			height="14px"> <img
																			src="../resources/img/star-fill.png" height="14px">
																			<img src="../resources/img/star-fill.png"
																			height="14px">

																	</span> <img src="../resources/img/star-fill.png"
																		height="14px"
																		style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">
																		<img src="../resources/img/star-fill.png"
																		height="14px"
																		style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">
																		<img src="../resources/img/star-fill.png"
																		height="14px"
																		style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">
																		<img src="../resources/img/star-fill.png"
																		height="14px"
																		style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">
																		<img src="../resources/img/star-fill.png"
																		height="14px"
																		style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9">

																	</span> <span
																		style="padding-left: 0.4em; padding-top: 0.2em; position: absolute;">
																		${freepList[j].avgStarScore} </span>
																</div>
																<span style="font-size: 0.9em">후기${freepList[j].numberOfReview}</span>
															</div>


															<hr
																style="width: 100%; height: 1px; margin: 0.6em auto; background-color: #ab79d1; align-content: center;">
															<div style="font-weight: bold; font-size: 1.2em">${freepList[j].priceStringFormat}원</div>
														</div>
														<!-- 
									이게뭘까?
									<svg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'> <path fill='%23FFF' d='M13.24 0c1.517.052 2.713 1.055 2.757 2.279l-.013 13.646-.016 1.55c-.016.126-.093.241-.217.319-.043.027-.092.046-.144.056l-.08.008-2.03-1.361c-4.57-3.048-5.042-3.209-5.355-3.218l-.157.004c-.373.038-1.207.439-7.453 4.717-.084.001-.166-.02-.235-.06-.14-.088-.222-.226-.218-.37l-.013-3.23C.046 10.935.006 6.05.001 3.063L0 2.459C-.008 1.785.308 1.136.88.65 1.324.278 1.916.05 2.546.008L2.756 0H13.24zM2.763 2c-.25 0-.473.078-.588.175-.106.089-.155.165-.17.232L2 2.457l.017 4.385.05 7.691 1.045-.702c3.104-2.07 4.005-2.508 4.867-2.55l.06-.001h.158c.788.022 1.551.36 4.29 2.147l1.503.992.01-8.15L14 2.349l-.01-.015c-.011-.015-.034-.041-.081-.083-.133-.117-.338-.206-.544-.239L13.24 2H2.763z'/> </svg>
									<svg xmlns='http://www.w3.org/2000/svg' width='16' height='18' viewBox='0 0 16 18'> <path fill='%23F66' d='M2.757 0C2.05.002 1.373.236.88.65.308 1.136-.008 1.785 0 2.46c0 4.011.084 12.73.079 15.11-.004.145.078.283.218.371.069.04.151.061.235.06 6.892-4.721 7.195-4.721 7.56-4.721.363 0 .644 0 7.435 4.579.08 0 .16-.023.224-.064.149-.093.23-.241.218-.394.034-1.53.034-10.99.028-14.973.05-1.29-1.179-2.372-2.757-2.427H2.757z'/> </svg>
									 -->
													</c:if>
												</a>
											</div>
										</c:forEach>
									</div>
								</c:forEach>



							</div>

						</div>


						<div class="row">
							<!-- 페이징 -->
							<div class="col">

								<nav aria-label="...">
									<ul class="pagination pagination-lg" style="place-content: center;">


										<!-- previous부분 -->
										<c:if test="${startPage<=1}">
											<li class="page-item disabled"><a class="page-link">Previous</a>
											</li>
										</c:if>
										<c:if test="${startPage>1}">
											<li class="page-item"><a
												href="./freepListPage?searchWord=${searchWord}&freep_ctg_no=${freep_ctg_no}&pageNum=${startPage-1}"
												class="page-link">Previous</a></li>
										</c:if>

										<!-- 페이징 숫자 부분 -->
										<c:forEach begin="${startPage}" end="${endPage}" var="i">
											<c:if test="${i == currentPageNum}">
												<li class="page-item active" aria-current="page"><a
													class="page-link" href="#">${i}</a></li>
											</c:if>
											<c:if test="${i != currentPageNum}">
												<li class="page-item" aria-current="page"><a
													class="page-link"
													href="./freepListPage?searchWord=${searchWord}&freep_ctg_no=${freep_ctg_no}&pageNum=${i}">${i}</a>
												</li>
											</c:if>
										</c:forEach>


										<!-- next부분 -->
										<c:if test="${endPage >= totalPageCount}">
											<li class="page-item disabled"><a class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${endPage < totalPageCount}">
											<li class="page-item"><a
												href="freepListPage?searchWord=${searchWord}&freep_ctg_no=${freep_ctg_no}&pageNum=${endPage+1}"
												class="page-link">Next</a></li>
										</c:if>


									</ul>
								</nav>


							</div>
						</div>
					</c:if>
				</div>
			</div>


		</div>
		<div class="col"></div>

	</div>




	<jsp:include page="../global/mainBottom.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>