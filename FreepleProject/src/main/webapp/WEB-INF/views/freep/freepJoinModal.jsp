<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
	#joinWindow-backgroud{
		position:fixed;
		z-index: 1000;
		top: 0;
		left: 0;
		width:100%;
		height:100%;
		background-color:rgba(88,88,88,0.8);
	}
	#joinWindow-joinWindowShow{
		position:fixed;
		z-index: 1010;
		top: 5%;
		left: 30%;
		width:40%;
		height:90%;
		background-color: white;
		border-radius: 20px;
	}
	
	.ui-state-default{
		background-color: #e4ceeb !important;
	}
	.ui-state-active{
		background-color: #8851db !important;
		border: 0 !important;
	}
	.ui-datepicker-header{
		background-color: #fcf2ff !important;
	}
	.ui-datepicker-calendar thead{
		font-size: 16pt !important;
	}
	.ui-datepicker{
		border: 1px solid #ecd8f2 !important;
		margin: auto;
	}
	
	.ui-icon-circle-triangle-w{
		visibility: hidden; 
	}
	.ui-icon-circle-triangle-e{
		visibility: hidden; 
	}
	.ui-datepicker-next{
		margin-top: 1%;
		background-image: url("../resources/img/monthIcon.png");
		background-repeat: no-repeat; 
		background-position: center center;
		background-size : cover;
	}
	.ui-datepicker-prev{
		margin-top: 1%;
		background-image: url("../resources/img/monthIcon.png");
		background-repeat: no-repeat; 
		background-position: center center;
		background-size : cover;
		transform:rotate(180deg);
	}

	.ui-datepicker-next:hover{
		background-image: url("../resources/img/monthIcon.png");
		background-repeat: no-repeat; 
		background-position: center center;
		background-size : cover;
		background-color: inherit;
		border: 1px solid #e2cfe8;
	}
	.ui-datepicker-prev:hover{
		background-image: url("../resources/img/monthIcon.png");
		background-repeat: no-repeat; 
		background-position: center center;
		background-size : cover;
		background-color: inherit;
		border: 1px solid #e2cfe8;
	}
	.ui-datepicker-next.ui-state-disabled{
		background-image: url("../resources/img/monthIcon.png");
		background-repeat: no-repeat; 
		background-position: center center;
		background-size : cover;
		background-color: inherit;
		border: 1px solid #e2cfe8;
	}
	.ui-datepicker-prev.ui-state-disabled{
		background-image: url("../resources/img/monthIcon.png");
		background-repeat: no-repeat; 
		background-position: center center;
		background-size : cover;
		background-color: inherit;
		border: 1px solid #e2cfe8;
	}
	.collapseDiv1{
		width: 100%;
		height: 10em;
		overflow: hidden;
		transition: height 0.5s;
	}
	.collapseDiv2{
		width: 100%;
		height: 9em;
		overflow: hidden;
		transition: height 0.5s;
	}
	.collapseUp{
		height: 0;
	}
	#couponDiv1:hover *{
		text-decoration: underline;
	}
	
</style>

<script type="text/javascript">

var disabledDays;

var payment_freepJoin_date=0;
var coupon_no=0;
var payment_method=0;

//Ajax로 해당 프립의 예약된 날짜들 가져와서 disabledDays에 저장함
function getReservationDates() {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);
						
			disabledDays=jsonObj.reservationDates; //disabledDays=["2022-8-3","2022-8-8"];
		}
	};	
	xhr.open("get","./getReservationDates?freep_no="+${fp_FreepVo.freep_no});
	xhr.send();
}


function joinWindowOpen() {
	if(payment_freepJoin_date==null) payment_freepJoin_date=0;
	
	document.body.style.overflow = "hidden";
	joinStep1();
	document.getElementById("joinWindow-backgroud").style.visibility="visible";
	document.getElementById("joinWindow-joinWindowShow").style.visibility="visible";
}

function joinWindowClose() {
	payment_freepJoin_date=0;
	coupon_no=0;
	payment_method=0;
	
	document.getElementById("joinNextBtn").innerText = '다음';
	
	//예약 단계 아이콘 초기화 - 싹다 안보이게
	document.getElementById("icon-step1").style.display="none";
	document.getElementById("icon-step1-fill").style.display="none";
	document.getElementById("icon-step2").style.display="none";
	document.getElementById("icon-step2-fill").style.display="none";
	document.getElementById("icon-step3").style.display="none";
	document.getElementById("icon-step3-fill").style.display="none";
		
	document.body.style.overflow = "visible";
	document.getElementById("joinWindow-backgroud").style.visibility="hidden";
	document.getElementById("joinWindow-joinWindowShow").style.visibility="hidden";
}

function applyCoupon(couponDiv1) {
	coupon_no = couponDiv1.firstChild.innerText;
	var couponInfoSpan0 = document.getElementById('couponInfoSpan0');
	couponInfoSpan0.innerHTML='';
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);
			
			couponInfoSpan0.innerText=jsonObj.fp_MemberCouponVo.coupon_expiration;
		
			var couponPriceSpan2 = document.createElement('span');
			couponPriceSpan2.innerText='-'+jsonObj.couponPriceStringFormat+"원";
			couponPriceSpan2.style.marginLeft='5%';
			couponInfoSpan0.appendChild(couponPriceSpan2);
			
			var couponSelectCancelBtn = document.createElement('button');
			couponSelectCancelBtn.style.marginLeft='1%';
			couponSelectCancelBtn.style.border=0;
			couponSelectCancelBtn.style.fontSize='11pt';
			couponSelectCancelBtn.style.fontWeight='normal';
			couponSelectCancelBtn.style.color='#615d63';
			couponSelectCancelBtn.style.backgroundColor='#faedf0';
			couponSelectCancelBtn.innerText='적용해제';
			couponSelectCancelBtn.setAttribute('onclick','couponSelectCancel()');
			
			couponInfoSpan0.appendChild(couponSelectCancelBtn);
			
			
			var showPaymentCouponInfoSpan = document.getElementById('showPaymentCouponInfoSpan');
			showPaymentCouponInfoSpan.innerText = jsonObj.fp_MemberCouponVo.coupon_expiration;
			
			var showPaymentCouponPriceSpan = document.getElementById('showPaymentCouponPriceSpan');
			showPaymentCouponPriceSpan.innerText = "-"+jsonObj.couponPriceStringFormat+"원";

			var showPaymentResultPriceSpan = document.getElementById('showPaymentResultPriceSpan');
			showPaymentResultPriceSpan.innerText = 
				(${fp_FreepVo.freep_price}-jsonObj.fp_MemberCouponVo.sale_price).toLocaleString('ko-KR')+"원";
				
		}
	};	
	xhr.open("get","./getOneCoupon?coupon_no="+couponDiv1.firstChild.innerText);
	xhr.send();
	
	document.getElementById('collapseDiv2').classList.toggle('collapseUp');
	document.getElementById('couponHeaderIcon').classList.toggle('bi-caret-up');
	
}

