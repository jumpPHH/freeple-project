<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 페이지 3</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../global/mainTop.jsp"></jsp:include>
	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">
		
			<div class="row my-5">
				<div class="col"></div>
				
				<div class="col">
				 	<div class="row my-4">
				 		<div class="col">
				 			<h4>아이디 찾기</h4>
				 		</div>
				 	</div>
				 	
					<div class="row my-2">
						<div class="col">
							<p style="font-size: small;">
							개인정보 도용에 대한 피해방지를 위하여 아이디
							끝 두자리에서 네자리는 **처리 합니다.
							</p>
						</div>  					
					</div>
					
					<div class="row my-4">
						<div class="col" style="border-bottom: 2px solid #787878">
						</div>  					
					</div>
					
					<div class="row">
						<div class="col">
							<div style="font-size: small;">
							<c:set var="TextValue" value="${UserInfo.mb_id}"/>

								회원님의 아이디는 <b style="color: red;">
								<c:out value="${fn:substring(TextValue, 0, fn:length(TextValue) - 2)}"/>**</b>
								(으)로 등록되어 있습니다.<br>
								가입일자는 
								<b style="color: red;"><fmt:formatDate value="${UserInfo.mb_joindate}" pattern="yy.MM.dd"/></b>입니다.
							</div>
						</div>
					</div>
					
					<div class="row my-4">
						<div class="col" style="border-bottom: 2px solid #787878">
						</div>  					
					</div>
					
					<div class="row my-4">
						<div class="col d-grid">
							<a href="../login/closeUserProcess?mb_no=${UserInfo.mb_no}" class="btn btn-primary">로그인</a>
						</div>				
					</div>	
									
				</div>
				
				<div class="col"></div>
			</div>
		</div>
	</div>
	<br><br><br><br>
<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>