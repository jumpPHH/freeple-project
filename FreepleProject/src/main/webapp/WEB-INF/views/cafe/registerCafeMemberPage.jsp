h<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () { // 콜백함수
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
			if(jsonObj.result == 'success'){
				userNo = jsonObj.data;
			}	
		}
	}
	xhr.open("get" , "./getUserNo?cafe_no="+cafeNo, false); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..
}



	function requestMember(){
		var sendMessageBox = document.getElementById("sendMessage").value;
		var mbNoBox = document.getElementById("mbNo").value;
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var myModal = new bootstrap.Modal(document.getElementById('myModal'));
				myModal.show();
				
			}
		}
		xhr.open("get" , "./registerCafeProcess?cafe_no="+cafeNo+"&mb_no="+mbNoBox+"&requestToJoin_coment="+sendMessageBox); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		//xhr.send("cafe_no="+cafeNo+"&mb_no="+userNo+"&requestToJoin_coment="+sendMessageBox); //AJAX로 리퀘스트함..
		xhr.send();
	}
	
	function clickDel() {
		location.href="./cafePage?cafe_no="+${cafeVo.cafe_no};
	}
	
	window.addEventListener("DOMContentLoaded", function(){ 
		getUserNo();
	});
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
                <div class="col">
					<jsp:include page="./global/leftSideBar.jsp"></jsp:include>		
                </div>
                <div class="col-10"><!--본문-->
                <div class="row mx-5">
					<div class="col">
						<div class="row border-2 border-bottom border-balck py-4">
							<div class="col">
								<div class="row">
									<div class="col fw-bold fs-3"><i class="bi bi-balloon"></i>&nbsp;카페 가입하기</div>
									</div>
								<div class="row pt-2">
									<div class="col">카페 가입을 위한 정보를 입력해주세요.</div>
								</div>							
							</div>
						</div>
						<div class="row py-4 border-bottom border-balck">
							<div class="col-2 fw-bold fs-5 "><i class="bi bi-dot"></i>카페 소개</div>
							<div class="col">${cafeVo.cafeIntroduce_content}</div>
						</div>
						<div class="row py-4 border-bottom border-balck">
							<div class="col-2 fw-bold fs-5"><i class="bi bi-dot"></i>가입 안내</div>
							<div class="col">카페관리자가 가입을 승인하면 회원가입이 완료되며, 카페를 이용할 수 있습니다</div>
						</div>						
						
		              <!--    <form action="./requestToJoinProcess" method="post"> -->
		                    <div class="row py-4 border-bottom border-balck">
		                    	<div class="col-2 fw-bold fs-5"><i class="bi bi-dot"></i>하고 싶은말</div>
		                        <div class="col">
		                            <input id="sendMessage" class="form-control form-control-lg" type="text" placeholder="카페지기에게 하고싶은말을 적어주세요">
		                            <input type="hidden" name="cafe_no" value="${cafeVo.cafe_no }">
		                            <input id="mbNo" type="hidden" name="mb_no" value="${sessionUserInfo.mb_no}">
		                        </div>
		                    </div>
		                    <div class="row py-4">
		                        <div class="col"></div>
		                        <div class="col-8 d-grid"><button onclick="requestMember()" type="button" class="btn" style="color: #ab79d1; border: 2px solid #ab79d1;">가입 요청하기</button></div>
		                        <div class="col"></div>
		                    </div>
		                <!-- </form>  -->  	
						<div class="modal fade" tabindex="-1" id="myModal" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-bs-backdrop="static">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						       	가입 요청이 완료되었습니다.
						      </div>
						      <div class="modal-footer">
								<button data-bs-dismiss="modal" class="btn btn-outline-secondary"  onclick="clickDel()">확인</button> 
						      </div>
						    </div>
						  </div>
						</div>			                  					
                	</div>
                </div>
 
              </div>
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