function selectCouponExist() {
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);
			
			var showPaymentCouponInfoSpan = document.getElementById('showPaymentCouponInfoSpan');
			showPaymentCouponInfoSpan.innerText = jsonObj.fp_MemberCouponVo.coupon_expiration;
			
			var showPaymentCouponPriceSpan = document.getElementById('showPaymentCouponPriceSpan');
			showPaymentCouponPriceSpan.innerText = "-"+jsonObj.couponPriceStringFormat+"원";

			var showPaymentResultPriceSpan = document.getElementById('showPaymentResultPriceSpan');
			showPaymentResultPriceSpan.innerText = 
				(${fp_FreepVo.freep_price}-jsonObj.fp_MemberCouponVo.sale_price).toLocaleString('ko-KR')+"원";
		}
	};	
	xhr.open("get","./getOneCoupon?coupon_no="+coupon_no);
	xhr.send();
}


function couponSelectCancel() {
	coupon_no=0;
	var couponInfoSpan0 = document.getElementById('couponInfoSpan0');
	couponInfoSpan0.innerHTML='';
	
	var couponInfoSpan1 = document.createElement('span');
	couponInfoSpan1.innerText = '사용가능 쿠폰 '
	couponInfoSpan0.appendChild(couponInfoSpan1);
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);
			
			var couponListSize = jsonObj.couponListSize;
			var couponInfoSpan2 = document.createElement('span');
			couponInfoSpan2.innerText = couponListSize+'장';
			couponInfoSpan2.style.color='#8719b3';
			couponInfoSpan0.appendChild(couponInfoSpan2);
		}
	};
	xhr.open("get","./getCouponList");
	xhr.send();
	
	
	var showPaymentCouponInfoSpan = document.getElementById('showPaymentCouponInfoSpan');
	showPaymentCouponInfoSpan.innerText = '쿠폰정보';
	
	var showPaymentCouponPriceSpan = document.getElementById('showPaymentCouponPriceSpan');
	showPaymentCouponPriceSpan.innerText = '-';
	
	var showPaymentResultPriceSpan = document.getElementById('showPaymentResultPriceSpan');
	showPaymentResultPriceSpan.innerText = document.getElementById('showPaymentFreepPriceSpan').innerText;
	
	
}



function joinStep1() {
	
	//예약 단계 아이콘 변경
	document.getElementById("icon-step1").style.display="none";
	document.getElementById("icon-step1-fill").style.display="inline";
	document.getElementById("icon-step2").style.display="inline";
	document.getElementById("icon-step2-fill").style.display="none";
	document.getElementById("icon-step3").style.display="inline";
	document.getElementById("icon-step3-fill").style.display="none";
	
	//이전,다음버튼 모양 및 기능 변경
	document.getElementById("joinPreBtn").style.display="none";//이전버튼은 안보이게
	document.getElementById("joinNextBtn").style.width="70%"; //다음버튼 가로 70%로
	document.getElementById("joinNextBtn").setAttribute('onClick','joinStep2()');//다음버튼 누르면 스텝2로
	
	var modalContentsDiv = document.getElementById("modalContentsDiv");
	modalContentsDiv.innerHTML="";
	
	var datepickerDiv = document.createElement('div');
	datepickerDiv.id='datepicker';
	
	var datepickTextDiv = document.createElement('div');
	
	var tempDiv1 = document.createElement('div');
	tempDiv1.innerText="오늘 진행되는 프립은 예약이 불가능합니다.";
	tempDiv1.classList.add("text-center");
	tempDiv1.style.fontSize='10pt';
	tempDiv1.style.color='red';
	datepickTextDiv.appendChild(tempDiv1);
	
	var tempDiv2 = document.createElement('div');
	tempDiv2.style.marginTop='3%';
	
	var tempSpan2 = document.createElement('span');
	tempSpan2.innerText="예약날짜 : ";
	tempSpan2.style.fontSize='17pt';
	tempDiv2.appendChild(tempSpan2);
	
	var datepickTextInput = document.createElement('input');
	datepickTextInput.type='text';
	datepickTextInput.id='datepickText';
	datepickTextInput.disabled='disabled';
	datepickTextInput.style='width: 30%';
	datepickTextInput.style.fontSize='17pt';
	tempDiv2.appendChild(datepickTextInput);
	
	datepickTextDiv.appendChild(tempDiv2);
	
	var tempDiv3 = document.createElement('div');
	tempDiv3.style.fontSize='17pt';
	tempDiv3.innerText='예약시간 : ${fp_FreepVo.freep_time}';
	datepickTextDiv.appendChild(tempDiv3);
	
	modalContentsDiv.appendChild(datepickerDiv);
	modalContentsDiv.appendChild(datepickTextDiv);

	$("#datepicker").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showMonthAfterYear:true // 월 - 년 순서가아닌 년도 - 월 순서
        ,showOtherMonths: false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,selectOtherMonths: false // 다른 달 출력된것 선택 가능.
        ,changeYear: false //option값 년 선택 가능
        ,changeMonth: false //option값 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: new Date("<fmt:formatDate value='${fp_FreepVo.freep_sale_end_date}' pattern='yyyy-MM-dd' />")  //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
		,beforeShowDay: disableSomeDay
    });                  
	
    //초기값 지정
    $('#datepicker').datepicker('setDate', payment_freepJoin_date);

    
    //선택 가능한 날짜만큼 이 함수가 실행되는거같음.
    //리턴값으로 [true]면 선택가능
    //리턴값으로 [false]면 선택불가능
    function disableSomeDay(date) {
		var month = date.getMonth();
		var dates = date.getDate();
		var year = date.getFullYear();
		
		for(var i=0 ; i<disabledDays.length; i++){
	    	if($.inArray(year+'-'+(month+1)+'-'+dates,disabledDays) != -1){
	    		return [false];
	    	}
	    }		
		return [true];
	}
    
    //기본 선택되어있는 날짜(이전눌렀을때 해당 전에 눌렀던 날짜 보이도록)
    if(payment_freepJoin_date!=0){
    	var dateBeforeFormat=payment_freepJoin_date;
    	var dateAfterFormat=
	    	dateBeforeFormat.split('-')[0]+'년 '+
	    	dateBeforeFormat.split('-')[1]+'월 '+
	    	dateBeforeFormat.split('-')[2]+'일';
    	$('#datepickText').val(dateAfterFormat);
    }
    
    //날짜 다른거 클릭했을때 이벤트 인풋text창에 날짜 출력
    $("#datepicker").on("change",function(){
    	payment_freepJoin_date=$(this).val();
    	
    	var dateBeforeFormat=payment_freepJoin_date;
    	var dateAfterFormat=
	    	dateBeforeFormat.split('-')[0]+'년 '+
	    	dateBeforeFormat.split('-')[1]+'월 '+
	    	dateBeforeFormat.split('-')[2]+'일';
    	$('#datepickText').val(dateAfterFormat);
    	//$('#datepickText').val($(this).val());
    });
    
}

