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
<title>카페생성</title>

<style type="text/css">
    *{
    font-family : Jua;
    }
</style>

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
			                    <div class="col fw-bold fs-3"><i class="bi bi-pencil"></i>&nbsp;글 수정하기</div>
			                </div>
			                <div class="row"><!-- 글쓰기 -->
			                    <form action="./updateBoardProcess" method="post" enctype="multipart/form-data">
			                    <div class="col"><!-- 전송할 box -->
			                        <div class="row py-3">
			                            <div class="col">
			                                <select name="cafeBoard_Category_no" class="form-control">
			                                    <c:forEach items="${categoryList}" var="data">
			                                        <option value="${data.cafeBoard_CategoryVo.cafeBoard_Category_no}" 
			                                        <c:if test="${data.cafeBoard_CategoryVo.cafeBoard_Category_no == cafeBoard_CategoryVo.cafeBoard_Category_no}">selected="selected"</c:if>>
			                                        ${data.cafeBoard_CategoryVo.cafeBoard_Category_name}
			                                        </option>
			                                    </c:forEach>
			                                </select>
			                            </div>
			                        </div>
			                        <div class="row pb-3">
			                            <div class="col">
			                                <input class="form-control" type="text" name="writeBoard_title" value="${data.writeBoardVo.writeBoard_title }">
			                            </div>
			                        </div>
			                        <div class="row pb-3">
			                            <div class="col">
			                                <textarea class="form-control"  name="writeBoard_cotent" rows="10">${data.writeBoardVo.writeBoard_cotent}</textarea>
			                            </div>
			                        </div>
			                        <div class="row">
			                            <div class="col pb-3"><!-- 이미지는 어떻게 가져오지,? -->
			                                <input class="form-control" type="file" name="files" multiple accept="image/*">
			                            </div>								
			                        </div>
			                        <div class="row">
			                            <div class="col"></div>
			                            <div class="col-6 d-grid">
			                                <input type="hidden" name="cafeMember_no" value="${data.cafeMemberVo.cafeMember_no }">
			                                <input type="hidden" name="writeBoard_no" value="${data.writeBoardVo.writeBoard_no}">
			                                <button class="btn btn-outline-secondery" type="submit">작성하기</button>
			                            </div>
			                            <div class="col"></div>
			                        </div>
			                    </div>
			                    </form>
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
	
</div>	
</div>
<br><br><br>

<jsp:include page="../../global/mainBottom.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>