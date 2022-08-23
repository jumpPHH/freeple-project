<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">


	var userNo = 0; //참고 0은 비회원으로 인지함
	var review_no = ${review_no};
	
	
	function writeComment(){
		
		
		var commentValue = document.getElementById("commentInput").value;
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				document.getElementById("commentInput").value = "";	
				
				refreshCommentList();
				
			}
		}
		
		xhr.open("post" , "./writeFeedComment"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("review_no=" + review_no + "&feed_comment=" + commentValue); //AJAX로 리퀘스트함..		
		
	}
	
	function refreshCommentList(){
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var commentListBox = document.getElementById("CommentList");
				commentListBox.innerHTML = "";
				
				for(commentData of jsonObj.data){
					
					var commentRowBox = document.createElement("div");
					commentRowBox.classList.add("row");
					commentRowBox.classList.add("commentRow");
					
					var col1 = document.createElement("div");
					col1.classList.add("col");
					commentRowBox.appendChild(col1);
					
					var innerRow1 = document.createElement("div");
					innerRow1.classList.add("row");
					col1.appendChild(innerRow1);
					
					var nicknameBox = document.createElement("div");
					nicknameBox.classList.add("col-2");
					nicknameBox.classList.add("text-secondary");
					nicknameBox.innerText = commentData.fp_MemverVo.mb_nick; //값 세팅..
					innerRow1.appendChild(nicknameBox);
					
					var contentBox = document.createElement("div");
					contentBox.classList.add("col-6");
					contentBox.classList.add("feed_comment"); //내가 사용할 녀석..
					contentBox.innerText = commentData.fp_FreepFeedCommentVo.feed_comment;
					innerRow1.appendChild(contentBox);
					
					var dateBox = document.createElement("div");
					dateBox.classList.add("col-2");
					dateBox.innerText = commentData.fp_FreepFeedCommentVo.feed_commentwritedate;
					
				
					innerRow1.appendChild(dateBox);
					
					if(userNo == commentData.fp_FreepFeedCommentVo.member_no){
						var deleteBox = document.createElement("div");
						deleteBox.setAttribute("onclick" , "deleteComment("+commentData.fp_FreepFeedCommentVo.comment_no+")");
						deleteBox.classList.add("col");
						deleteBox.classList.add("text-danger");
						deleteBox.innerText = "X";
						innerRow1.appendChild(deleteBox);
						
						var updateBox = document.createElement("div");
						updateBox.setAttribute("onclick" , "showUpdateBox(this , "+commentData.fp_FreepFeedCommentVo.comment_no+")");
						updateBox.classList.add("col");
						updateBox.classList.add("text-success");
						updateBox.innerText = "수정";
						innerRow1.appendChild(updateBox);
					}
					
					var innerRow2 = document.createElement("div");
					innerRow2.classList.add("row");
					col1.appendChild(innerRow2);
					
					var updateColBox = document.createElement("div");
					updateColBox.classList.add("col");
					updateColBox.classList.add("updateCol"); // << 이건 css용 아님...
					innerRow2.appendChild(updateColBox);
					
					commentListBox.appendChild(commentRowBox);
					
				}
				
			}
		}
		
		xhr.open("get" , "./getFeedCommentList?review_no=" + review_no); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..		
		
	}
	
	function deleteComment(comment_no){
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				refreshCommentList();
			}
		}
		
		xhr.open("get" , "./deleteFeedComment?comment_no=" + comment_no); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..		
	}
	
	function showUpdateBox(target , comment_no){
		
		var updateColBoxes = document.getElementsByClassName("updateCol");
		for(e of updateColBoxes){
			e.innerHTML = "";
		}
		
		
		var commentRowBox = target.closest(".commentRow");
		var updateColBox = commentRowBox.getElementsByClassName("updateCol")[0];
		
		
		var rowBox = document.createElement("div");
		rowBox.classList.add("row");
		
		var inputCol = document.createElement("div");
		inputCol.classList.add("col-8");
		rowBox.appendChild(inputCol);
		
		var textArea = document.createElement("textarea");
		textArea.classList.add("form-control");
		textArea.classList.add("updateText");
		commentValue = commentRowBox.getElementsByClassName("feed_comment")[0].innerText;
		textArea.value = commentValue;
		inputCol.appendChild(textArea);

		var buttonColBox = document.createElement("div");
		buttonColBox.classList.add("col");
		buttonColBox.classList.add("d-grid");
		rowBox.appendChild(buttonColBox);
		
		var updateButton = document.createElement("button");
		updateButton.setAttribute("onclick" , "updateComment(this,"+comment_no+")");
		updateButton.classList.add("btn");
		updateButton.classList.add("btn-primary");
		updateButton.innerText = "수정";
		buttonColBox.appendChild(updateButton);
		
		updateColBox.appendChild(rowBox);
		
	}
	
	function updateComment(target , comment_no){
			
			var updateColBox = target.closest(".updateCol");
			var commentValue = updateColBox.getElementsByClassName("updateText")[0].value;
			
			var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					refreshCommentList();
				}
			}
			
			xhr.open("post" , "./updateFeedComment"); //리퀘스트 세팅..
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send("comment_no=" + comment_no + "&feed_comment=" + commentValue); //AJAX로 리퀘스트함..		
			
		}
		
		
		
		window.addEventListener("DOMContentLoaded" , function (){
			//사실상 처음 실행하는 코드 모음...
			getUserNo();
			refreshCommentList();
			
			//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
			
		});


</script>
<style type="text/css">
.font-team {
	font-family: Jua;
}
</style>
<meta charset="UTF-8">
<title>피드작성페이지</title>
<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	<link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
</head>
<body>
	<jsp:include page="../global/mainTop.jsp"></jsp:include>
	<div style="width: 1200px; margin: 0 auto">
		<div class="container-fluid">

			<div class="row">
				<div class="col"></div>
			</div>

			<div class="row">
				<div class="col">
					<div class="row my-5">
						<div class="col-2"></div>
						<div class="col-6 font-team">
							<h3>댓글작성</h3>
						</div>
					
						</div>
					</div>
				</div>
				<div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-8">
				<textarea id="commentInput" class="form-control" placeholder="댓글을 입력해 주세요."></textarea>
			</div>
			<div class="col d-grid">
				<input type="hidden" name="member_no" value="${sessionUserInfo.mb_no }">
				<input type="hidden" name="review_no" value="${reviewdata.fp_FreepReviewVo.review_no }">
				<button onclick="writeComment()" class="btn btn-primary" style="font-size:15px; background-color: #a273de; border-color:  #a273de;">입력</button>
			</div>
		</div>
		<div class="row mt-3">
			<div id="CommentList" class="col">
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col text-secondary ">작성자</div>
							<div class="col-6 bg-primary text-white">댓글</div>
							<div class="col">작성일자</div>
							<div class="col text-danger">삭제</div>
							<div class="col text-success">수정</div>
						</div>
						<div class="row">
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
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<jsp:include page="../global/mainBottom.jsp"></jsp:include>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>