function tempJoinStep1() {
	if(document.getElementById('paymentMethodRadioBtn1').checked){
		payment_method=document.getElementById('paymentMethodRadioBtn1').value;
	}else if(document.getElementById('paymentMethodRadioBtn2').checked){
		payment_method=document.getElementById('paymentMethodRadioBtn2').value;
	}else if(document.getElementById('paymentMethodRadioBtn3').checked){
		payment_method=document.getElementById('paymentMethodRadioBtn3').value;
	}else if(document.getElementById('paymentMethodRadioBtn4').checked){
		payment_method=document.getElementById('paymentMethodRadioBtn4').value;
	}else if(document.getElementById('paymentMethodRadioBtn5').checked){
		payment_method=document.getElementById('paymentMethodRadioBtn5').value;
	}else if(document.getElementById('paymentMethodRadioBtn6').checked){
		payment_method=document.getElementById('paymentMethodRadioBtn6').value;
	}
	
	joinStep1();
}
function tempJoinStep3() {
	var radioFlag = false;
	
	if(document.getElementById('paymentMethodRadioBtn1').checked){
		radioFlag=true;
		payment_method=document.getElementById('paymentMethodRadioBtn1').value;
	}else if(document.getElementById('paymentMethodRadioBtn2').checked){
		radioFlag=true;
		payment_method=document.getElementById('paymentMethodRadioBtn2').value;
	}else if(document.getElementById('paymentMethodRadioBtn3').checked){
		radioFlag=true;
		payment_method=document.getElementById('paymentMethodRadioBtn3').value;
	}else if(document.getElementById('paymentMethodRadioBtn4').checked){
		radioFlag=true;
		payment_method=document.getElementById('paymentMethodRadioBtn4').value;
	}else if(document.getElementById('paymentMethodRadioBtn5').checked){
		radioFlag=true;
		payment_method=document.getElementById('paymentMethodRadioBtn5').value;
	}else if(document.getElementById('paymentMethodRadioBtn6').checked){
		radioFlag=true;
		payment_method=document.getElementById('paymentMethodRadioBtn6').value;
	}
	
	if(radioFlag == false) {
		swal("결제 방법을 선택해주세요","", "warning");
		return;
	}
	
	joinStep3();
}

