<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.font-team {
	font-family: Jua;
}
</style>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../global/mainTop.jsp"></jsp:include>
	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">	
		
			<div class="row"><div class="col"></div></div>
			
				<div class="row">
					<div class="col">
						<div class="row my-5">
							<div class="col-2"></div>
							<div class="col-6 font-team"><h3>리뷰작성</h3></div>
							<div class="col text-center font-team" style="width: auto;">
							<a href="../review/reviewMainPage"  style="text-decoration: none"><i class="bi bi-book"
											style="color: #a273de; font-size: 19pt; display: block;"></i>
											<span style="display: block; color: #ab79d1;" >리뷰메인</span></a>
							</div>
						<div class="col-2"></div>
					</div>
				<div>
					
					
					<form action="../review/reviewWriteProcess" method="post" enctype="multipart/form-data">
					<div class="row my-2"><!-- ID -->
						<div class="col-1"></div>
						<div class="col-2 font-team" style="font-size:20px; color:brown;">작성자 : ${sessionUserInfo.mb_nick } </div>
						<div class="col-1"></div>	
						<div class="col"></div>
					</div>
					
					<div class="row my-2"><!-- PW -->
						<div class="col-1"></div>
						<div class="col-6 text-center" style="width: auto;" >
							<textarea name="comment_content" rows="10" cols="128" placeholder="후기를 작성 부탁드립니다." maxlength="1250"></textarea>
						</div>
						<div class="col-1"></div>					
					</div>
					 
					<div class="row mt-3">
						<div class="col-1"></div>
						<div class="col-6 text-center" style="width: auto;"><input type="file" name="files" multiple accept="image/*"> </div>
						<div class="col-10"></div>
										
					</div>
					
					<div class="row mt-3"><!-- 제출하기 버튼 -->
						<div class="col-8"></div>
						<div class="col d-grid">
							<input type="submit" value="작성완료" class="btn btn-primary" style="font-size:15px; background-color: #a273de; border-color: #a273de; text-align:center;">
						</div>
						<div class="col-1"></div>
					</div>
					
					</form>
				</div>
				
				<div class="col"></div>
				
			</div>		
		</div>
	</div>
	</div>
	


<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>