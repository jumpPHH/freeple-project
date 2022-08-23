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
var writeBoardNo = ${data.writeBoardVo.writeBoard_no}
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
	xhr.open("get" , "../getUserNo?cafe_no="+cafeNo, false); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..
}

function clickDel(){
	location.href="./boardByCategoryPage?cafe_no="+${cafeBoard_CategoryVo.cafe_no}+"&cafeBoard_Category_no="+${cafeBoard_CategoryVo.cafeBoard_Category_no};
}

function offDisplay(){ //레이아웃 다시 잡아야할듯...ㅜ
	var elm = document.getElementById('commentBox')
	
    if(elm.style.display=='none'){ 		
    	elm.style.display = 'block'; 	
    }else{ 		
    	elm.style.display = 'none'; 	
    } 
	
}

function deleteBoard(writeBoardNo){
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () { // 콜백함수
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	         
			var myModal = new bootstrap.Modal(document.getElementById('myModal'));
			myModal.show();
			
			}	
		}
	xhr.open("get" , "./deleteBoard?writeBoard_no="+writeBoardNo); //리퀘스트 세팅..
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); //AJAX로 리퀘스트함..
}	

function writeComment(){
    var commentValue = document.getElementById('commentInput').value;

    var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				//랜더링
               document.getElementById('commentInput').value="";
               refreshCommentList();
				}	
			}
		xhr.open("post" , "./writeComment"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("writeBoard_no=" + writeBoardNo + "&cafeComment_content=" + commentValue); //AJAX로 리퀘스트함..
}


function refreshCommentList(){
	var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function () { 
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); 
            
            var commentListBox = document.getElementById("commentList");
            commentListBox.innerHTML="";

            for(commentData of jsonObj.data){
            	
                var commentRowBox = document.createElement("div")
                commentRowBox.classList.add("row")
                commentRowBox.classList.add("pb-1")
                commentRowBox.classList.add("commentRow")
                commentRowBox.setAttribute("id","commentBox")

                var col1Box = document.createElement("div")
                col1Box.classList.add("col")
                col1Box.classList.add("border-bottom")
                col1Box.classList.add("border-balck")
                commentRowBox.appendChild(col1Box)

                var innerRow1 = document.createElement("div")
                innerRow1.classList.add("row")
                innerRow1.classList.add("py-2")
                col1Box.appendChild(innerRow1)

                var nickBox = document.createElement("div")
                nickBox.classList.add("col")
                nickBox.classList.add("fw-bold")
                nickBox.innerText = commentData.memberVo.mb_nick
                innerRow1.appendChild(nickBox)

                var tempCol1 = document.createElement("div")
                tempCol1.classList.add("col")
                innerRow1.appendChild(tempCol1)

                var innerRow2 = document.createElement("div")
                innerRow2.classList.add("row")
                innerRow2.classList.add("pb-2")
                col1Box.appendChild(innerRow2)

                var contentBox = document.createElement("div")
                contentBox.classList.add("col")
                contentBox.classList.add("commentCotent")
                contentBox.innerText = commentData.cafeCommentVo.cafeComment_content
                innerRow2.appendChild(contentBox)
                 
                 var innerRow3 = document.createElement("div")
                 innerRow3.classList.add("row")
                 innerRow3.classList.add("pb-2")
                 col1Box.appendChild(innerRow3)
                 
                 var dateBox = document.createElement("div")
                 dateBox.classList.add("col")
                 dateBox.classList.add("text-secondary")
                 var datefomat = new Date(commentData.cafeCommentVo.cafeComment_date)
                 dateBox.innerText = datefomat.toLocaleDateString();
                 innerRow3.appendChild(dateBox)

                 var tempCol2 = document.createElement("div")
                 tempCol2.classList.add("col")
                 innerRow3.appendChild(tempCol2)

                 var tempCol3 = document.createElement("div")
                 tempCol3.classList.add("col")
                 innerRow3.appendChild(tempCol3)

                 var innerRow4 = document.createElement("div")
                 innerRow4.classList.add("row")
                 tempCol3.appendChild(innerRow4)

                 var innerCol1 = document.createElement("div")
                 innerCol1.classList.add("col")
                 innerRow4.appendChild(innerCol1)

                 if(userNo == commentData.memberVo.mb_no){
                 	
 	                var deleteBox = document.createElement("div")
 	                deleteBox.classList.add("col")
 	                deleteBox.classList.add("d-grid")
 	                innerRow4.appendChild(deleteBox)
 	
 	                var deleteButton = document.createElement("button")
 	                deleteButton.setAttribute("onclick","deleteComment("+commentData.cafeCommentVo.cafeComment_no+")")
 	                deleteButton.classList.add("btn")
 	                deleteButton.classList.add("btn-outline-secondary")
 	                deleteButton.classList.add("btn-sm")
 	                deleteButton.innerHTML ="삭제"
 	                deleteBox.appendChild(deleteButton)
                 
                 }
                 var tempCol4 = document.createElement("div")
                 tempCol4.classList.add("col")
                 innerRow3.appendChild(tempCol4)

                 var innerRow5 = document.createElement("div")
                 innerRow5.classList.add("row")
                 tempCol4.appendChild(innerRow5)

                 if(userNo == commentData.memberVo.mb_no){
                 	
 	                var updateButtonBox = document.createElement("div")
 	                updateButtonBox.classList.add("col")
 	                updateButtonBox.classList.add("d-grid")
 	                innerRow5.appendChild(updateButtonBox)
 	
 	                var updateButton =document.createElement("button")
 	                updateButton.setAttribute("onclick", "showUpdateBox(this, "+commentData.cafeCommentVo.cafeComment_no+" )")
 	               // updateButton.setAttribute("onclick", "offDisplay()")
 	                updateButton.classList.add("btn")
 	                updateButton.classList.add("btn-outline-secondary")
 	                updateButton.classList.add("btn-sm")
 	                updateButton.innerHTML ="수정"
 	                updateButtonBox.appendChild(updateButton)
                 
                 }

                 var tempCol5 = document.createElement("div")
                 tempCol5.classList.add("col")
                 innerRow5.appendChild(tempCol5)

                 var innerRow6 =document.createElement("div")
                 innerRow6.classList.add("row")
                 col1Box.appendChild(innerRow6)

                 var updateColBox =document.createElement("div")
                 updateColBox.classList.add("col")
                 updateColBox.classList.add("updateCol")
                 innerRow6.appendChild(updateColBox)
                 
                 commentListBox.appendChild(commentRowBox);
			}	

		}
	}
	xhr.open("get" , "./getCommentList?writeBoard_no=" + writeBoardNo); 
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send(); 
	}
	