function joinStep2() {
	
	if(payment_freepJoin_date == 0){
		swal("예약 날짜를 선택해주세요","", "warning");
		return;
	}
	
	getCouponList();//쿠폰리스트 불러오는 ajax함수호출
	
	
	document.getElementById("icon-step1").style.display="inline";
	document.getElementById("icon-step1-fill").style.display="none";
	document.getElementById("icon-step2").style.display="none";
	document.getElementById("icon-step2-fill").style.display="inline";
	document.getElementById("icon-step3").style.display="inline";
	document.getElementById("icon-step3-fill").style.display="none";
	
	document.getElementById("joinPreBtn").style.display="inline";
	document.getElementById("joinPreBtn").setAttribute('onClick','tempJoinStep1()')
	document.getElementById("joinNextBtn").style.width="55%";
	document.getElementById("joinNextBtn").innerText = '다음';
	document.getElementById("joinNextBtn").setAttribute('onClick','tempJoinStep3()')
	
	
	
	var modalContentsDiv = document.getElementById("modalContentsDiv");
	modalContentsDiv.innerHTML="";
	
	//프립 간단정보 + 쿠폰선택 + 결제방식선택
	var paymentMethodDiv = document.createElement('div');
	
	
	//프립 간단정보
	var freepInfoDiv =  document.createElement('div');
	freepInfoDiv.style.fontSize = '13pt';
	freepInfoDiv.style.border = '1px solid #cfc1d9';
	freepInfoDiv.style.padding = '5%';
	
	var freepInfoHeaderDiv1 = document.createElement('div');
	
	var freepInfoHeaderDiv1_1 = document.createElement('div');
	freepInfoHeaderDiv1_1.innerText = '프립정보 : ${fp_FreepVo.freep_title}';
	freepInfoHeaderDiv1_1.style.fontWeight = 'bold';
	freepInfoHeaderDiv1_1.style.fontSize = '15pt';
	
	var freepInfoHeaderToggleButton = document.createElement('button');
	freepInfoHeaderToggleButton.style.border=0;
	freepInfoHeaderToggleButton.style.backgroundColor='white';
	freepInfoHeaderToggleButton.setAttribute('id','freepInfoHeaderToggleButton');
	freepInfoHeaderToggleButton.style.float='right';

	
	
	var freepInfoHeaderIcon = document.createElement('i');
	freepInfoHeaderIcon.classList.add('bi');
	freepInfoHeaderIcon.classList.add('bi-caret-down');
	freepInfoHeaderIcon.setAttribute('id','freepInfoHeaderIcon');
	freepInfoHeaderToggleButton.appendChild(freepInfoHeaderIcon);
	
	freepInfoHeaderDiv1_1.appendChild(freepInfoHeaderToggleButton);
	
	freepInfoHeaderDiv1.appendChild(freepInfoHeaderDiv1_1);
	
	freepInfoDiv.appendChild(freepInfoHeaderDiv1);
	
	//프립정보 콜랩스
	var collapseDiv1 = document.createElement('div');
	collapseDiv1.setAttribute('id','collapseDiv1');
	collapseDiv1.classList.add('collapseDiv1');
	collapseDiv1.classList.add('collapseUp');
	
	var hr1 = document.createElement('hr');
	hr1.style.height='2px';
	hr1.style.backgroundColor='#cfc1d9';
	collapseDiv1.appendChild(hr1);
	
	var freepInfoTitleDiv = document.createElement('div');
	freepInfoTitleDiv.innerText = '${fp_FreepVo.freep_title}';
	freepInfoTitleDiv.style.fontSize = '16pt';
	freepInfoTitleDiv.style.marginTop = '5%';
	collapseDiv1.appendChild(freepInfoTitleDiv);
	
	var tempRowDiv1 = document.createElement('div');
	tempRowDiv1.style.marginTop = '2%';

	var tempColDiv1 = document.createElement('div');
	tempColDiv1.style.width='60%';
	tempColDiv1.style.display='inline-block';
	
	var tempDiv1 = document.createElement('div');
	tempDiv1.innerText = '참여방식 : ${fp_FreepVo.freep_onoff}';
	tempColDiv1.appendChild(tempDiv1);
	
	var dateAfterFormat=
		payment_freepJoin_date.split('-')[0]+'년 '+
		payment_freepJoin_date.split('-')[1]+'월 '+
		payment_freepJoin_date.split('-')[2]+'일';
	
	var tempDiv2 = document.createElement('div');
	tempDiv2.innerText = '참여일시 : '+dateAfterFormat+' ${fp_FreepVo.freep_time}';
	tempColDiv1.appendChild(tempDiv2);
	
	var tempColDiv2 = document.createElement('div');
	tempColDiv2.style.width='40%';
	tempColDiv2.style.display='inline-block';
	
	var tempDiv3 = document.createElement('div');
	tempDiv3.innerText = '옵션정보 : 1인 / 당일 1회';
	tempColDiv2.appendChild(tempDiv3);
	
	var tempDiv4 = document.createElement('div');
	tempDiv4.innerText = '프립금액 : ${priceStringFormat}원';
	tempColDiv2.appendChild(tempDiv4);
	
	tempRowDiv1.appendChild(tempColDiv1);
	tempRowDiv1.appendChild(tempColDiv2);
	
	collapseDiv1.appendChild(tempRowDiv1);
	freepInfoDiv.appendChild(collapseDiv1);
	paymentMethodDiv.appendChild(freepInfoDiv);
	
	
	//쿠폰선택
	var couponDiv = document.createElement('div');
	couponDiv.style.marginTop = '2%';
	couponDiv.style.fontSize = '13pt';
	couponDiv.style.border = '1px solid #cfc1d9';
	couponDiv.style.padding = '5%';
	
	var couponHeaderDiv = document.createElement('div');
	
	var couponHeaderDiv1_1 = document.createElement('div');
	couponHeaderDiv1_1.style.fontSize = '15pt';
	couponHeaderDiv1_1.style.fontWeight = 'bold';
	couponHeaderDiv1_1.innerText = '쿠폰선택 : ';
	
	var couponInfoSpan0 = document.createElement('span');
	couponInfoSpan0.setAttribute('id','couponInfoSpan0');
	
	if(coupon_no>0){
		couponInfoSpan0.innerHTML='';
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState  == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				couponInfoSpan0.innerText=jsonObj.fp_MemberCouponVo.coupon_expiration;
			
				var couponPriceSpan2 = document.createElement('span');
				couponPriceSpan2.innerText='-'+jsonObj.couponPriceStringFormat+"원";
				couponPriceSpan2.style.marginLeft='5%';
				couponInfoSpan0.appendChild(couponPriceSpan2);
				
				var couponSelectCancelBtn = document.createElement('button');
				couponSelectCancelBtn.style.marginLeft='1%';
				couponSelectCancelBtn.style.border=0;
				couponSelectCancelBtn.style.fontSize='11pt';
				couponSelectCancelBtn.style.fontWeight='normal';
				couponSelectCancelBtn.style.color='#615d63';
				couponSelectCancelBtn.style.backgroundColor='#faedf0';
				couponSelectCancelBtn.innerText='적용해제';
				couponSelectCancelBtn.setAttribute('onclick','couponSelectCancel()');
				
				couponInfoSpan0.appendChild(couponSelectCancelBtn);
				
			}
		};	
		xhr.open("get","./getOneCoupon?coupon_no="+coupon_no);
		xhr.send();
	}else{
		coupon_no=0;
		
		var couponInfoSpan1 = document.createElement('span');
		couponInfoSpan1.innerText = '사용가능 쿠폰 '
		couponInfoSpan0.appendChild(couponInfoSpan1);
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState  == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var couponListSize = jsonObj.couponListSize;
				var couponInfoSpan2 = document.createElement('span');
				couponInfoSpan2.innerText = couponListSize+'장';
				couponInfoSpan2.style.color='#8719b3';
				couponInfoSpan0.appendChild(couponInfoSpan2);
			}
		};
		xhr.open("get","./getCouponList");
		xhr.send();	
	}
	
	couponHeaderDiv1_1.appendChild(couponInfoSpan0);	

	var couponHeaderToggleButton = document.createElement('button');
	couponHeaderToggleButton.style.border=0;
	couponHeaderToggleButton.style.backgroundColor='white';
	couponHeaderToggleButton.setAttribute('id','couponHeaderToggleButton');
	couponHeaderToggleButton.style.float='right';
	
	var couponHeaderIcon = document.createElement('i');
	couponHeaderIcon.classList.add('bi');
	couponHeaderIcon.classList.add('bi-caret-down');
	couponHeaderIcon.setAttribute('id','couponHeaderIcon');
	couponHeaderToggleButton.appendChild(couponHeaderIcon);
	
	couponHeaderDiv1_1.appendChild(couponHeaderToggleButton);
	couponHeaderDiv.appendChild(couponHeaderDiv1_1);
	couponDiv.appendChild(couponHeaderDiv);

	//쿠폰 콜랩스
	var collapseDiv2 = document.createElement('div');
	collapseDiv2.setAttribute('id','collapseDiv2');
	collapseDiv2.classList.add('collapseDiv2');
	collapseDiv2.classList.add('collapseUp');
			
	var couponHr2 = document.createElement('hr');
	couponHr2.style.height='2px';
	couponHr2.style.backgroundColor='#cfc1d9';
	collapseDiv2.appendChild(couponHr2);
	
	function getCouponList() {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState  == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				if(jsonObj.couponListSize==0){//쿠폰이 없을때
					var noCouponDiv = document.createElement('div');
					noCouponDiv.innerText="사용가능한 쿠폰이 없습니다.";
					collapseDiv2.appendChild(noCouponDiv);
				}else{//쿠폰 있을때
					var couponList = jsonObj.couponList;
					
					var existCouponListDiv = document.createElement('div');
					
					for(var map of couponList){
						var couponDiv1 = document.createElement('div');
						couponDiv1.style.cursor='pointer';
						couponDiv1.setAttribute('id','couponDiv1');
						couponDiv1.setAttribute('onclick','applyCoupon(this)');
						couponDiv1.style.margin='2%';
						
						var couponHiddenDiv = document.createElement('div');
						couponHiddenDiv.style.display='none';
						couponHiddenDiv.innerText=map.fp_MemberCouponVo.coupon_no;
						couponDiv1.appendChild(couponHiddenDiv);
						
						var couponExpirationDiv = document.createElement('div');
						couponExpirationDiv.innerText = map.fp_MemberCouponVo.coupon_expiration;
						couponExpirationDiv.style.width='60%';
						couponExpirationDiv.style.display='inline-block';
						couponDiv1.appendChild(couponExpirationDiv);
						
						var couponPriceDiv = document.createElement('div');
						couponPriceDiv.innerText = "-"+map.couponPriceStringFormat+"원";
						couponPriceDiv.style.width='20%';
						couponPriceDiv.style.display='inline-block';
						couponPriceDiv.style.float='right';
						couponDiv1.appendChild(couponPriceDiv);
						
						existCouponListDiv.appendChild(couponDiv1);
					}
										
					collapseDiv2.appendChild(existCouponListDiv);
					
				}
				
			}
		};	
		xhr.open("get","./getCouponList");
		xhr.send();
	}
	
	couponDiv.appendChild(collapseDiv2);
	
	paymentMethodDiv.appendChild(couponDiv);
	
	
	var showPaymentDiv = document.createElement('div');
	showPaymentDiv.style.marginBottom='2%';
	showPaymentDiv.style.marginLeft='2%';
	showPaymentDiv.style.marginRight='2%';
	showPaymentDiv.style.marginTop='4%';
	showPaymentDiv.style.fontSize='13pt';
	
	
	var showPaymentTitleDiv = document.createElement('div');
	showPaymentTitleDiv.innerText='결제금액';
	showPaymentTitleDiv.style.fontSize='15pt';
	showPaymentTitleDiv.style.fontWeight='bold';
	showPaymentDiv.appendChild(showPaymentTitleDiv);
	
	var showPaymentFreepDiv = document.createElement('div');
	showPaymentFreepDiv.style.marginTop='8%';
	showPaymentFreepDiv.style.marginLeft='15%';
	showPaymentFreepDiv.style.marginRight='20%';
	
	var showPaymentFreepInfoSpan = document.createElement('span');
	showPaymentFreepInfoSpan.innerText='1인/당일 1회 프립금액';
	showPaymentFreepDiv.appendChild(showPaymentFreepInfoSpan);
	
	var showPaymentFreepPriceSpan = document.createElement('span');
	showPaymentFreepPriceSpan.innerText='${priceStringFormat}원';
	showPaymentFreepPriceSpan.setAttribute('id','showPaymentFreepPriceSpan');
	showPaymentFreepPriceSpan.style.float='right';
	showPaymentFreepDiv.appendChild(showPaymentFreepPriceSpan);
	
	showPaymentDiv.appendChild(showPaymentFreepDiv);
	
	var showPaymentCoupon = document.createElement('div');
	showPaymentCoupon.style.marginTop='1%';
	showPaymentCoupon.style.marginLeft='15%';
	showPaymentCoupon.style.marginRight='20%';
	
	var showPaymentCouponInfoSpan = document.createElement('span');
	showPaymentCouponInfoSpan.innerText = '쿠폰정보';
	
	showPaymentCouponInfoSpan.setAttribute('id','showPaymentCouponInfoSpan');
	showPaymentCoupon.appendChild(showPaymentCouponInfoSpan);
	
	var showPaymentCouponPriceSpan = document.createElement('span');
	showPaymentCouponPriceSpan.innerText = '-';
		
	showPaymentCouponPriceSpan.style.float = 'right';
	showPaymentCouponPriceSpan.setAttribute('id','showPaymentCouponPriceSpan');
	showPaymentCoupon.appendChild(showPaymentCouponPriceSpan);
	
	showPaymentDiv.appendChild(showPaymentCoupon);
	
	var paymentMethodHr1 = document.createElement('hr');
	paymentMethodHr1.style.backgroundColor='#828282';
	paymentMethodHr1.style.margin='auto';
	paymentMethodHr1.style.marginTop='5%';
	paymentMethodHr1.style.width='80%';
	paymentMethodHr1.style.height='1px';
	showPaymentDiv.appendChild(paymentMethodHr1);
	
	var showPaymentResult = document.createElement('div');
	showPaymentResult.style.marginTop='1%';
	showPaymentResult.style.marginLeft='15%';
	showPaymentResult.style.marginRight='20%';
	
	var showPaymentResultInfoSpan = document.createElement('span');
	showPaymentResultInfoSpan.innerText = '총 결제 금액';
	showPaymentResult.appendChild(showPaymentResultInfoSpan);
	
	var showPaymentResultPriceSpan = document.createElement('span');
	showPaymentResultPriceSpan.innerText = showPaymentFreepPriceSpan.innerText;

	showPaymentResultPriceSpan.style.float = 'right';
	showPaymentResultPriceSpan.setAttribute('id','showPaymentResultPriceSpan');
	showPaymentResultPriceSpan.style.fontWeight='bold';
	showPaymentResult.appendChild(showPaymentResultPriceSpan);
	
	showPaymentDiv.appendChild(showPaymentResult);
	paymentMethodDiv.appendChild(showPaymentDiv);
	
	var paymentMethodHr2 = document.createElement('hr');
	paymentMethodHr2.style.backgroundColor='#cfc1d9';
	paymentMethodHr2.style.height='4px';
	paymentMethodHr2.style.marginTop='10%';
	paymentMethodDiv.appendChild(paymentMethodHr2);
	
	//결제방식 선택
	var paymentMethodInnerDiv = document.createElement('div');
	paymentMethodInnerDiv.style.margin='2%';
	paymentMethodInnerDiv.style.paddingBottom='15%';
	
	var paymentMethodHeaderDiv = document.createElement('div');
	paymentMethodHeaderDiv.innerText = '결제방법';
	paymentMethodHeaderDiv.style.fontSize='15pt';
	paymentMethodHeaderDiv.style.fontWeight='bold';
	paymentMethodInnerDiv.appendChild(paymentMethodHeaderDiv);
	
	var paymentMethodRealDiv = document.createElement('div');
	paymentMethodRealDiv.style.fontSize='13pt';
	paymentMethodRealDiv.style.fontWeight='';
	paymentMethodRealDiv.style.marginTop='2%';
	
	
	var paymentMethodBigSpan1=document.createElement('span');
	paymentMethodBigSpan1.style.width='33.33%';
	paymentMethodBigSpan1.style.display='inline-block';
	
	var radioBtn1 = document.createElement('input');
	radioBtn1.type='radio';
	radioBtn1.name='payment_method';
	radioBtn1.value='신용/체크카드';
	radioBtn1.style.width='17px';
	radioBtn1.style.height='17px';
	radioBtn1.setAttribute('id','paymentMethodRadioBtn1');
	paymentMethodBigSpan1.appendChild(radioBtn1);
	
	var paymentMethodSpan1 = document.createElement('span');
	paymentMethodSpan1.innerText='신용/체크카드';
	paymentMethodBigSpan1.appendChild(paymentMethodSpan1);
	
	paymentMethodRealDiv.appendChild(paymentMethodBigSpan1);
	
	var paymentMethodBigSpan2=document.createElement('span');
	paymentMethodBigSpan2.style.width='33.33%';
	paymentMethodBigSpan2.style.display='inline-block';
	
	var radioBtn2 = document.createElement('input');
	radioBtn2.type='radio';
	radioBtn2.name='payment_method';
	radioBtn2.value='실시간계좌이체';
	radioBtn2.style.width='17px';
	radioBtn2.style.height='17px';
	radioBtn2.setAttribute('id','paymentMethodRadioBtn2');
	paymentMethodBigSpan2.appendChild(radioBtn2);
	
	var paymentMethodSpan2 = document.createElement('span');
	paymentMethodSpan2.innerText='실시간계좌이체';
	paymentMethodBigSpan2.appendChild(paymentMethodSpan2);
	
	paymentMethodRealDiv.appendChild(paymentMethodBigSpan2);
	
	var paymentMethodBigSpan3=document.createElement('span');
	paymentMethodBigSpan3.style.width='33.33%';
	paymentMethodBigSpan3.style.display='inline-block';
	
	var radioBtn3 = document.createElement('input');
	radioBtn3.type='radio';
	radioBtn3.name='payment_method';
	radioBtn3.value='무통장입금';
	radioBtn3.style.width='17px';
	radioBtn3.style.height='17px';
	radioBtn3.setAttribute('id','paymentMethodRadioBtn3');
	paymentMethodBigSpan3.appendChild(radioBtn3);
	
	var paymentMethodSpan3 = document.createElement('span');
	paymentMethodSpan3.innerText='무통장입금';
	paymentMethodBigSpan3.appendChild(paymentMethodSpan3);
	
	paymentMethodRealDiv.appendChild(paymentMethodBigSpan3);
	
	var paymentMethodBigSpan4=document.createElement('span');
	paymentMethodBigSpan4.style.width='33.33%';
	paymentMethodBigSpan4.style.display='inline-block';
	
	var radioBtn4 = document.createElement('input');
	radioBtn4.type='radio';
	radioBtn4.name='payment_method';
	radioBtn4.value='모바일결제';
	radioBtn4.style.width='17px';
	radioBtn4.style.height='17px';
	radioBtn4.setAttribute('id','paymentMethodRadioBtn4');
	paymentMethodBigSpan4.appendChild(radioBtn4);
	
	var paymentMethodSpan4 = document.createElement('span');
	paymentMethodSpan4.innerText='모바일결제';
	paymentMethodBigSpan4.appendChild(paymentMethodSpan4);
	
	paymentMethodRealDiv.appendChild(paymentMethodBigSpan4);
	
	var paymentMethodBigSpan5=document.createElement('span');
	paymentMethodBigSpan5.style.width='33.33%';
	paymentMethodBigSpan5.style.display='inline-block';
	
	var radioBtn5 = document.createElement('input');
	radioBtn5.type='radio';
	radioBtn5.name='payment_method';
	radioBtn5.value='토스';
	radioBtn5.style.width='17px';
	radioBtn5.style.height='17px';
	radioBtn5.setAttribute('id','paymentMethodRadioBtn5');
	paymentMethodBigSpan5.appendChild(radioBtn5);
	
	var paymentMethodSpan5 = document.createElement('span');
	paymentMethodSpan5.innerText='토스';
	paymentMethodBigSpan5.appendChild(paymentMethodSpan5);
	
	paymentMethodRealDiv.appendChild(paymentMethodBigSpan5);

	var paymentMethodBigSpan6=document.createElement('span');
	paymentMethodBigSpan6.style.width='33.33%';
	paymentMethodBigSpan6.style.display='inline-block';
	
	var radioBtn6 = document.createElement('input');
	radioBtn6.type='radio';
	radioBtn6.name='payment_method';
	radioBtn6.value='카카오페이';
	radioBtn6.style.width='17px';
	radioBtn6.style.height='17px';
	radioBtn6.setAttribute('id','paymentMethodRadioBtn6');
	paymentMethodBigSpan6.appendChild(radioBtn6);
	
	var paymentMethodSpan6 = document.createElement('span');
	paymentMethodSpan6.innerText='카카오페이';
	paymentMethodBigSpan6.appendChild(paymentMethodSpan6);
	
	paymentMethodRealDiv.appendChild(paymentMethodBigSpan6);
	
	paymentMethodInnerDiv.appendChild(paymentMethodRealDiv);
	
	paymentMethodDiv.appendChild(paymentMethodInnerDiv);
	
	
	
	modalContentsDiv.appendChild(paymentMethodDiv);
	
	var radioBtnArray = document.getElementsByName('payment_method');
	
	for(var i=0;i<radioBtnArray.length;i++){
		if(radioBtnArray[i].value==payment_method){
			radioBtnArray[i].checked=true;
		}
	}
	
	
	//프립정보 접기 토글
	document.getElementById("freepInfoHeaderToggleButton").addEventListener("click",function (){
		document.getElementById('collapseDiv1').classList.toggle('collapseUp');//콜랩스 올라가기
		document.getElementById('freepInfoHeaderIcon').classList.toggle('bi-caret-up');//콜랩스 버튼 모양바꾸기
	});
	
	//쿠폰선택 접기 토글
	document.getElementById("couponHeaderToggleButton").addEventListener("click",function (){
		document.getElementById('collapseDiv2').classList.toggle('collapseUp');//콜랩스 올라가기
		document.getElementById('couponHeaderIcon').classList.toggle('bi-caret-up');//콜랩스 버튼 모양바꾸기
	});
	
	if(coupon_no!=0) selectCouponExist();
	
}

