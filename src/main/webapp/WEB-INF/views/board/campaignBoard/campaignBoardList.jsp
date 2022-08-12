<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>캠페인 리스트</title>

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
    
    <!-- Bootstrap core CSS -->
	<style type="text/css">
	  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail p {
    margin-top: 15px;
    color: #555;
  }
   .btn {
   	border: 1px solid #333;
    padding: 10px 20px;
    background-color: #fff;
    color: #000;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #58D64A;
    color: #fff;
  }

   .container {
    padding: 80px 120px;
  }
	</style>
	
	
</head>


  <body>
  <!-- 카테고리 시작 -->
 <div class="container text-center">
  <h3>카테고리</h3>
  <br>
  <div class="row">
    <div class="col-sm-3">     
      <img src="/resources/images/icon/allpick.png" class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>전체</strong></p><br>
    </div>
    <div class="col-sm-3">      
      <img src="/resources/images/icon/environment.png" class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>환경</strong></p><br>
    </div>
    <div class="col-sm-3">     
      <img src="/resources/images/icon/pet-house.png" class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>동물</strong></p><br>
    </div>
    <div class="col-sm-3">      
      <img src="/resources/images/icon/home.png" class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>가정</strong></p><br>
    </div>
  </div>
</div>
    
<!-- 카테고리 끝 -->
	
<!-- 보드 리스트 -->
<div id="tour" class="bg-1">
  <div class="container">
    <h3 class="text-center">캠페인 목록</h3>
    <p class="text-center">작은 실천으로,<br> 힘을 모아요!</p>

    
    <div class="row text-left">
    <!-- 예시 데이터 구현시 삭제할 부분 -->
      <div class="col-sm-4">
	        <div class="thumbnail">
	          <img src="/resources/images/about/main_01.jpg" alt="Paris" width="400" height="300">
	          <p><strong>캠페인 이름</strong></p>
	          <p>캠페인 소개</p>
	          <div class=" text-center">
	          	<button class="btn" data-toggle="modal" data-target="#myModal">바로가기</button>
	          	<div class="text-left">
					<img alt="눈동자 아이콘"  class="board_icon" src="/resources/images/common/view.png"> 99
					<img alt="말풍선 아이콘" class="board_icon" src="/resources/images/common/comment.png"> 99
				</div>
	          </div>
	          <div class="text-left"> 		
				</div>
	        </div>
      </div>
      <!-- 예시 끝 -->
      
      <!-- 리스트를 위한 반복문시작 -->
      <div class="col-sm-4">
        <div class="thumbnail">
        <!-- 데이터 리스트 시작  -->
          <img src="/resources/images/about/main_01.jpg" alt="New York" width="400" height="300">
          <p><strong>캠페인 이름</strong></p>
          <p>캠페인 소개</p>
        <!-- 데이터 리스트 끝 -->
          <div class=" text-center">
          	<button class="btn" data-toggle="modal" data-target="#myModal">바로가기</button>
          </div>
        </div>
      </div>
      <!-- 리스트를 위한 반복문 끝 -->
      
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/resources/images/about/main_01.jpg" alt="San Francisco" width="400" height="300">
          <p><strong>캠페인 이름</strong></p>
          <p>캠페인 소개</p>
          <div class=" text-center">
          	<button class="btn" data-toggle="modal" data-target="#myModal">바로가기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>	
<!-- 보드 리스트 끝-->

	


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist/assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
