 <%@ page language="java" contentType="text/html; charset=UTF-8"
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
    
    #outer-div{
		  height : 600px;
		  display : flex;
		  justify-content: center;
		  align-items : center;
    }
    
    #inner-div {
	  height : 200px;
	}
</style>

<script type="text/javascript">


var userNo = 0;
var cafeNo = ${cafeVo.cafe_no};

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
	xhr.open("get" , "../getUserNo?cafe_no="+cafeNo, false); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..
}

	function createCategory() {
		var categoryNameBox = document.getElementById('categoryName').value;
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var myModal = new bootstrap.Modal(document.getElementById('myModal'));
				myModal.show();
			}
		}
		
		xhr.open("post" , "./produceBoardCategoryProcess"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("cafe_no="+cafeNo+"&cafeBoard_Category_name="+categoryNameBox); //AJAX로 리퀘스트함..
	}
	
	function clickDel() {
		location.href="./cafeBoardSettingPage?cafe_no="+${cafeVo.cafe_no};
	}
	
	function deleteCategory(cateNo){
		//var cafegoryNoBox = document.getElementById('cafegoryNo').value;
		//var cafegoryNoBox = e.parent.getElementsByClassName("cafegoryNo")[0].value;
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
				deleteModal.show();
			}
		}
		xhr.open("get" , "./deleteBoardCategoryProcess?cafe_no="+cafeNo+"&cafeBoard_Category_no="+cateNo); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..
	}
	
	window.addEventListener("DOMContentLoaded", function(){ 
		getUserNo();
	});

</script>

</head>
<body>
<jsp:include page="../../global/mainTop.jsp"></jsp:include>
<div class="row container-fluid" style="margin: 0 auto; padding: 0 auto">
<div class="col">
	
    <div class="row">
        <div class="col"></div><!--여백-->
              
        <div class="col-10">
			<jsp:include page="./global/cafeBoardTopBar.jsp"></jsp:include>  
			
            <div class="row">
                <div class="col"><!--네비바-->
					<jsp:include page="./global/cafeBoardLeftNevi.jsp"></jsp:include>
                </div>
                <div class="col-10"><!--본문내용-->
                	<div class="row mx-5">
                		<div class="col">
							<div class="row border-2 border-bottom border-balck py-4">
								<div class="col fw-bold fs-3"><i class="bi bi-folder"></i>&nbsp;메뉴 관리</div>
							</div>   
		                 <!-- <form action="./produceBoardCategoryProcess" method="post"> -->   
		                    <div class="row py-3">
								<div class="col"><!-- 게시판 만들기 -->
									<div class="row">
							
				                        <div class="col" id="outer-div">
				                        	<div class="col mt-3" id="inner-div">
				                            <div class="row py-3">
				                                <div class="col-2 fs-5 mt-2">게시판</div>
				                                <div class="col">
				                                    <input id="categoryName" class="form-control form-control-lg" name="cafeBoard_Category_name" type="text" placeholder="ex)자유게시판">
				                                </div>
				                            </div>
				                            <div class="row py-2">
				                                <div class="col-2"></div>
				                                <div class="col d-grid">
				                                    <input type="hidden" name="cafe_no" value="${cafeVo.cafe_no }">
				                                    <button class="btn btn-outline-secondery btn-lg" type="button" onclick="createCategory()">생성하기</button>
				                                    <!-- modal -->
													<div class="modal fade" tabindex="-1" id="myModal" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-bs-backdrop="static">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body">
													       	게시판이 생성되었습니다.
													      </div>
													      <div class="modal-footer">
															<button data-bs-dismiss="modal" class="btn btn-outline-secondary" onclick="clickDel()">확인</button> 
													      </div>
													    </div>
													  </div>
													</div>	
													<!-- modal끝 -->		                                    
				                                </div>
				                            </div>
				                            </div>
				                        </div>
									
									</div>
								</div>
								<div class="col-1">
								<div class="row mt-5 ps-2" id="outer-div">
									<div class="col" id="inner-div">
										<h1><i class="bi bi-chevron-double-right"></i></h1>
									</div>
								</div>
								</div>
								<div class="col"><!-- 게시판 삭제 및 이름 수정? -->
									<div class="row">
									<div class="col border border-black" style="height: 600px;">
									<div class="row">
										<div class="col fs-5 text-center bg-light py-4">게시판 목록</div>
									</div>	
								  	     <c:forEach items="${categoryList}" var="data"> 							  	     
										    <div class="row py-3"><!--카테고리-->
										        <div class="col ms-4 fs-5">
										        	<i class="bi bi-file-text"></i>${data.cafeBoard_CategoryVo.cafeBoard_Category_name}
										        </div>
										        <div class="col-2 p-0 d-grid">
													<button class="btn btn-secondary" onclick="deleteCategory(${data.cafeBoard_CategoryVo.cafeBoard_Category_no })">삭제</button>
													<input type="hidden" class="categoryNo" value="${data.cafeBoard_CategoryVo.cafeBoard_Category_no }">
													<div class="modal fade" tabindex="-1" id="deleteModal" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-bs-backdrop="static">
													  <div class="modal-dialog">
													    <div class="modal-content">
													      <div class="modal-header">
													        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
													        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													      </div>
													      <div class="modal-body">
													       	${data.cafeBoard_CategoryVo.cafeBoard_Category_name}이 삭제되었습니다.
													      </div>
													      <div class="modal-footer">
															<button data-bs-dismiss="modal" class="btn btn-outline-secondary" onclick="clickDel()">확인</button> 
													      </div>
													    </div>
													  </div>
													</div>											        
										        </div>
										        <div class="col-3 d-grid">
													<button class="btn btn-secondary">이름 변경</button>										        
										        </div>
										    </div>
								    </c:forEach>										
									</div>
									</div>
								</div>
		                    </div>
		                	<!-- </form> --> 					             		
                		</div>
                	</div>
                
                
               

                </div>
            </div>
    
        </div><!--col-10끝나는--> 
        <div class="col"></div><!--여백-->
    </div>
	
	
<!-- 지우지마 -->	
</div>
</div>	
<br><br><br>
<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>