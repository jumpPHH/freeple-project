<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 프로필 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/freeple/resources/css/freepHostProfilePage.css">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="../global/mainTop.jsp"></jsp:include>
	<div style="margin: 0 auto;">
		<div class="container-fluid">
			<div class="row">

				<div class="col-2"></div>
				<div class="col">
					<div class="row my-5">
						<div class="col-2"></div>
						<div class="col-1">
							<img src="/uploadFiles/${hostInfo.mb_image_link }"
								style="width: 100px; height: 100px; border-radius: 70%; overflow: hidden;">
						</div>

						<div class="col-5 cZgpqN" style="padding-top: 15px; margin-left:20px; text-align: left;">
							<div class="row">
								<div class="col-8">
									<b style="margin-left: 0px; margin-right: 0px;">${hostInfo.mb_nick }<br>
									<b class="cUDkmC">프립 3| 후기 1041| 저장 419</b>
									</b>
									
								</div>
								<div class="col">
									<img src="/freeple/resources/img/superHost.svg"
									style="width: 90px; height: 90px; margin-left: 10px; margin-right: 0px; padding-bottom: 60px;">
								</div>
								
								<div class="col"></div> 
								
							</div>
						</div>

						<div class="col-1 eZGjgL">
							<img src="/freeple/resources/img/hostProfileBookmark.svg">
						</div>

						<div class="col"></div>
					</div>
				</div>
				<div class="col-2"></div>

			</div>
			
			<div class="row my-5">
				<div class="col-1"></div>
				<div class="col-1"></div>
				<div class="col-1"></div>
				<div class="col-4" style="padding-left: 50px; font-size: 20px; font-weight: 600;">
					${hostInfo.mb_host_info}
				</div>
				<div class="col"></div>
			</div>
		</div>

		<jsp:include page="../global/mainBottom.jsp"></jsp:include>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	</div>
</body>
</html>