function joinStep3() {

	
	document.getElementById("icon-step1").style.display="inline";
	document.getElementById("icon-step1-fill").style.display="none";
	document.getElementById("icon-step2").style.display="inline";
	document.getElementById("icon-step2-fill").style.display="none";
	document.getElementById("icon-step3").style.display="none";
	document.getElementById("icon-step3-fill").style.display="inline";
	
	document.getElementById("joinPreBtn").style.display="inline";
	document.getElementById("joinPreBtn").setAttribute('onClick','joinStep2()')
	document.getElementById("joinNextBtn").style.width="55%";
	document.getElementById("joinNextBtn").innerText = '결제하기';
	document.getElementById("joinNextBtn").setAttribute('onClick','goMyReservedFreepPage()')

	var modalContentsDiv = document.getElementById("modalContentsDiv");
	modalContentsDiv.innerHTML='';
	
	var finalCheckDiv = document.createElement('div');
	finalCheckDiv.style.margin='2%';
	finalCheckDiv.style.marginTop='0';
	finalCheckDiv.style.fontSize='13pt';
	
	var finalCheckHeader = document.createElement('div');
	finalCheckHeader.innerText = '결제최종확인';
	finalCheckHeader.style.fontSize='15pt';
	finalCheckHeader.style.fontWeight='bold';
	finalCheckHeader.style.marginLeft='2%';
	finalCheckDiv.appendChild(finalCheckHeader);
	
	var finalCheckHr1 = document.createElement('hr');
	finalCheckHr1.style.backgroundColor='#cfc1d9';
	finalCheckHr1.style.height='4px';
	finalCheckDiv.appendChild(finalCheckHr1);
	
	var finalCheckFreepInfoDiv = document.createElement('div');
	finalCheckFreepInfoDiv.style.marginLeft='5%';
	finalCheckFreepInfoDiv.style.marginRight='5%';
	
	
	var finalCheckFreepInfoHeaderDiv = document.createElement('div');
	finalCheckFreepInfoHeaderDiv.style.fontWeight='bold';
	finalCheckFreepInfoHeaderDiv.style.marginTop='5%';
	finalCheckFreepInfoHeaderDiv.style.marginBottom='2%';
	finalCheckFreepInfoHeaderDiv.style.marginLeft='2%';
	finalCheckFreepInfoDiv.appendChild(finalCheckFreepInfoHeaderDiv);
	
	var finalCheckFreepTitleDiv = document.createElement('div');
	finalCheckFreepTitleDiv.innerText = '프립명 : ';
	
	var finalCheckFreepTitleInnerSpan = document.createElement('span');
	finalCheckFreepTitleInnerSpan.innerText = '${fp_FreepVo.freep_title}';
	finalCheckFreepTitleDiv.appendChild(finalCheckFreepTitleInnerSpan);
	finalCheckFreepInfoDiv.appendChild(finalCheckFreepTitleDiv);
	
	var finalCheckFreepDateDiv = document.createElement('div');
	finalCheckFreepDateDiv.innerText = '참여일시 : ';
	
	var dateBeforeFormat=payment_freepJoin_date;
	var dateAfterFormat=											
    	dateBeforeFormat.split('-')[0]+'년 '+
    	dateBeforeFormat.split('-')[1]+'월 '+
    	dateBeforeFormat.split('-')[2]+'일';
	
	var finalCheckFreepDateInnerSpan = document.createElement('span');
	finalCheckFreepDateInnerSpan.innerText = dateAfterFormat+' ${fp_FreepVo.freep_time}';
	finalCheckFreepDateDiv.appendChild(finalCheckFreepDateInnerSpan);
	
	finalCheckFreepInfoDiv.appendChild(finalCheckFreepDateDiv);
	
	var finalCheckFreepOnOffDiv = document.createElement('div');
	finalCheckFreepOnOffDiv.innerText = '참여방식 : ';
	
	var finalCheckFreepOnOffInnerSpan = document.createElement('span');
	finalCheckFreepOnOffInnerSpan.innerText = '${fp_FreepVo.freep_onoff}';
	finalCheckFreepOnOffDiv.appendChild(finalCheckFreepOnOffInnerSpan);
	
	finalCheckFreepInfoDiv.appendChild(finalCheckFreepOnOffDiv);
	
	var finalCheckFreepOptionDiv = document.createElement('div');
	finalCheckFreepOptionDiv.innerText = '옵션정보 : 1인 / 당일 1회';
	finalCheckFreepInfoDiv.appendChild(finalCheckFreepOptionDiv);
	
	var finalCheckPayMethodDiv = document.createElement('div');
	finalCheckPayMethodDiv.innerText = '결제방식 : '+payment_method;
	finalCheckFreepInfoDiv.appendChild(finalCheckPayMethodDiv);
	
	finalCheckDiv.appendChild(finalCheckFreepInfoDiv);
	
	var finalCheckHr2 = document.createElement('hr');
	finalCheckHr2.style.backgroundColor='#cfc1d9';
	finalCheckHr2.style.height='4px';
	finalCheckDiv.appendChild(finalCheckHr2);
	
	
	
	var showPaymentDiv = document.createElement('div');
	showPaymentDiv.style.marginBottom='2%';
	showPaymentDiv.style.marginLeft='2%';
	showPaymentDiv.style.marginRight='2%';
	showPaymentDiv.style.marginTop='4%';
	showPaymentDiv.style.fontSize='13pt';
	
	
	var showPaymentTitleDiv = document.createElement('div');
	showPaymentTitleDiv.innerText='결제금액';
	showPaymentTitleDiv.style.fontSize='15pt';
	showPaymentTitleDiv.style.fontWeight='bold';
	showPaymentDiv.appendChild(showPaymentTitleDiv);
	
	var showPaymentFreepDiv = document.createElement('div');
	showPaymentFreepDiv.style.marginTop='5%';
	showPaymentFreepDiv.style.marginLeft='15%';
	showPaymentFreepDiv.style.marginRight='20%';
	
	var showPaymentFreepInfoSpan = document.createElement('span');
	showPaymentFreepInfoSpan.innerText='1인/당일 1회 프립금액';
	showPaymentFreepDiv.appendChild(showPaymentFreepInfoSpan);
	
	var showPaymentFreepPriceSpan = document.createElement('span');
	showPaymentFreepPriceSpan.innerText='${priceStringFormat}원';
	showPaymentFreepPriceSpan.setAttribute('id','showPaymentFreepPriceSpan');
	showPaymentFreepPriceSpan.style.float='right';
	showPaymentFreepDiv.appendChild(showPaymentFreepPriceSpan);
	
	showPaymentDiv.appendChild(showPaymentFreepDiv);
	
	var showPaymentCoupon = document.createElement('div');
	showPaymentCoupon.style.marginTop='1%';
	showPaymentCoupon.style.marginLeft='15%';
	showPaymentCoupon.style.marginRight='20%';
	
	var showPaymentCouponInfoSpan = document.createElement('span');
	showPaymentCouponInfoSpan.innerText = '쿠폰정보';
	
	showPaymentCouponInfoSpan.setAttribute('id','showPaymentCouponInfoSpan');
	showPaymentCoupon.appendChild(showPaymentCouponInfoSpan);
	
	var showPaymentCouponPriceSpan = document.createElement('span');
	showPaymentCouponPriceSpan.innerText = '-';
		
	showPaymentCouponPriceSpan.style.float = 'right';
	showPaymentCouponPriceSpan.setAttribute('id','showPaymentCouponPriceSpan');
	showPaymentCoupon.appendChild(showPaymentCouponPriceSpan);
	
	showPaymentDiv.appendChild(showPaymentCoupon);
	
	var paymentMethodHr1 = document.createElement('hr');
	paymentMethodHr1.style.backgroundColor='#828282';
	paymentMethodHr1.style.margin='auto';
	paymentMethodHr1.style.marginTop='5%';
	paymentMethodHr1.style.width='80%';
	paymentMethodHr1.style.height='1px';
	showPaymentDiv.appendChild(paymentMethodHr1);
	
	var showPaymentResult = document.createElement('div');
	showPaymentResult.style.marginTop='1%';
	showPaymentResult.style.marginLeft='15%';
	showPaymentResult.style.marginRight='20%';
	
	var showPaymentResultInfoSpan = document.createElement('span');
	showPaymentResultInfoSpan.innerText = '총 결제 금액';
	showPaymentResult.appendChild(showPaymentResultInfoSpan);
	
	var showPaymentResultPriceSpan = document.createElement('span');
	showPaymentResultPriceSpan.innerText = showPaymentFreepPriceSpan.innerText;

	showPaymentResultPriceSpan.style.float = 'right';
	showPaymentResultPriceSpan.setAttribute('id','showPaymentResultPriceSpan');
	showPaymentResultPriceSpan.style.fontWeight='bold';
	showPaymentResult.appendChild(showPaymentResultPriceSpan);
	
	showPaymentDiv.appendChild(showPaymentResult);
	finalCheckDiv.appendChild(showPaymentDiv);
	
	
	modalContentsDiv.appendChild(finalCheckDiv);
	
	if(coupon_no!=0) selectCouponExist();

}

