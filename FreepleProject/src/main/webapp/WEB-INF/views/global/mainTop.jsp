<!-- 상단바 시작   상단바 시작   상단바 시작   상단바 시작   상단바 시작   상단바 시작   상단바 시작    -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--  외부링크  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Jua&family=Poor+Story&display=swap')
	;

body {
	margin: 0 auto;
	padding: 0 auto;
}

.globalTopRow1>* {
	margin-top: 0.7em;
}

.search-btn {
	text-decoration: none;
	float: right;
	width: 30px;
	height: 30px;
	background-color: #fff;
	border-radius: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #8f2cdb;
}

.search-box {
	margin-left: 0;
	margin-top: 7px;
	padding-top: 4px;
	padding-right: 4px;
	position: absolute;
	transform: translate(-10%, 0%);
	height: 40px;
	background-color: #fff;
	border: 1px solid #ab79d1;
	border-radius: 30px;
	transition: 0.4s;
	width: 17%;
	box-shadow: 0px 0px .5px 1px #ab79d1;
}

.search-txt {
	display: flex;
	padding-top: 0;
	padding-right: 0;
	padding-bottom: 0;
	padding-left: 20px;
	width: 83%;
	border: none;
	background: none;
	outline: none;
	float: left;
	font-size: 1.1em;
	line-height: 30px;
	transition: .4s;
}

<
div class ="a " style ="transition: .4s ;">doucu.classList.remove( "a ")
	 ; doucu.classList.add( "b ") ; .a {
	width: 100px;
}

.b {
	width: 200px;
}

.search-txt::-webkit-input-placeholder {
	color: #a6a6a6;
	font-weight: normal;
}

.temp-search-txt2::-webkit-input-placeholder {
	color: #7927f5;
	font-weight: bold;
}

.temp-search-txt3::-webkit-input-placeholder {
	color: #a6a6a6;
	font-weight: normal;
}

#fixed-bar {
	position: fixed;
	top: 0;
	transition: .5s;
	padding: 0;
	z-index: 100;
}

.fixed-bar-beforeScroll {
	background-color: white;
	width: 100%;
}

.fixed-bar-afterScroll {
	background-color: #f2e8ff;
	width: 100%;
	transform: translate(0%, -5em);
}

.row-temp1 {
	height: 7em;
	padding-top: 3em;
	padding-bottom: 6em;
	margin: 0;
	width: 100%;
	border-bottom: 3px solid #f5edfa;
	transition: .5s;
}

.categoryAHover:hover .categoryUnderLine {
	text-decoration: underline;
}
</style>


