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

</head>
<body>
	<jsp:include page="../global/mainTop.jsp"></jsp:include>

	<div style="margin: 0 auto;">
		<div class="container-fluid">
			<div class="row my-5">

				<div class="col-2"></div>

				<form action="./writeContentProcess" method="post"
					enctype="multipart/form-data">
					<div class="col">

						<div class="row my-3">
							<div class="col">글쓰기</div>
						</div>

						<div class="row my-3">
							
							<div class="col-6">
								제목 : <input style="display: inline-block;" class="form-control" name="board_title" rows="5" cols="100" type="text">
							</div>
							<div class="col"></div>
						</div>

						<div class="row my-3">
							
							<div class="col">
							<textarea class="form-control" name="board_content" rows="20" cols="100"></textarea>
							</div>
							<div class="col"></div>
							
						</div>


						<div class="row my-3">

						<div class="col">
						<input class="form-control" type="file" id="formFile"
								name="files" multiple="multiple">
						</div>
						<div class="col"></div>
							
						</div>
						
						<div class="row my-3">
						
						<div class="col">
						<input type="submit" value="글쓰기">
						</div>
						
						
						</div>

					</div>
				</form>

				<div class="col-2"></div>
			</div>
		</div>
	</div>



	<jsp:include page="../global/mainBottom.jsp"></jsp:include>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>