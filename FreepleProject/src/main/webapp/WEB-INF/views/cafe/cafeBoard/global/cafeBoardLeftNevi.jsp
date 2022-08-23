<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!--네비바-->
     <div class="row">
         <div class="col">
             <div class="row border-2 border-top black mt-3 py-3"><!--상단-->
                 <div class="col p-0 text-center fw-bold">카페정보</div>
                 <div class="col p-0 text-center">나의활동</div><!--나중에 ajax-->
             </div>
             <div class="row pb-3"><!--프로필-->
                 <div class="col-3 p-0" >
                     <img class="rounded-3 img-fluid" src="/uploadFiles/${cafeVo.cafe_image_link }">
                 </div>
                 <div class="col p-0">
                     <div class="row">
                         <div class="col-5 p-0 text-end">매니저</div>
						 <div class="col fw-bolder text-start">${memberList[0].cafeMemberVo.cafeMember_nickname }</div>
                     </div>
                     <div class="row py-2 mt-2">
                     <div class="col text-center">개설일 <fmt:formatDate value="${cafeVo.cafe_date}" pattern="yyyy.MM.dd"/></div>
                     </div>
                 </div>  
             </div>
             <c:if test="${!empty sessionUserInfo && cafeMemberVo.cafe_no == cafeVo.cafe_no &&cafeMemberVo.cafe_grade == 1}">
             <div class="row border-top black py-3">
                 <div class="col d-grid">
                     <a class="btn btn-secondary" href="../cafeMemberManagePage?cafe_no=${cafeVo.cafe_no}" role="button">카페 관리</a>
                 </div>
             </div>
             <div class="row">
                 <div class="col d-grid">
                     <a role="button" class="btn btn-outline-secondary" href="../cafeMemberManagePage?cafe_no=${cafeVo.cafe_no }">회원관리</a>
                 </div>
             </div>
             <div class="row pt-1">
                 <div class="col d-grid">
                     <a role="button" class="btn btn-outline-secondary" href="../requestToJoinPage?cafe_no=${cafeVo.cafe_no }">가입요청목록</a>
                 </div>
             </div>
             <div class="row pt-1 pb-3">
                 <div class="col d-grid">
                     <a role="button" class="btn btn-outline-secondary" href="./cafeBoardSettingPage?cafe_no=${cafeVo.cafe_no }">게시판 관리</a>
                 </div>
             </div>  
			</c:if>           
             <div class="row border-top black py-3"><!---->
                 <div class="col">
                     <div class="row">
                         <div class="col text-end">카페주제 ></div>
                         <div class="col text-start">여행</div>
                     </div>
                     <div class="row">
                         <div class="col text-end">회원수 : ${cafeVo2.cafeMember_limit}</div>
                         <div class="col text-start">(${cafeVo.cafeMember_limit})</div>
                     </div>
                 </div>
             </div>
             <c:if test="${!empty sessionUserInfo && sessionUserInfo.mb_no == cafeMemberVo.mb_no}">
             <div class="row border-top black py-2"><!--글쓰기-->
                 <div class="col d-grid">
                     <a role="button" class="btn btn-secondary" href="./writeCafeBoardPage?cafe_no=${cafeVo.cafe_no}">카페 글쓰기</a>
                 </div>
             </div>
             </c:if>
             <c:if test="${!empty sessionUserInfo && sessionUserInfo.mb_no != cafeMemberVo.mb_no && sessionUserInfo.mb_no != requestToJointVo.mb_no}">
             <div class="row black py-2">
                 <div class="col d-grid"><!--가입하기-->
                     <a role="button" class="btn btn-primary" href="../registerCafeMemberPage?cafe_no=${cafeVo.cafe_no }">가입하기</a>
                 </div>
             </div>
             </c:if>
         </div>
     </div>
     <div class="row border-2 border-top">
     	<div class="col">
     		<div class="row border-bottom border-balck py-2">
     			<div class="col d-grid">
     			<a href="../cafeBoard/fullCafeBoardPage?cafe_no=${cafeVo.cafe_no}" class="btn btn-outline-secondery" role="button">
     			전체글 보기
     			</a>
     			</div>
     		</div>
     	     <c:forEach items="${categoryList}" var="data"> 
		     <div class="row border-bottom border-balck py-2"><!--카테고리-->
		         <div class="col text-center p-0">
		             <a class="btn btn-outline-secondery" 
		             href="../cafeBoard/boardByCategoryPage?cafe_no=${data.cafeBoard_CategoryVo.cafe_no }&cafeBoard_Category_no=${data.cafeBoard_CategoryVo.cafeBoard_Category_no}" 
		             role="button">
		                 ${data.cafeBoard_CategoryVo.cafeBoard_Category_name}</a>
		         </div>
		     </div>
		     </c:forEach>
     	</div>
     </div>