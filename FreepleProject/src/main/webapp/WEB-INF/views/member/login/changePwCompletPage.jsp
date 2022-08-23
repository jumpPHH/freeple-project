<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 성공 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../../global/mainTop.jsp"></jsp:include>
	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">
		
			<div class="row my-5">
				<div class="col-3"></div>
				
				<div class="col">

					<div class="row my-4">
						<div class="col" style="border-bottom: 2px solid #787878">
						</div>  					
					</div>
					
					<div class="row">
						<div class="col">
							<div>
								<h3><b>비밀번호 변경</b>이 완료 되었습니다.</h3>
							</div>
						</div>
					</div>
					
					<div class="row my-4">
						<div class="col" style="border-bottom: 2px solid #787878">
						</div>  					
					</div>
					
					<div class="row my-2">
						<div class="col">
							<p style="font-size: small;">비밀번호가 타인에게 노출되지 않도록 주의하시기 바랍니다.<br>
							비밀번호는 최소 3개월 이내 주기적으로 변경해주시는 것이 좋습니다.</p>
						</div>  					
					</div>
					
					<div class="row my-4">
						<div class="col d-grid">
							<a href="../login/closeUserProcess?mb_no=${UserInfo.mb_no}" class="btn btn-primary">로그인</a>
						</div>					
					</div>		
								
				</div>
				
				<div class="col-3"></div>
			</div>
		</div>
	</div>
	<br><br><br><br>
	<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
	
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>