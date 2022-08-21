<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>캠페인 입력</title>
	
	<!-- 유효성 체크를 위한 common.js 파일 -->
	<script type="text/javascript" src="/resources/include/js/common.js"></script>
	
	
    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
	
	
    <!-- Custom styles for this template -->
    <link href="/resources/include/css/campaignBoardList.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
      textarea {
    width: 100%;
    height: 20.25em;
    
    border: none;
    resize: none;
  }
    </style>
     
    
    <script type="text/javascript">
    $(function () {
    	//유효성 체크를위한 부분
    	$("#boardInsertBtn").click(function () {
			if(!chkData('#c_title',"제목을")) return;
			else if(!chkData("#c_content","게시판리스트 설명을")) return;
			else if(!chkData("#c_detail_title","상세페이지 제목을")) return;
			else if(!chkData("#c_detail_content","상세페이지 내용을")) return;
			else if(!chkFile($("#file"))) return;
			else{
				if($("#file").val()!=""){
					if(!chkFile($("#file"))) return;
				}
				
				$("#f_writeForm").attr({
					"method" : "post",
					"enctype": "multipart/form-data",
					"action" : "/board/boardInsert"
				});
				$("#f_writeForm").submit();
			}
		});
    	
    	//라디오 버튼 유효성 체크
    	
    	
    	
    	/*입력 버튼 클릭 후 처리*/
		$("#boardInsertBtn").click(function () {
		
				$("#f_insertForm").attr({
					"method" : "post",
					"enctype": "multipart/form-data",
					"action" : "/admin/adminCampaignBoard/campaignBoardInsert"
				});
				$("#f_insertForm").submit();		
		});
    	
   	
	
    	
    	
	}); // 최상위 $ 
    
    </script>
    </head>
		<body>
			<div class="container">
			<form id="f_insertForm">
		   	<br>
			  <div class="form-group ">
			    <label for="file">게시판 대표이미지</label>
			    <input type="file"  id="file" name="file">
			  </div>
			  	  
			  <div class="form-group ">
			    <label for="cat_title">카테고리 선택</label>
			    <br>
			    
			    <label class="radio-inline">
				<input type="radio" id="cat_title1" name="cat_title" value="환경" checked="checked"> 환경
				</label>
				<label class="radio-inline">
				<input type="radio"  id="cat_title2" name="cat_title" value="동물"> 동물
				</label>
				
				<label class="radio-inline">
				<input type="radio"  id="cat_title3" name="cat_title"value="가정"> 가정
				</label>

			  </div>
			  
			  <div class="form-group ">
			    <label for="c_title">게시판 제목</label>
			    <input type="text" class="form-control input-lg" id="c_title" name="c_title" placeholder="리스트 제목을 입력하세요">
			  </div>
			  
			  <div class="form-group ">
			    <label for="c_content">게시판 소개</label>
			    <input type="text" class="form-control input-lg" id="c_content" name="c_content" placeholder="리스트 소개를 입력하세요.">
			  </div>
			  
			  
			  <div class="form-group ">
			    <label for="c_detail_title">게시판 디테일 소제목</label>
			    <input type="text" class="form-control input-lg" id="c_detail_title" name="c_detail_title" placeholder="게시판 디테일 소제목을 입력하세요.">
			  </div>
			  <br>
			  
			  <div class="form-group ">
			    <label for="c_detail_content">게시판 디테일 내용</label>
			    <textarea class="form-control" id="c_detail_content" name="c_detail_content" placeholder="게시판 디테일 내용을 입력하세요." 
			    rows="20"></textarea>
			  </div>
			  <br>
			  
			  <div class="form-group ">
			    <label for="c_detail_videoid">유튜브 링크</label>
			    <input type="text" class="form-control input-lg" id="c_detail_videoid" name="c_detail_videoid" placeholder="https://youtu.be/ 제외한 URL 값을 입력해주세요.">
			  </div>
			  <br>	
			
			  
			  <button type="submit" id="boardInsertBtn" class="btn btn-default">작성하기</button>
			  <button type="reset" class="btn btn-default">다시작성</button>
			  
			  <button type="button" class="btn btn-default" onclick="history.back()">목록</button>
			   
			</form>
			</div>
		</body>
</html>