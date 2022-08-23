<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$('.box')
								.each(
										function() {
											var content = $(this).children(
													'.content');
											var content_txt = content.text();
											var content_txt_short = content_txt
													.substring(0, 30)
													+ "...";
											var btn_more = $('<a href="javascript:void(0)" class="more text-secondary" style="font-size:0.7em;text-decoration-line:none"> &gt;더보기</a>');

											$(this).append(btn_more);

											if (content_txt.length >= 30) {
												content.html(content_txt_short)

											} else {
												btn_more.hide()
											}

											btn_more.click(toggle_content);
											// 아래 bind가 안 되는 이유는??
											// btn_more.bind('click',toggle_content);

											function toggle_content() {
												if ($(this).hasClass('short')) {
													// 접기 상태
													$(this).html('&gt;더보기');
													content
															.html(content_txt_short)
													$(this)
															.removeClass(
																	'short');
												} else {
													// 더보기 상태
													$(this).html('&gt;접기');
													content.html(content_txt);
													$(this).addClass('short');

												}
											}
										});
					});
</script>
<style>
.card-img-top {
	width: 100%;
	height: 11em;
}

.card {
	width: 100%;
	height: 100%;
}
.font-team {
	font-family: Jua;
}
.box1 {
	height: 50px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

</style>
<meta charset="UTF-8">
<title>리뷰</title>
<link href="https://fonts.googleapis.com/css?family=Jua:400"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../global/mainTop.jsp"></jsp:include>
	<div style="width: 1200px; margin: 0 auto">
		<div class="container-fluid">
			<div class="row">
				<div class="col"></div>
			</div>
			<div class="row">
				<div class="col">
					<div class="row my-5">
						<div class="col-2"></div>
						<div class="col-6 font-team">
							<h2>마이리뷰</h2>
						</div>
						<div class="col text-center font-team" style="width: auto;">
							<a href="../review/reviewMainPage"  style="text-decoration: none"><i class="bi bi-book"
											style="color: #a273de; font-size: 19pt; display: block;"></i>
											<span style="display: block; color: #ab79d1;" >리뷰메인</span></a>
						</div>
						<div class="col-2"></div>
					</div>
				</div>
			</div>
			<div>



				<!-- 여기서부터 카드형 시작 -->
				<div class="row">
					<div class="col"></div>
					<div class="col-10">
						<div class="row row-cols-1 row-cols-md-4 g-4">
							<c:forEach items="${reviewDataList}" var="reviewDataList">
								<c:if
									test="${!empty sessionUserInfo && sessionUserInfo.mb_no == reviewDataList.fp_MemberVo.mb_no}">
									<div class="col">

										<div class="card pt-3" style="border-color:#a273de;background-color:#f9f5fc">
											<div class="row mb-1 mt-1">
												<div class="col-1"></div>
												<div class="col-3 box1">
													<img
														src="/uploadFiles/${reviewDataList.fp_MemberVo.mb_image_link}"
														class="d-block w-100 profile">
												</div>
												<div class="col">
													<div class="row">
														<div class="col">
															<div class="card-title font-team "
																style="font-size: 20px; color:brown;">
																${reviewDataList.fp_MemberVo.mb_nick}</div>
														</div>
													</div>
													
													<div class="row">
														<div class="col">
															<div class="card-title font-team text-secondary"
																style="font-size: 10px;"><i class="bi bi-calendar"></i>	
																<fmt:formatDate
																	value="${reviewDataList.fp_FreepReviewVo.comment_writedate }"
																	type="date" pattern="yyyy-MM-dd" />
															</div>

														</div>
													</div>

												</div>
											</div>
											<!-- 크로셀시작 -->
												<div
													id="carouselExampleControls_${reviewDataList.fp_FreepReviewVo.review_no }"
													class="carousel slide" data-bs-ride="carousel">
													<div class="carousel-inner">
														<c:forEach
															items="${reviewDataList.fp_FreepReviewImageVoList }"
															var="image" varStatus="set">
															<c:choose>
																<c:when test="${set.first }">
																	<div class="carousel-item active">
																		<img
																			src="/uploadFiles/freep/freepImage/${image.review_image_link}"
																			class="d-block w-100 card-img-top" alt="...">
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="carousel-item">
																		<img
																			src="/uploadFiles/freep/freepImage/${image.review_image_link}"
																			class="d-block w-100 card-img-top" alt="...">
																	</div>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</div>

													<button class="carousel-control-prev" type="button"
														data-bs-target="#carouselExampleControls_${reviewDataList.fp_FreepReviewVo.review_no }"
														data-bs-slide="prev">
														<span class="carousel-control-prev-icon"
															aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
													</button>
													<button class="carousel-control-next" type="button"
														data-bs-target="#carouselExampleControls_${reviewDataList.fp_FreepReviewVo.review_no }"
														data-bs-slide="next">
														<span class="carousel-control-next-icon"
															aria-hidden="true"></span> <span class="visually-hidden">Next</span>
													</button>
												</div>
												<!-- 크로셀 끝 -->
											<div class="card-body">
												<h5 class="card-title">${reviewDataList.fp_FreepReviewVo.freep_no}</h5>
												<div class="box">
													<div class="content" style="font-size:13px;">
														${reviewDataList.fp_FreepReviewVo.comment_content}</div> 
												</div>
												<br> <a class="btn btn-primary" style="font-size:13px; background-color: #a273de; border-color: #a273de;"
													href="./deleteMyReviewProcess?review_no=${reviewDataList.fp_FreepReviewVo.review_no}" >삭제</a>
												<a class="btn btn-primary" style="font-size:13px; background-color: #a273de; border-color: #a273de;"
													href="./updateReviewPage?review_no=${reviewDataList.fp_FreepReviewVo.review_no}">수정</a>
											</div>
										</div>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="col"></div>
				</div>










			</div>

			<div class="col"></div>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>




	<jsp:include page="../global/mainBottom.jsp"></jsp:include>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>