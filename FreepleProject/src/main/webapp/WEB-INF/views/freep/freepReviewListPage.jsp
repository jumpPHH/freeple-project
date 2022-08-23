<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="/freeple/resources/css/freepReviewListPage.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<script type="text/javascript">
	function filterOpen() {
		document.body.style.overflow = "hidden";
		document.getElementById("filter-backgroud").style.visibility = "visible";
		document.getElementById("filter-filterShow").style.visibility = "visible";
	}

	function filterClose() {
		document.body.style.overflow = "visible";
		document.getElementById("filter-backgroud").style.visibility = "hidden";
		document.getElementById("filter-filterShow").style.visibility = "hidden";
	}

	var userNo = 0;
	var freep_no = $
	{
		fp_FreepVo.freep_no
	};

	function getUserNo() {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);

				if (jsonObj.result == 'success') {
					userNo = jsonObj.data;
				}
			}
		}

		xhr.open("get", "../member/login/getUserNo", false);
		xhr.send();
	}
	function doFreepReviewLike(target) {

		var review_no = $(target).next().text();

		if (userNo == 0) {
			var result = confirm("로그인 후 이용가능합니다. 로그인 하시겠습니까?");
			if (result == true) {
				location.href = "../member/login/loginPage";
			}
			return;
		}

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);

				refreshReviewLike();
				refreshCountReviewLikeByFreepNo();
			}
		}

		xhr.open("post", "./doFreepReviewLike");
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send("review_no=" + review_no + "&freep_no=" + freep_no);

	}

	function refreshReviewLike() {
		if (userNo == 0)
			return;

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {

				var jsonObj = JSON.parse(xhr.responseText);

				var reviewLikeBox = document
						.getElementsByClassName("reviewLike");

				for (var i = 0; i < reviewLikeBox.length; i++) {

					if (jsonObj.likePushOX[i] == true) {

						reviewLikeBox[i].setAttribute("class",
								"reviewLike bi bi-heart-fill text-danger");
					} else {
						reviewLikeBox[i].setAttribute("class",
								"reviewLike bi bi-heart text-danger");
					}
				}

			}
		}

		xhr.open("get", "./isReviewLiked?freep_no=" + freep_no);
		xhr.send();
	}

	function refreshCountReviewLikeByFreepNo() {

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				var count = jsonObj.count;
				var countSize = jsonObj.countSize;

				var totalReviewLikeCountBox = document
						.getElementsByClassName("reviewlikeCount");

				for (var i = 0; i < countSize; i++) {
					totalReviewLikeCountBox[i].innerText = count[i];
				}
			}
		}

		xhr.open("get", "./getCountReviewLikeByFreepNo?freep_no=" + freep_no);
		xhr.send();
	}

	function zoomIn(event) {
		event.target.style.width = "300px";
		event.target.style.height = "300px";
		event.target.style.transition = "all 1.0s";
	}

	function zoomOut(event) {
		event.target.style.width = "100px";
		event.target.style.height = "100px";
		event.target.style.transition = "all 1.0s";
	}


	
	function freepReviewReply(target) {
		
		var freep_no = ${fp_FreepVo.freep_no};
		var review_no = $(target).next().text();
		var mb_no = $(target).next().next().text();
		var commentValue = document.getElementById("commentInput").value;
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); 
				
				document.getElementById("commentInput").value = "";	
				
				
			}
		}
		
		xhr.open("post" , "./freepReviewReply"); 
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		xhr.send("review_no=" + review_no +
				"&freep_no=" + freep_no +
				"&mb_no=" + mb_no +
				"&comment_content=" + commentValue); 
				
		var freepReviewReplyRegisterBox = document.getElementById("freepReviewReplyRegister");
		
		freepReviewReplyRegisterBox.innerText = "답글 등록완료";

	}

	window.addEventListener("DOMContentLoaded", function() {

		getUserNo();
		refreshReviewLike();
		refreshCountReviewLikeByFreepNo();
		freepReviewReply(target);
	});