<script type="text/javascript">

	function goLoginPage() {
		//swal("로그인이 필요한 서비스입니다","", "");
		// /freeple/member/login/loginPage
		swal({
			title:'로그인이 필요한 서비스입니다',
			text:'로그인을 해주세요',
			buttons: {
				value:false
			}
		}).then(function () {
			location.href='/freeple/member/login/loginPage';	
		});
		
	}

	function categoryMenu() {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				var categoryList = jsonObj.categoryList;
				var categoryListSize = jsonObj.categoryListSize;

				var categoryDiv1 = document.getElementById('categoryDiv1');
				categoryDiv1.innerHTML="";
				for(var i=0;i<Math.ceil(categoryListSize/4);i++){
					var rowDiv = document.createElement('div');
					rowDiv.classList.add('row');
					for(var j=i*4;j<i*4+4;j++){
						var colDiv = document.createElement('div');
						colDiv.classList.add('col');
						colDiv.classList.add('text-center');
						if(j<categoryListSize){
							var aTag = document.createElement('a');
							aTag.href = "/freeple/freep/freepListPage?freep_ctg_no="
									+ categoryList[j].freep_ctg_no;
							aTag.style.color='#e6e6ff';
							aTag.style.textDecoration='none';
							aTag.classList.add('categoryAHover');
							
							var outerDiv = document.createElement('div');							
							var imgTag = document.createElement('img');
// 							imgTag.src='/freeple/'+categoryList[j].freep_ctg_fileName;
// 							imgTag.style.width='100%';
// 							imgTag.style.height='8em';
// 							imgTag.style.objectFit='cover';
// 							imgTag.style.borderRadius='15px';
// 							outerDiv.appendChild(imgTag);
							
// 							var divTag = document.createElement('div');
// 							divTag.style.textAlign='right';
// 							divTag.style.marginTop='-2em';
// 							divTag.style.marginBottom='2em';
// 							divTag.style.paddingRight='1em';
// 							divTag.style.fontSize='15pt';
// 							divTag.style.color='#fef2ff';
// 							divTag.style.fontWeight='bold';
// 							divTag.style.textShadow='4px 4px 6px black';
// 							divTag.innerText=categoryList[j].freep_ctg_name;
// 							outerDiv.appendChild(divTag);
							
							var divTag = document.createElement('div');
							divTag.classList.add('categoryUnderLine');
							divTag.style.width='100%';
							divTag.style.height='6.5em';
							divTag.style.borderRadius='15px';
							divTag.style.textAlign='right';
							divTag.style.marginBottom='1em';
							divTag.style.paddingRight='1em';
							divTag.style.paddingTop='4.5em';
							divTag.style.fontSize='15pt';
							divTag.style.color='#fef2ff';
							divTag.style.fontWeight='bold';
							divTag.style.textShadow='4px 4px 6px black';
							divTag.style.backgroundImage = "url('/freeple/"+categoryList[j].freep_ctg_fileName+"')";
							divTag.style.backgroundPosition = 'center';
							divTag.style.backgroundRepeat = 'no-repeat';
							divTag.style.backgroundSize = 'cover';
							divTag.style.opacity='0.85';
							divTag.innerText=categoryList[j].freep_ctg_name;

							outerDiv.appendChild(divTag);

							
							aTag.appendChild(outerDiv);
							colDiv.appendChild(aTag);
						}
						rowDiv.appendChild(colDiv);
					}
					categoryDiv1.appendChild(rowDiv);
				}
			}
		};

		xhr.open("get", "/freeple/main/getCategory");
		xhr.send();
	}
	

	
	function search() {
		var searchTextBox = document.getElementById("searchTextBox");
		var searchWord= searchTextBox.value;
		if(searchWord == ''){
			searchTextBox.classList.add('temp-search-txt2');
			
			setTimeout(function () {
				searchTextBox.classList.remove('temp-search-txt2');
				searchTextBox.classList.add('temp-search-txt3');
				setTimeout(function () {
					searchTextBox.classList.remove('temp-search-txt3');
					searchTextBox.classList.add('temp-search-txt2');
					setTimeout(function () {
						searchTextBox.classList.remove('temp-search-txt2');
						searchTextBox.classList.add('temp-search-txt3');
						setTimeout(function () {
							searchTextBox.classList.remove('temp-search-txt3');
							searchTextBox.classList.add('temp-search-txt2');
							setTimeout(function () {
								searchTextBox.classList.remove('temp-search-txt2');
								searchTextBox.classList.add('temp-search-txt3');
								setTimeout(function () {
									searchTextBox.classList.remove('temp-search-txt3');
									searchTextBox.classList.add('temp-search-txt2');
									setTimeout(function () {
										searchTextBox.classList.remove('temp-search-txt2');
										searchTextBox.classList.add('temp-search-txt3');
										setTimeout(function () {
											searchTextBox.classList.remove('temp-search-txt3');
										},150);
									},150);
								},150);
							},150);
						},150);
					},150);
				},150);
			},150);
			
			return;	
		}
		location.href="/freeple/freep/freepListPage?searchWord="+searchWord;
	}
	

	window.addEventListener("scroll", (event) => {
		var scrollY = window.scrollY || document.documentElement.scrollTop;
		
	    if(scrollY > 0){
	    	document.getElementById("fixed-bar").classList.remove("fixed-bar-beforeScroll");
			document.getElementById("fixed-bar").classList.add("fixed-bar-afterScroll");
			document.getElementById("well-side1").classList.remove("well-side-temp");
			document.getElementById("well-side2").classList.remove("well-side-temp");
			
			$('.temp-search-box').mouseover(function () {
				$('.temp-search-box').css('width','17%').css('box-shadow','0px 0px .5px 1px #ab79d1');
				$('.temp-search-txt').css('width','83%').css('padding-left','20px');
			});//330 240
			$('.temp-search-box').mouseout(function () {
				$('.temp-search-box').css('width','60px').css('box-shadow','0');
				$('.temp-search-txt').css('width','0').css('padding','0');
			});
			$('.temp-search-txt').focus(function () {
				$('.search-box').removeClass('temp-search-box');
				$('.search-txt').removeClass('temp-search-txt');
			});
			$('.temp-search-txt').blur(function () {
				$('.search-box').addClass('temp-search-box');
				$('.search-txt').addClass('temp-search-txt');
				$('.temp-search-box').css('width','60px').css('box-shadow','0');
				$('.temp-search-txt').css('width','0').css('padding','0');
			});
			
			$('.temp-search-box').css('width','60px').css('box-shadow','0');
			$('.temp-search-txt').css('width','0').css('padding','0');
			$('.row-temp1').css('padding-bottom','4.5em');
			
	    }else{
	    	document.getElementById("fixed-bar").classList.remove("fixed-bar-afterScroll");
			document.getElementById("fixed-bar").classList.add("fixed-bar-beforeScroll");
			document.getElementById("well-side1").classList.add("well-side-temp");
			document.getElementById("well-side2").classList.add("well-side-temp");
			
			$('.temp-search-box').css('width','17%').css('box-shadow','0px 0px .5px 1px #ab79d1');
			$('.temp-search-txt').css('width','83%').css('padding-left','20px');
			$('.row-temp1').css('padding-bottom','6em');
	    }
	    

	});
	

