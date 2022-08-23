<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
	<body>
		<jsp:include page="../global/mainTop.jsp"></jsp:include>
		<div class="row my-3">
			<div class="col-3"></div>
				<div class="col-6">
						<div style="width:1200px; margin:0 auto">
							<div class="container-fluid">
								<form action="./updateContentProcess" method="post" enctype="multipart/form-data">
									<input name="board_title" type="text" value="${data.boardVo.board_title }"><br>	
									<div class="col mt-3"><textarea name="board_content" rows="10" cols="40">${data.boardVo.board_content }</textarea></div>
									<br>
									<input type="hidden" name="board_no" value="${data.boardVo.board_no }">
									<br>
									<input type="file" name="files" multiple accept="image/*">
									<br>
									<div class="col mt-3"><input type="submit" value="수정"></div>
								</form>
							</div>
						</div>
					</div>
				<div class="col-3"></div>
		</div>			
	</body>
</html>