</script>
<body>
	<jsp:include page="../global/mainTop.jsp"></jsp:include>

	<div style="margin: 0 auto;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-2"></div>
				<div class="col">
					<div class="row my-5">
						<div class="col-2 cWpPOd">후기 ${reviewCount} 개</div>
						<div class="col"></div>
						<div class="col-2 d-grid gap-2 mx-auto">
							<button type="button" class="btn btn-light btn-lg"
								onclick="filterOpen()"
								style="font-size: 20px; font-weight: bold; border: 1px solid black; margin-right: 20px">
								필터<i class="bi bi-caret-down"></i>
							</button>

							<div id="filter-backgroud" style="visibility: hidden;"></div>
							<div id="filter-filterShow"
								style="visibility: hidden; color: #300057">

								<div style="width: 100%; height: 100%;">
									<div style="width: 100%; height: 10%; padding-top: 5%;">
										<span
											style="margin-left: 10%; font-weight: bolder; font-size: 18pt">필터</span>
										<i class="bi bi-x-lg fs-1"
											style="cursor: pointer; float: right; margin-right: 10%"
											onclick="filterClose()"></i>
										<hr style="background: #dda3ff; height: 5px">
									</div>


									<form class="form-controll" action="./freepReviewListPage"
										method="get" style="width: 100%; height: 100%;">

										<div
											style="width: 100%; height: 72%; padding-left: 14%; padding-right: 14%; padding-bottom: 14%; padding-top: 9%; margin-top: 5%; font-size: 14pt; overflow: auto;">
											<p
												style="font-weight: bolder; margin-bottom: 2em; font-size: 16pt;">정렬</p>

											<div style="width: 100%; margin-bottom: 2em">

												<span>좋아요 높은순</span> <span style="float: right;"> <c:if
														test="${filterInOrderType eq 'inOrderHighLikeReview'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderHighLikeReview" type="radio"
															checked="checked">
													</c:if> <c:if
														test="${filterInOrderType ne 'inOrderHighLikeReview'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderHighLikeReview" type="radio">
													</c:if>
												</span>
											</div>
											<div style="width: 100%; margin-bottom: 2em">
												<span>좋아요 낮은순</span> <span style="float: right;"> <c:if
														test="${filterInOrderType eq 'inOrderLowLikeReview'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderLowLikeReview" type="radio"
															checked="checked">
													</c:if> <c:if
														test="${filterInOrderType ne 'inOrderLowLikeReview'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderLowLikeReview" type="radio">
													</c:if>
												</span>
											</div>
											<div style="width: 100%; margin-bottom: 2em">
												<span>최신순</span> <span style="float: right;"> <c:if
														test="${filterInOrderType eq 'inOrderByDesc'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderByDesc" type="radio" checked="checked">
													</c:if> <c:if test="${filterInOrderType ne 'inOrderByDesc'}">
														<input class="form-check-input" name="filterInOrderType"
															value="inOrderByDesc" type="radio">
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

						<div class="row my-3">

							<div class="col" style="padding-left: 16px;">
								<span
									style="width: 89.45px; height: 30px; letter-spacing: -5px; position: relative; filter: opacity(0.7) drop-shadow(0 0 0 #d1625a) brightness(1.8); z-index: 9">

									<span
									style="width:${freepReviewDataList[0].avgStarScore/5.0*100}%; height:30px;position:absolute; background-color: white; z-index: 7"></span>

									<span
									style="width:${freepReviewDataList[0].avgStarScore/5.0*100}%; height:30px; overflow:hidden;
													letter-spacing:-5px; white-space:nowrap; text-overflow:clip; position:absolute; 
													color:red; filter: opacity(0.7) drop-shadow(0 0 0 Crimson) brightness(1.8); z-index: 8">
										<img src="../resources/img/star-fill.png" height="30px">
										<img src="../resources/img/star-fill.png" height="30px">
										<img src="../resources/img/star-fill.png" height="30px">
										<img src="../resources/img/star-fill.png" height="30px">
										<img src="../resources/img/star-fill.png" height="30px">

								</span> <img src="../resources/img/star-fill.png" height="30px"
									style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 8">
									<img src="../resources/img/star-fill.png" height="30px"
									style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 8">
									<img src="../resources/img/star-fill.png" height="30px"
									style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 8">
									<img src="../resources/img/star-fill.png" height="30px"
									style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 8">
									<img src="../resources/img/star-fill.png" height="30px"
									style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 8">

								</span> <span
									style="padding-left: 0.2em; position: absolute; font-size: 23px; font-weight: bold;">
									${freepReviewDataList[0].avgStarScore} </span>
							</div>

						</div>

						<div class="row my-5">
							<div class="col">
								<hr style="background-color: #dda3ff; height: 3px;">
							</div>
						</div>

						<c:if test="${freepReviewDataList.size()==0}">
							<div class="row">
								<div class="col-2"></div>
								<div class="col">
									<h4 style="font-weight: bold;">아직 작성된 포스트가 없습니다.</h4>
								</div>
								<div class="col-2"></div>
							</div>
						</c:if>

						<c:if test="${freepReviewDataList.size()>0}">
							<c:forEach begin="0" end="${freepReviewDataList.size() -1}"
								var="i">

								<div class="row">
									<div class="col-1" style="margin-right: 30px">

										<img
											src="/uploadFiles/${freepReviewDataList[i].freepReviewList.mb_image_link}"
											style="width: 100px; height: 100px; border-radius: 70%; overflow: hidden;">
									</div>

									<div class="col-6">
										<div class="row my-4">
											<b
												style="font-weight: bold; font-size: 20px; line-height: 12px; margin-bottom: 10px;">${freepReviewDataList[i].freepReviewList.mb_nick }</b>
										</div>

										<div class="row my-3">
											<div class="col-7">
												<span
													style="width: 89.45px; height: 20px; letter-spacing: -5px; position: relative; filter: opacity(0.7) drop-shadow(0 0 0 #d1625a) brightness(1.8); z-index: 9; top: 4px;">
													<span
													style="width:${freepReviewDataList[i].starScore/5.0*100}%; height:20px; position:absolute; background-color: white; z-index: 7"></span>
													<span
													style="width:${freepReviewDataList[i].starScore/5.0*100}%; height:20px; overflow:hidden;
													letter-spacing:-5px; white-space:nowrap; text-overflow:clip; position:absolute; 
													color:red; filter: opacity(0.7) drop-shadow(0 0 0 Crimson) brightness(1.8); z-index: 8">
														<img src="/freeple/resources/img/star-fill.png"
														style="width: 20px; padding-bottom: 16px;"> <img
														src="/freeple/resources/img/star-fill.png"
														style="width: 20px; padding-bottom: 16px;"> <img
														src="/freeple/resources/img/star-fill.png"
														style="width: 20px; padding-bottom: 16px;"> <img
														src="/freeple/resources/img/star-fill.png"
														style="width: 20px; padding-bottom: 16px;"> <img
														src="/freeple/resources/img/star-fill.png"
														style="width: 20px; padding-bottom: 16px;">
												</span> <img src="/freeple/resources/img/star-fill.png"
													style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9; width: 20px; padding-bottom: 16px;">
													<img src="/freeple/resources/img/star-fill.png"
													style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9; width: 20px; padding-bottom: 16px;">
													<img src="/freeple/resources/img/star-fill.png"
													style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9; width: 20px; padding-bottom: 16px;">
													<img src="/freeple/resources/img/star-fill.png"
													style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9; width: 20px; padding-bottom: 16px;">
													<img src="/freeple/resources/img/star-fill.png"
													style="filter: opacity(0.7) drop-shadow(0 0 0 white) brightness(1.8); z-index: 9; width: 20px; padding-bottom: 16px;">
												</span> <b
													style="padding-left: 10px; font-size: 20px; font-weight: bold;">
													${freepReviewDataList[i].starScore}</b> <b
													style="margin-left: 8px; line-height: 10px; color: rgb(155, 155, 155); font-size: 20px;"><fmt:formatDate
														value="${freepReviewDataList[i].freepReviewList.comment_writedate }"
														pattern="yy.MM.dd" /></b>
											</div>
											<div class="col-2"></div>

											<div class="col"></div>

										</div>

										<div class="row">
											<div class="col"
												style="margin-bottom: 20px; white-space: pre-wrap; font-size: 18px; line-height: 22px; font-weight: bold;">${freepReviewDataList[i].freepReviewList.comment_content }</div>
										</div>

										<div class="row">
											<div class="col container " style="padding-top: 50px">
												<c:if
													test="${freepReviewDataList[i].freepReviewImageList.size()>0}">
													<c:forEach begin="0"
														end="${freepReviewDataList[i].freepReviewImageList.size()-1}"
														var="j">
														<c:if test="${j <= 2}">
															<img class="img-city" onmouseenter="zoomIn(event)"
																onmouseleave="zoomOut(event)"
																src="/uploadFiles/freep/freepImage/${freepReviewDataList[i].freepReviewImageList[j].review_image_link}"
																style="width: 100px; height: 100px; border-radius: 10%; overflow: hidden;">
														</c:if>
													</c:forEach>
												</c:if>
											</div>

										</div>


									</div>

									<div class="col"></div>

								</div>

								<div class="row">
									<div class="col"></div>
									<div class="col"></div>
									<div class="col-1">
										<i class="reviewLike bi bi-heart text-danger"
											style="font-size: 20px;" onclick="doFreepReviewLike(this)"></i>
										<div hidden="hidden" class="review_no">${freepReviewDataList[i].freepReviewList.review_no}</div>
										<span class="reviewlikeCount"
											style="font-size: 25px; font-weight: bold;"></span>
									</div>
								</div>

								<c:if test="${not empty freepSessionuserInfo}">


									<div class="row my-5" id="freepReviewReplyRegister"
										style="width: 100%; line-height: 22px; border-radius: 5px; padding: 20px; background-color: rgb(249, 249, 249); font-size: 12px;">

										<div class="col-1"></div>
										<div class="col-1">
											<img
												src="/uploadFiles/${freepSessionuserInfo.mb_image_link }"
												style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;">
										</div>

										<div class="col-2" style="padding-top: 15px;">

											<b
												style="line-height: 30px; font-size: 15px; font-weight: bold; padding-left: 20px;">${freepSessionuserInfo.mb_nick }</b>
										</div>
										<div class="col"></div>

										<div class="row my-5">
											<div class="col-1"></div>
											<div class="col-1">
												<div class="form-floating">
													<textarea class="form-control"
														placeholder="Leave a comment here" id="commentInput"
														style="height: 300px; width: 837px;"></textarea>
													<label for="commentInput">${freepReviewDataList[i].freepReviewList.mb_nick }</label>
												</div>
											</div>
											<div class="col"></div>
										</div>

										<div class="row">
											<div class="col"></div>
											<div class="col"></div>

											<div class="col-2">
												<button onclick="freepReviewReply(this)"
													class="btn btn-primary btn-lg">답글 달기</button>
												<div hidden="hidden" id="review_no">${freepReviewDataList[i].freepReviewList.review_no}</div>
												<div hidden="hidden" id="mb_no">${freepReviewDataList[i].freepReviewList.mb_no}</div>
											</div>
										</div>

									</div>

								</c:if>

								<!-- 로그인이 안되어있을때는 답글 목록 출력-->
								<c:if test="${empty freepSessionuserInfo}">
									<c:if
										test="${freepReviewDataList[i].freepReviewReplyList.size()>0}">
										<div class="row my-5" id="freepReviewReplyList"
											style="width: 100%; line-height: 22px; border-radius: 5px; padding: 20px; background-color: rgb(249, 249, 249); font-size: 12px;">

											<div class="col-1">

												<img src="/uploadFiles/${hostInfo.mb_image_link }"
													style="width: 70px; height: 70px; border-radius: 70%; overflow: hidden;">
											</div>


											<div class="col-3">


												<div class="row my-3">
													<b
														style="margin-top: 20px; height: 12px; line-height: 12px; font-size: 20px; font-weight: bold; padding-left: 20px;">${hostInfo.mb_nick }
														(호스트) </b>

												</div>

											</div>

											<div class="col"></div>


											<c:forEach begin="0"
												end="${freepReviewDataList[i].freepReviewReplyList.size()-1}"
												var="j">
												<div class="row my-5">
													<div class="col-1"></div>
													<div class="col-3">
														<p
															style="font-size: 15px; font-weight: bold; padding-left: 20px;">
															${freepReviewDataList[i].freepReviewReplyList[j].comment_content }</p>
													</div>
													<div class="col"></div>
												</div>

											</c:forEach>

										</div>
									</c:if>
								</c:if>

								<div class="row my-5">
									<div class="col">
										<hr style="background-color: #dda3ff; height: 3px;">
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>

					<div class="row">
						<div class="col"></div>
						<div class="col">
							<div>
								<!-- 페이징 UI -->
								<nav aria-label="Page navigation example"
									style="text-align: center;">
									<ul class="pagination pagination-lg">

										<c:choose>
											<c:when test="${startPage <= 1 }">
												<li class="page-item disabled"><a class="page-link">&lt;</a></li>
												<!-- < -->
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="./freepReviewListPage?pageNum=${startPage -1}">&lt;</a></li>
												<!-- < -->
											</c:otherwise>
										</c:choose>

										<c:forEach begin="${startPage}" end="${endPage}" var="i">
											<c:choose>
												<c:when test="${i == currentPageNum}">
													<li class="page-item active"><a class="page-link"
														href="./freepReviewListPage?pageNum=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="./freepReviewListPage?pageNum=${i}">${i}</a></li>
												</c:otherwise>
											</c:choose>


										</c:forEach>
										<c:choose>
											<c:when test="${endPage >= totalPageCount}">
												<li class="page-item"><a class="page-link disabled">&gt;</a></li>
												<!-- > -->
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="./freepReviewListPage?pageNum=${endPage+1}">&gt;</a></li>
												<!-- > -->
											</c:otherwise>
										</c:choose>

									</ul>
								</nav>
							</div>
						</div>
						<div class="col"></div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
		</div>
	</div>

	<jsp:include page="../global/mainBottom.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>