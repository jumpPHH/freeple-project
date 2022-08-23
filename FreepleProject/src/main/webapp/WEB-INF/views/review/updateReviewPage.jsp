<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정하기</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<style>

.box1 {
	width: 70px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.font-team {
	font-family: Jua;
}

</style>
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
						<div class="col-1"></div>
						<div class="col font-team">
							<h3>리뷰 수정하기</h3>
						</div>
						<div class="col-6"></div>
						<div class="col font-team">
							<a href="./reviewMainPage">리뷰메인페이지로</a>
						</div>
					</div>
				</div>
				<div>


					<form action="./updateReviewProcess" method="post"
						enctype="multipart/form-data">
						<div class="row my-2">
							<!-- ID -->
							<div class="col-1"></div>
							<div class="col-2 box1">
													<img
														src="/uploadFiles/${reviewdata.fp_MemberVo.mb_image_link}"
														class="profile">
												</div>
							<div class="col-1 font-team mt-3" style="font-size: 20px; color:brown;">${sessionUserInfo.mb_nick }</div>
							<div class="col"></div>
						</div>

						<div class="row my-2">
							<div class="col-1"></div>
							<div class="col">
								<textarea name="comment_content" rows="10" cols="130"
									placeholder="최소 20자 이상 입력해주세요." maxlength="1300" style="font-size:13px;">${reviewdata.fp_FreepReviewVo.comment_content }</textarea>
							</div>
						</div>

						<div class="row mt-3">
							<div class="col-1"></div>
							<div class="col">
								<input type="file" name="files" multiple accept="image/*">
							</div>
							<div class="col"></div>

						</div>

						<div class="row mt-3">
							<div class="col-1"></div>
							<c:forEach items="${reviewdata.fP_FreepReviewImageVoList}"
							var="reviewImageData">
							<div class="col-1">
								<img
									src="/uploadFiles/freep/freepImage/${reviewImageData.review_image_link}"
									style="width: 100px; height: 100px;"><br>
									<a class="btn btn-primary font-team " style="font-size:13px; background-color: #a273de; border-color: #a273de; text-align:center;"
									href="./deleteReviewImageProcess?review_no=${reviewdata.fp_FreepReviewVo.review_no}&review_image_no=${reviewImageData.review_image_no}">X</a>
							</div>
							</c:forEach>
							<div class="col-1"></div>
						</div>


							<div class="row mt-3">
								<div class="col-2"></div>
								<div class="col-8"></div>
								<div class="col">
									<input type="hidden" name="review_no"
										value="${reviewdata.fp_FreepReviewVo.review_no }"> <input
										type="submit" value="작성완료" class="btn btn-primary font-team " style="font-size:15px; background-color: #a273de; border-color: #a273de;">
								</div>
							</div>
				</form>


				<br> <br> <br>

			</div>

			<div class="col"></div>

		</div>
	</div>
	</div>


	<jsp:include page="../global/mainBottom.jsp"></jsp:include>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>