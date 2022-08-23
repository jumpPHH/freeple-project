<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>	
<jsp:include page="../global/mainTop.jsp"></jsp:include>

	<h1>게시글 수정</h1>
	<form action="./updateAskContentProcess" method="post">
		작성자 : ${data.memberVo.mb_nick }<br>
		내용 : <br>
		<textarea  name="mb_mng_ask_content" rows="10" cols="40">${data.memberToManagerAsk.mb_mng_ask_content }</textarea>
		<input type="hidden" name="mb_mng_ask_no" value="${data.memberToManagerAsk.mb_mng_ask_no}"> 
		<br>
		<input type="submit" value="수정">
	</form>
	
<jsp:include page="../global/mainBottom.jsp"></jsp:include>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>