function deleteComment(commentNo){

    var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function () { 
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); 
            refreshCommentList();
			}	
		}
	xhr.open("get" , "./deleteComment?cafeComment_no="+commentNo); 
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xhr.send(); 
}

function showUpdateBox(target, commentNo){
    var updateColBoxes = document.getElementsByClassName("updateCol");

    for(e of updateColBoxes){
        e.innerHTML="";
    }

    var commentRowBox = target.closest(".commentRow");
    var updateColBox = commentRowBox.getElementsByClassName("updateCol")[0];
    
    var rowBox = document.createElement("div");
    rowBox.classList.add("row")

    var inputCol = document.createElement("div")
    inputCol.classList.add("col-9");
    rowBox.appendChild(inputCol)

    var textArea = document.createElement("textarea")
    textArea.classList.add("form-control")
    textArea.classList.add("updateText")

    commentValue = commentRowBox.getElementsByClassName("commentCotent")[0].innerText;
    textArea.value = commentValue;
    inputCol.appendChild(textArea);

    var buttonColBox = document.createElement("div")
    buttonColBox.classList.add("col");
    buttonColBox.classList.add("d-grid")
    rowBox.appendChild(buttonColBox)

    var updateButton = document.createElement("button")
    updateButton.setAttribute("onclick","updateComment(this,"+commentNo+")")
    updateButton.classList.add("btn")
    updateButton.classList.add("btn-outline-secondary")
    updateButton.classList.add("btn-sm")
    updateButton.innerText="수정"
    buttonColBox.appendChild(updateButton)
    
    var tempbuttonColBox = document.createElement("div")
    tempbuttonColBox.classList.add("col")
	rowBox.appendChild(tempbuttonColBox)
    
    updateColBox.appendChild(rowBox);
}

function updateComment(target, commentNo){
    var updateColBox = target.closest(".updateCol")
    var commentValue = updateColBox.getElementsByClassName("updateText")[0].value

    var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function () { 
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); 
            refreshCommentList();
			}	
		}
	xhr.open("post" , "./updateComment"); 
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xhr.send("cafeComment_no="+commentNo+"&cafeComment_content="+commentValue); 
}

function doLike(){
    var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function () { 
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); 
            refreshHeart();
            refreshTotalHeartCount();
			}	
		}
	xhr.open("get" , "./doLike?cafe_no="+cafeNo+"&writeBoard_no="+writeBoardNo); 
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xhr.send(); 
}

function refreshHeart(){
    var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function () { 
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); 
            
                var heartBox = document.getElementById("likeHeart");
                if(jsonObj.data == true){
                    heartBox.setAttribute("class", "bi bi-heart-fill text-danger");
	            }else{
	            	heartBox.setAttribute("class", "bi bi-heart text-danger");
	            }
                
			}	
		}
	xhr.open("get" , "./isLiked?writeBoard_no="+writeBoardNo+"&cafe_no="+cafeNo); 
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xhr.send(); 
}