function goMyReservedFreepPage() {
	location.href="../freep/reserveFreepProcess"
			+"?payment_freepJoin_date="+payment_freepJoin_date
			+"&coupon_no="+coupon_no
			+"&payment_method="+payment_method
			+"&freep_no=${fp_FreepVo.freep_no}";
}

window.addEventListener("DOMContentLoaded",function(){
	getReservationDates();
	document.getElementById("joinWindow-backgroud").addEventListener("click",joinWindowClose);

});
</script>

</head>
<body>

<div id="joinWindow-backgroud" style="visibility: hidden;"></div>	
<div id="joinWindow-joinWindowShow" style="visibility: hidden; color: #300057">
	<div style="width: 100%; height: 100%; padding: 2%; font-size: 20pt">		
		<div class="row" style="height:10%; padding-top:2%; padding-left:3%; padding-right:3%; border-bottom: 1px solid black;">
			<div class="col">
				<span style="font-weight: bold">프립예약</span>
				<i class="bi bi-x-lg fs-4" style="cursor: pointer; float: right;" onclick="joinWindowClose()"></i>
			</div>
		</div>
		<div class="row" style="height:10%">
			<div class="col" style="color: #8851db; font-size: 25pt; width: auto">
				<div class="row" style="padding-top: 1%">
					<div class="col"></div>
					<div class="col-1 text-center" style="width: auto;">
						<i class="bi bi-1-square" id="icon-step1" style="display: none"></i>
						<i class="bi bi-1-square-fill" id="icon-step1-fill" style="display: none;"></i>
						<div style="font-size: 10pt">날짜예약</div>
					</div>
					<div class="col-2">
						<hr style="height: 1px; background-color: #8851db; margin-top: 20%">
					</div>
					<div class="col-1 text-center" style="width: auto;">
						<i class="bi bi-2-square" id="icon-step2" style="display: none;"></i>
						<i class="bi bi-2-square-fill" id="icon-step2-fill" style="display: none;"></i>
						<div style="font-size: 10pt">결제방법</div>
					</div>
					<div class="col-2">
						<hr style="height: 1px; background-color: #8851db; margin-top: 20%">
					</div>
					<div class="col-1 text-center" style="width: auto;">
						<i class="bi bi-3-square" id="icon-step3" style="display: none;"></i>
						<i class="bi bi-3-square-fill" id="icon-step3-fill" style="display: none;"></i>
						<div style="font-size: 10pt">최종확인</div>
					</div>
					<div class="col"></div>
				</div>
			</div>
		</div>
		<div class="row" style="height:69%; padding-top:2%; padding-left:3%; padding-right:3%; overflow-y: scroll auto; overflow-x: hidden;">
			<div class="col" id="modalContentsDiv">			
				<!-- 모달 내용. 원래 비어있음. 자바스크립트에서 렌더링. 필요하면 에이잭스도 -->
			</div>
		</div>
		
		
		<div class="row" style="height: 13%">
			<div class="col text-center" style="padding-top:2%;">
				<button style="width: 15%;height: 70%; font-size: 17pt; background-color: #8851db; color: white" class="btn" onclick="joinWindowClose()">취소</button>
				<button style="width: 15%;height: 70%; font-size: 17pt; background-color: #8851db; color: white; display: none;" class="btn" id="joinPreBtn">이전</button>
				<button style="width: 70%;height: 70%; font-size: 17pt; background-color: #8851db; color: white" class="btn" id="joinNextBtn">다음</button>
			</div>
		</div>

	</div>
</div>


</body>

