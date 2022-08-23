<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<script type="text/javascript">
	var userNo = 0; //참고 0은 비회원으로 인지함
	var boardNo = $
	{
		data.boardVo.board_no
	};

	function getUserNo() {
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				if (jsonObj.result == 'success') {
					userNo = jsonObj.data;
				}
			}
		}

		xhr.open("get", "../../member/login/getUserNo", false); //리퀘스트 세팅..
		xhr.send(); //AJAX로 리퀘스트함..				
	}

	function doLike() {

		if (userNo == 0) {
			var result = confirm("로그인후 이용이 가능합니다.");
			if (result == true) {
				location.href = "../../member/login/loginPage";
			}
			return;
		}

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);

				refreshHeart();
				refreshTotalCount();
			}
		}

		xhr.open("get", "./doLike?board_no=" + boardNo);
		xhr.send();
	}

	function refreshHeart() {

		if (userNo == 0)
			return;

		var xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);

				var heartBox = document.getElementById("likeHeart");

				if (jsonObj.data == true) {
					heartBox.setAttribute("class",
							"bi bi-heart-fill text-danger");
				} else {
					heartBox.setAttribute("class", "bi bi-heart text-danger");
				}
			}
		}

		xhr.open("get", "./isLiked?board_no=" + boardNo);
		xhr.send();
	}

	function refreshTotalCount() {

		var xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);

				var totalCountBox = document.getElementById("likeCount");
				totalCountBox.innerText = jsonObj.data;
			}
		}

		xhr.open("get", "./getTotalLikeCount?board_no=" + boardNo);
		xhr.send();
	}

	window.addEventListener("DOMContentLoaded", function() {
		//사실상 처음 실행하는 코드 모음...
		getUserNo();
		refreshHeart();
		refreshTotalCount();

	});
</script>

<style>
.outline-team{
	border: solid black 1px;
}
</style>

</head>

<body>
	<jsp:include page="../global/mainTop.jsp"></jsp:include>

	<div style="width: 1200px; margin: 0 auto;">
		<div class="container-fluid">
			<div class="row">
				<div class='col'></div>
				<div class='col-10'>
					<div class="row">
						<div class="col pb-2" style="border-bottom:2px solid gray;">
							<span class="fs-4 fw-bold text-secondary">프립 자유게시판</span>
						</div>
						
					</div>	
					<div class="row mt-4 fs-2 fw-bold py-3" style="border-bottom:1px solid gray; color:brown;">
						<div class="col">${data.boardVo.board_title }</div>
						
					</div>		
					<div class="row my-3">
						<div class="col"><i class="bi bi-person-fill"></i> ${data.memberVo.member_nick }</div>
						<div class="col"><i class="bi bi-eye"></i> ${data.boardVo.board_readcount }</div>
						<div class="col-2"><i class="bi bi-calendar"></i> <fmt:formatDate value="${data.boardVo.board_writedate }"
						pattern="yy.MM.dd" /></div>
						<div class="col-3"></div>
					</div>	
					<c:forEach items="${data.boardImageVoList}" var="boardImageVo">
						<div class="row my-1">
							<div class="col">
								<img class="img-fluid" src="/uploadFiles/${boardImageVo.image_link }">
							</div>
						</div>										
					</c:forEach>
					<div class="row my-4">
						<div class="col">${data.boardVo.board_content }</div>
					</div>
					<div class="row">
						<div class="col fs-3 text-center my-4"><i id="likeHeart" class="bi bi-heart text-danger" onclick='doLike()'></i> <span id="likeCount"></span></div>
					</div>
					<div class="row my-3">
						<div class="col-2 d-grid"><a class="btn btn-primary" href="./mainPage"><i class="bi bi-card-list"></i> 목록</a></div>
						<div class="col"></div>
						<c:if test="${!empty sessionUserInfo && sessionUserInfo.member_no == data.memberVo.member_no }">
						<div class="col-2 d-grid">
							<button type="button" class="btn btn-danger" onclick="location.href='./deleteContentProcess?board_no=${data.boardVo.board_no }';"><i class="bi bi-trash3"></i> 삭제</button>
						</div>
						<div class="col-2 d-grid">
							<button type="button" class="btn btn-primary" onclick="location.href='./updateContentPage?board_no=${data.boardVo.board_no }';"><i class="bi bi-pencil-square"></i> 수정</button>							
						</div>
						</c:if>
					</div>
					<form action="./writeCommentProcess" method="post">
					<div class="row my-3">
						<div class="col-10">
							<input type="hidden" name="member_no" value="${sessionUserInfo.member_no }">
							<input type="hidden" name="board_no" value="${data.boardVo.board_no }">
							<textarea class="form-control" name="comment_content"></textarea>
						</div>
						<div class="col d-grid">
							<input class="btn btn-primary" type="submit" value="댓글쓰기">
						</div>					
					</div>
					</form>
					
					<div class="row my-3 fs-6 text-secondary">
						<c:forEach items="${commentDataList }" var="ttt">
							<div class="col"><span class="fs-5 text-dark fw-bold me-3" ><i class="bi bi-chat"></i> 댓글 </span><span>등록순</span><span> | </span><span>최신순</span></div>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col">
							<c:forEach items="${commentDataList }" var="ttt">
							<div class="row border-bottom"><!-- 반복 -->
								<div class="col py-3">
									<div class="row">
										<div class="col">
											<span class="fw-bold"><i class="bi bi-person-circle"></i> ${ttt.memberVo.member_nick }</span>
											<span class="text-secondary fs-6">(<fmt:formatDate value="${ttt.commentVo.comment_writedate }" pattern="yy.MM.dd" />)</span>
										</div>
										<div class="col-1 d-grid">
											<c:if test="${!empty sessionUserInfo && sessionUserInfo.member_no == ttt.commentVo.member_no }">
											<a class="btn btn-danger btn-sm" href="deleteCommentProcess?comment_no=${ttt.commentVo.comment_no }&board_no=${data.boardVo.board_no}"><i class="bi bi-trash3"></i></a>
											</c:if>
										</div>
									</div>
									<div class="row">
										<div class="col">${ttt.commentVo.comment_content}</div>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>					
					</div>				
				
				</div>
				<div class='col'></div>
			</div>
		</div>
	</div>



	<jsp:include page="../global/mainBottom.jsp"></jsp:include>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	</body>
</html>