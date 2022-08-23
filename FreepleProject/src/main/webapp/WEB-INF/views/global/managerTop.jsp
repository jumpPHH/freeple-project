<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col">
						
					
					</div>
					<div class="col-2 text-center" style="background-color: #E2E2E2; width: auto;">
						<span style=" font-weight: bold;">${sessionManagerInfo.mng_nick}</span>님&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="../login/managerLogoutProcess">로그아웃</a>
					</div>
					<div class="col-3"></div>
				</div>
				
				<div class="row">
					<div class="col">
						<a href="../main/managerMainPage"><img src="../../resources/img/managerMainPageFreepleLogo.jpg" style="padding-left: 15%"></a>
						<br><br>
					</div>
				</div>
				<div class="row" style="background-color: #E2E2E2">
					<br><br>
					<div class="col text-center" style="width: auto">
						<a href="../main/managerMainPage">프립관리</a>
					</div>
					<div class="col text-center" style="width: auto">
						<a href="../user/totalUserListPage">회원관리</a>
					</div>
					<div class="col text-center" style="width: auto">
						<a href="../ask/askCenterPage">고객센터</a>
					</div>
					<div class="col"></div>
					<div class="col"></div>
				</div>
			</div>
		</div>
	</div>
	
</body>
 