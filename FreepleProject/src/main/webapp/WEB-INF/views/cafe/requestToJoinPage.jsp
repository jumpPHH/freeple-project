<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<meta charset="UTF-8">

<style type="text/css">
    *{
    font-family : Jua;
    }
</style>

<script type="text/javascript">
var userNo = 0;
var cafeNo = ${cafeVo.cafe_no}

function getUserNo() {
	var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); 
			
			if(jsonObj.result == 'success'){
				userNo = jsonObj.data;
			}	
		}
	}
	xhr.open("get" , "../getUserNo?cafe_no="+cafeNo, false); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); 
}

function accpetCafeMember(requestToJoinNo,memberNo){
    var nickNoBox = document.getElementById("nickNo").value;
    var gradeNoBox = document.getElementById("gradeNo").value;
    
	var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); 
			
			var myModal = new bootstrap.Modal(document.getElementById('myModal'));
			myModal.show();
		}
	}
	xhr.open("get" , "./acceptRequestToJoin?cafe_no="+cafeNo+"&cafeMember_nickname="+nickNoBox+"&cafe_grade="+gradeNoBox+"&requestToJoin_no="+requestToJoinNo+"&mb_no="+memberNo); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); 
}

function clickDel(){
	location.href="./requestToJoinPage?cafe_no="+cafeNo;
}
</script>

</head>
<body>
<jsp:include page="../global/mainTop.jsp"></jsp:include>
<div class="row container-fluid" style="margin: 0 auto; padding: 0 auto">
<div class="col">
	
    <div class="row">
        <div class="col"></div><!--여백-->
              
        <div class="col-10">
			<jsp:include page="./global/topBar.jsp"></jsp:include>           
            
            <div class="row">
                <div class="col"><!--네비바-->
					<jsp:include page="./global/leftSideBar.jsp"></jsp:include>	
                </div>
                <div class="col-10">
                	<div class="row mx-5">
                		<div class="col">
                			<div class="row border-2 border-bottom border-balck py-4">
								<div class="col fw-bold fs-3"><i class="bi bi-person-dash"></i>&nbsp;가입요청 목록</div>                				
                			</div>
			                <div class="row border-2 border-bottom border-balck py-4"><!--회원 목록 title 일단 뺏음-->
			                    <div class="col-2 fw-bold fs-5">가입요청수: ${cafeVo3.cafeMember_limit-1 }</div>
			                    <div class="col fw-bold fs-5">인원제한수: ${cafeVo.cafeMember_limit }</div>
			                </div>
			                <div class="row py-3 bg-light">
			                	<div class="col-2 ">닉네임</div>
			                  	<div class="col">하고싶은말</div>
			                  	<div class="col-3">요청일</div>
			                  	<div class="col-2">승인상태</div>
				            </div>
				            <!-- 여기 ajax하기 -->
			                    <div class="row ">
			                        <c:forEach items="${dataList }" var="data">    
			                   <!-- <form action="./acceptCafeMemberProcess" method="post"> -->     
			                        <div class="col-12" id="requestList"><!--반복문 돌릴 box-->
			                            <div class="row border-bottom border-balck py-3"><!--닉네임-->
			                                <div class="col-2">${data.memberVo.mb_nick }</div>
			                                <div class="col">${data.requestToJointVo.requestToJoin_coment }</div>
			                                <div class="col-3"><fmt:formatDate value="${data.requestToJointVo.requestToJoin_date }" pattern="yyyy.MM.dd.HH시mm분"/></div>
			                               	<div class="col-2">
			                               		<div class="row">
			                               			<div class="col">
					                               		<c:if test="${data.requestToJointVo.requestToJoin_approval ne 'Y' }">
						                                    <div class="col d-grid p-0">
						                                        <button class="btn btn-secondary" onclick="accpetCafeMember(${data.requestToJointVo.requestToJoin_no},${data.requestToJointVo.mb_no})">수락</button>
						                                    </div>
					                                   	</c:if>
					                                   	<c:if test="${data.requestToJointVo.requestToJoin_approval eq 'Y' }">
			                                    			<div class="col"></div>
			                                    		</c:if>
			                               			</div>
			                               			<div class="col pt-2">${data.requestToJointVo.requestToJoin_approval}</div>
			                               		</div>
			                               	</div>
			                            </div>           
			                        </div>
			                       <!-- </form> -->     
			                        </c:forEach>
			                        <input type="hidden" id="nickNo" name="cafeMember_nickname" value="카페닉네임를 만들어주세요">
			                        <input type="hidden" id="gradeNo" name="cafe_grade" value="2"> 
			                        <!-- 모달 -->
			                        <div class="modal fade" tabindex="-1" id="myModal" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-bs-backdrop="static">
										<div class="modal-dialog">
										<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">알림</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">완료되었습니다.</div>
										<div class="modal-footer">
											<button data-bs-dismiss="modal" class="btn btn-outline-secondary" onclick="clickDel()">확인</button> 
										</div>
										</div>
										</div>
									</div>
			                    </div>                		
                		
                		</div>
                	</div>  
                </div>
            </div>
    
            <div class="row">
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
            </div>
    
        </div><!--col-10끝나는--> 
        
        <div class="col"></div><!--여백-->
    </div>
<!-- 지우면 안됨 -->
</div>
</div>	
<br><br><br>
<jsp:include page="../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>