</script>




<!-- style="font-family: 'Poor Story', cursive;" -->
<div class="container-fluid"
	style="position: absolute; width: 99.1%; margin: 0; padding: 0; font-family: 'Jua';"
	id="mainTopParent">

	<div class="row fixed-bar-beforeScroll" id="fixed-bar"
		style="width: 100%; margin: 0; padding: 0;">
		<div class="col" style="padding: 0">
			<div class="row globalTopRow1"
				style="background-color: #f2e8ff; height: 3em;">
				<div class="col-3"></div>
				<div class="col">
					<div class="row">
						<div class="col-2" style="width: auto">
							<c:if test="${empty sessionUserInfo}">
								<a href="/freeple/host/login/hostLoginPage"
									style="color: #ab79d1; text-decoration: none;">호스트센터</a>
							</c:if>
							<c:if test="${not empty sessionUserInfo}">
								<a href="/freeple/host/center/hostCenterPage"
									style="color: #ab79d1; text-decoration: none;">호스트센터</a>
							</c:if>
							<a href="/freeple/board/mainPage"
								style="color: #ab79d1; text-decoration: none;">&nbsp;&nbsp;&nbsp;자유게시판</a>


						</div>
						<div class="col"></div>
						<div class="col">
							<div class="row">
								<div class="col"></div>

								<!-- 로그인 안되어있을때 -->
								<c:if test="${empty sessionUserInfo}">

									<div class="col-2 text-center" style="width: auto;">
										<a href="/freeple/member/signup/signupPage"
											style="color: #ab79d1; text-decoration: none">회원가입</a>
									</div>
									<div class="col-2 text-center" style="width: auto;">
										<a href="/freeple/member/login/loginPage"
											style="color: #ab79d1; text-decoration: none">로그인</a>
									</div>
								</c:if>

								<!-- 로그	인 되어있을때 -->
								<c:if test="${not empty sessionUserInfo}">
									<div class="col-2 text-center" style="width: auto;">
										<a href="/freeple/main/myPage"
											style="color: #ab79d1; text-decoration: none;">${sessionUserInfo.mb_nick}님</a>
									</div>
									<div class="col-2 text-center" style="width: auto;">
										<a href="/freeple/member/login/logoutProcess"
											style="color: #ab79d1; text-decoration: none;">로그아웃</a>
									</div>
									<div class="col-2 text-center" style="width: auto;">
										<a href="" style="color: #ab79d1; text-decoration: none;">공지사항</a>
									</div>
								</c:if>

							</div>
						</div>

					</div>
				</div>
				<div class="col-3"></div>
			</div>

			<div class="row row-temp1">
				<div class="col-3"></div>
				<div class="col">
					<div class="row">
						<div class="col-2">
							<!-- 카테고리 버튼 -->
							<div class="text-center" data-bs-toggle="collapse"
								data-bs-target="#collapseCategory" role="button"
								aria-expanded="false" aria-controls="collapseCategory"
								style="cursor: pointer;" onclick="categoryMenu()">
								<i class="bi bi-list"
									style="display: block; font-size: 2.4em; margin-top: -0.1em; margin-bottom: -0.2em; color: #9460d6;"></i>
								<span style="font-size: 0.9em; display: block; color: #ab79d1;">카테고리</span>
							</div>

						</div>
						<div class="col-3">
							<a href="/freeple/main/mainPage"> <img
								src="/freeple/resources/img/freepleLogo3.png" width="90%"
								style="transform: translate(-10%, -10%);">
							</a>
						</div>
						<div class="col">

							<!-- 검색창 -->
							<div class="search-box temp-search-box">
								<input type="text" id="searchTextBox"
									class="search-txt temp-search-txt" name="searchWord"
									placeholder="검색어를 입력해주세요." spellcheck="false"
									autocomplete="off"
									onkeyup="if(window.event.keyCode==13){search()}"> <a
									class="search-btn temp-search-btn"> <i class="bi bi-search"
									style="cursor: pointer;" onclick="search()"></i>
								</a>
							</div>

						</div>
						<div class="col">
							<div class="row">
								<div class="col-2"></div>
								<div class="col text-center" style="width: auto;">
									<a href="/freeple/cafe/cafeListPage"
										style="text-decoration: none"> <i class="bi bi-cup-hot"
										style="color: #a273de; font-size: 19pt; display: block;"></i>
										<span style="display: block; color: #ab79d1;">카페</span>
									</a>
								</div>
								<div class="col text-center" style="width: auto;">
									<a href="/freeple/feed/feedMainPage"
										style="text-decoration: none"> <i class="bi bi-pencil"
										style="color: #a273de; font-size: 19pt; display: block;"></i>
										<span style="display: block; color: #ab79d1;">피드</span>
									</a>
								</div>
								<div class="col text-center" style="width: auto;">
									<a href="" style="text-decoration: none"> <i
										class="bi bi-bookmark-fill"
										style="color: #a273de; font-size: 19pt; display: block;"></i>
										<span style="display: block; color: #ab79d1;">저장</span>
									</a>
								</div>
								<div class="col text-center" style="width: auto;">
									<c:if test="${empty sessionUserInfo}">
										<span onclick="goLoginPage()"
											style="text-decoration: none; cursor: pointer;"> <i
											class="bi bi-person-fill"
											style="color: #a273de; font-size: 25pt; display: block; margin-top: -3px"></i>
											<span
											style="display: block; margin-top: -8px; color: #ab79d1;">마이</span>
										</span>
									</c:if>
									<c:if test="${not empty sessionUserInfo}">
										<a href="/freeple/main/myPage" style="text-decoration: none">
											<i class="bi bi-person-fill"
											style="color: #a273de; font-size: 25pt; display: block; margin-top: -3px"></i>
											<span
											style="display: block; margin-top: -8px; color: #ab79d1;">마이</span>
										</a>
									</c:if>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="col-3"></div>
			</div>

			<div class="row">
				<div class="col well-side-temp" id="well-side1"></div>
				<div class="col-7">

					<!-- 콜랩스 카테고리 리스트 -->
					<div class="collapse" id="collapseCategory">
						<div class="card card-body"
							style="border-radius: 0 0 20px 20px; border-top: 0px; border-right: 3px solid #f5edfa; border-left: 3px solid #f5edfa; border-bottom: 3px solid #f5edfa; background-color: #f9f5ff; padding-bottom: 0;">
							<div id="categoryDiv1"></div>
						</div>
					</div>

				</div>
				<div class="col well-side-temp" id="well-side2"></div>
			</div>
		</div>

	</div>
</div>
<div style="height: 12.2em;"></div>

<!-- 상단바 끝  상단바 끝  상단바 끝  상단바 끝  상단바 끝  상단바 끝  상단바 끝  상단바 끝  상단바 끝  상단바 끝   -->