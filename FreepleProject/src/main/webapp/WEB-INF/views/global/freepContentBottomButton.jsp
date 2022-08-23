<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">

.quickmenu{
    position: fixed;
    bottom: 0px;
    left: 0px;
    width: 100%;
    padding: 12px 20px 24px;
    box-shadow: rgb(0 0 0 / 8%) 0px -10px 30px -10px;
    background-color: white;
    z-index: 200;
}	

.cKPTge {
    width: 100%;
    height: 56px;
    line-height: 24px;
    padding: 16px;
    background-color: rgb(0, 117, 239);
    text-align: center;
    cursor: pointer;
    border-radius: 10px;
    color: white;
    font-size: 16px;
    margin: 0px;
    border: 0px;
}

.hxJYoP {
    font-size: 15px;
    line-height: 16px;
    color: rgb(51, 51, 51);
    white-space: nowrap;
    margin-top: 10px;
   	padding-right: 18px;
   	font-weight: bold;
}		
</style>
<script>
	
$().ready(function () {
	$("#alertStart").click(function () {
// 			Swal.fire({
// 		      icon: 'warning',
// 		      title: '로그인',
// 		      text: '로그인을 해주세요',
// 		      showCancelButton: false,
// 		      showConfirmButton: false
// 		    });
			
// 			 setTimeout(function () {
// 				 location.href="../member/login/loginPage";
// 				},1000);
		swal({
			title:'로그인이 필요한 서비스입니다',
			text:'로그인을 해주세요',
			buttons: {
				value:false
			}
		}).then(function () {
			location.href='../member/login/loginPage';	
		});
	});


});
			  

</script>
<div class="row">
	<div class="row quickmenu"> 
		<div class="col-3">
			<div class="row" style="text-align: right;">
				<a href=".."><img src="/freeple/resources/img/bookmark.svg"
					style="padding: 0px; height: 48px;"></a>
			</div>
			<div class="row" style="text-align: right;">
				<p class="hxJYoP">6,377</p>
			</div>
		</div>
		<c:if test="${not empty sessionUserInfo}">
		<div class="col d-grid">
			<input type="button" onclick="joinWindowOpen()" class="cKPTge" value="참여하기"
			style="height: 60px;">
		</div>
		</c:if>
		<c:if test="${empty sessionUserInfo}">
		<div class="col d-grid"> 
			<input type="button" id="alertStart" class="cKPTge" value="참여하기"
			style="height: 60px;">
		</div>
		</c:if>
		<div class="col-3"></div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>