function refreshTotalHeartCount(){
    var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function () { 
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); 
            
            var countBox = document.getElementById("likeCount");
            countBox.innerText = jsonObj.data;
			}	
		}
	xhr.open("get" , "./getTotalLikeCount?&writeBoard_no="+writeBoardNo); 
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
	xhr.send(); 
}

	window.addEventListener("DOMContentLoaded", function(){ 
		getUserNo();
		refreshCommentList();	
		refreshHeart();
		refreshTotalHeartCount();
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
                	<div class="row ms-5">
                		<div class="col">
		                    <div class="row py-4 px-4">
		                       <div class="row py-3">
		                       		<div class="col fw-bold fs-3"><i class="bi bi-layout-text-sidebar"></i>&nbsp;${cafeBoard_CategoryVo.cafeBoard_Category_name }
		                       		</div>
		                       </div>
		                    </div>
		                    <div class="row border border-balck ms-3"><!--보더 그릴꺼임-->
		                        <div class="col">
		                            <div class="row px-4"><!--제목, 작성자, 작성일, 조회수-->
		                                <div class="col border-bottom border-balck">
		                                    <div class="row py-4">
		                                        <div class="col fs-3 fst-normal" id="boardTitle">${data.writeBoardVo.writeBoard_title }</div>
		                                    </div>
		                                    <div class="row py-2">
		                                    	<div class="col-1 p-0 text-center"><!-- 이미지 -->
		                                    		<img class="img-fluid" src="/freeple/resources/img/cafe/cafe_profile.png" style="width:50px; height:50px;">
		                                    	</div>
		                                    	<div class="col-3">
				                                    <div class="row" id="nickname">
				                                    	<c:choose>
				                                    	<c:when test="${data.cafeMemberVo.cafeMember_nickname eq '카페닉네임를 만들어주세요' }">
				                                    		<div class="col p-0 fw-bolder">${data.memberVo.mb_nick }</div>
				                                    	</c:when>
				                                    	<c:otherwise>
				                                    		<div class="col p-0 fw-bolder">${data.cafeMemberVo.cafeMember_nickname }</div>
				                                    	</c:otherwise>
				                                    	</c:choose>
				                                    </div>
				                                    <div class="row pb-3">
				                                        <div class="col">
				                                            <div class="row">
					                                            <div class="col p-0"><fmt:formatDate value="${data.writeBoardVo.writeBoard_date}" pattern="yy.MM.dd.HH.dd"/></div>
					                                            <div class="col p-0 text-start">조회: ${data.writeBoardVo.writeBoard_readcount}</div>
				                                            </div>
				                                        </div>
				                                    </div>		                                    	
		                                    	</div>
		                                    </div>		                                    		                                    
		                                </div>
		                            </div>
		                            <div class="row px-4 py-5"><!--본문내용-->
		                                <div class="col">
		                                	<div class="row">
		                                		<div class="col"><!-- 본문 이미지 -->

<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="..." class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

		                                		</div>
		                                	</div>
		                                	<div class="row">
		                                		<div class="col">${data.writeBoardVo.writeBoard_cotent}</div>
		                                	</div> 
		                                </div>
		                            </div>
		                            <div class="row">
		                            	<div class="col">
		                                    <div class="row py-2">
		                                    	<div class="col-1 p-0 text-end"><!-- 이미지 -->
		                                    		<img class="img-fluid" src="/freeple/resources/img/cafe/cafe_profile.png" style="width:50px; height:50px;">
		                                    	</div>
		                                    	<div class="col-3"> <!-- 기능 추가해야함 -->
				                                    <div class="row mt-2" id="nickname">
				                                    	<c:choose>
				                                    	<c:when test="${data.cafeMemberVo.cafeMember_nickname eq '카페닉네임를 만들어주세요' }">
				                                    		<div class="col p-0 text-end fw-bolder">${data.memberVo.mb_nick }</div>
				                                    		<div class="col-9 p-0 text-start">님의 게시글 더보기<i class="bi bi-chevron-right"></i></div>
				                                    	</c:when>
				                                    	<c:otherwise>
				                                    		<div class="col-4 p-0 fw-bolder ms-3">${data.cafeMemberVo.cafeMember_nickname }</div>
				                                    		<div class="col p-0 text-start">님의 게시글 더보기<i class="bi bi-chevron-right"></i></div>
				                                    	</c:otherwise>
				                                    	</c:choose>
				                                    </div>	                                    	
		                                    	</div>
		                                    	<div class="col"></div>
		                                    </div>			                            	
		                            	</div>
		                            </div>
		                            <div class="row px-3"><!-- 하트 좋아요 -->
		                            	<div class="col-3">
		                            		<div class="row py-4">
		                            			<div class="col">
				                            		<div class="row">
						                            	<div class="col-4 text-end"><i id="likeHeart" class="bi bi-heart text-danger" onclick="doLike()"></i></div>
						                            	<div class="col p-0">좋아요&nbsp<span id="likeCount"></span></div>		                            			
				                            		</div>		                            			
		                            			</div>
		                            			<div class="col-7">
				                            		<div class="row">
						                            	<div class="col-3 text-end"><i class="bi bi-chat-dots"></i></div>
						                            	<div class="col p-0">댓글 ${countComment }</div>		                            			
				                            		</div>		                            			
		                            			</div>
		                            		</div>
		                            	</div>		                            
		                            </div>
		                            <div class="row px-4"><!-- 댓글 -->
		                            	<div class="col border-top border-balck py-4">
		                            		<div class="row pb-3">
		                            			<div class="col fw-bold">댓글</div>
		                            			<div class="col"></div>
		                            			<div class="col"></div>
		                            		</div>
		                            		<div class="row pb-3">
		                         				<div class="col-10">
		                         					<div class="row">
		                         						<textarea id="commentInput" class="form-control" placeholder="댓글을 남겨보세요"></textarea>
		                         					</div>
		                							<div class="row">
		                							</div>
		                         				</div>
		                         				<div class="col d-grid">
		                         					<button onclick="writeComment()" class="btn" style="color: #ab79d1; border: 2px solid #ab79d1;">댓글쓰기</button>
		                         				</div>
		                            		</div>
		                            		<div class="row">
		                           			<div class="col" id="commentList">
		                           				<div class="row"><!-- 댓글하나 -->
		                           					<div class="col">
		                           						<div class="row">
															<div class="col fw-bold">작성자</div>
															<div class="col"></div>
		                           						</div>
		                           						<div class="row">
		                           							<div class="col">내용내용</div>
		                           						</div>
		                           						<div class="row">
		                           							<div class="col text-secondary ">작성일</div>
		                           							<div class="col"></div>
		                           							<div class="col">
		                           								<div class="row">
		                           									<div class="col"></div>
		                           									<div class="col d-grid">
				                           								<button class="btn btn-outline-secondary btn-sm">
				                           								삭제
				                           								</button>
		                           									</div>
		                           								</div>
		                           							</div>
		                           							<div class="col">
		                           							    <div class="row">
		                           									<div class="col d-grid">
		                           										<button class="btn btn-outline-secondary btn-sm">
				                           								수정
				                           								</button>
		                           									</div>
		                           									<div class="col"></div>
		                           								</div>
		                           							</div>
		                           						</div>
		                           						<div class="row"><!-- 수정박스 -->
		                           							<div class="col updateCol"></div>
		                           						</div>
		                           					</div>
		                           				</div>
		                           			</div>
		                            		</div>
		                            	</div>
		                            </div>
		                        </div>
		                    </div>
                            <c:if test="${sessionUserInfo.mb_no == data.cafeMemberVo.mb_no}">
                            <div class="row px-3">
                            	<div class="col">
                            		<div class="row py-4">
		                            	<div class="col"></div>
		                            	<div class="col"></div>
		                            	<div class="col">
		                            		<div class="row">
		                            			<div class="col d-grid">
		                            				<a href="./updateWritePage?writeBoard_no=${data.writeBoardVo.writeBoard_no}" class="btn" style="color: #ab79d1; border: 2px solid #ab79d1;" type="button">
		                            					수정하기
		                            				</a>
		                            			</div>		
		                            		<!-- <div class="col d-grid"><button class="btn btn-outline-primary" onclick="deleteBoard(${data.writeBoardVo.writeBoard_no})">삭제</button></div>-->
		                            			<div class="col d-grid">
			                            			<button type="button" class="btn" style="color: #ab79d1; border: 2px solid #ab79d1;" onclick="deleteBoard(${data.writeBoardVo.writeBoard_no})">
													  삭제하기
													</button>
		                            			
												<!-- Modal -->
												<div class="modal fade" tabindex="-1" id="myModal" aria-labelledby="exampleModalLabel" aria-hidden="true"  data-bs-backdrop="static">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title" id="exampleModalLabel">알림</h5>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body">
												       	게시글이 삭제되었습니다
												      </div>
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
                            </div>
                            </c:if>		                    
		                    <div class="row py-4"><!--목록버튼-->
		                        <div class="col"></div>
		                        <div class="col-6 d-grid">
		                             <a class="btn" 
		                             href="./boardByCategoryPage?cafe_no=${cafeBoard_CategoryVo.cafe_no}&cafeBoard_Category_no=${cafeBoard_CategoryVo.cafeBoard_Category_no}" 
		                             role="button" style="background-color: #ab79d1; color: white;">
		                             목록으로
		                             </a>
		                        </div>
		                    	<div class="col"></div>
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
	

<!-- 지우지마 -->	
</div>	
</div>
<br><br><br>
<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>