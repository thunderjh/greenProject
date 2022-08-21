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
   #btn {
   	border: 1px solid #333;
    padding: 10px 20px;
    background-color: #fff;
    color: #000;
    border-radius: 0;
    transition: .2s;
  }
  #btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #58D64A;
    color: #fff;
  }

   .container {
    padding: 80px 120px;
  }
  .board_icon{
  	height: 20px;
  	width: 20px;
  }
	</style>
	
	<script type="text/javascript">
	$(function () {
		
		
		
		//글 쓰기 버튼 클 릭 
		$("#insertFormBtn").click(function () {
			location.href="/admin/adminCampaignBoard/campaignBoardInsertForm";
		});
		
		//상세페이지 이동
		$(".goDetail").click(function() {
			
			let c_no = $(this).parents("div").attr("data-num");
			$("#c_no").val(c_no);
			console.log("c_no = " + c_no);
			/*상세페이지 이동하기 위한 폼*/
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/admin/adminCampaignBoard/campaignBoardDetail"
			});
			$("#detailForm").submit();
		
		});

		$("#exam").click(function () {
			location.href="/admin/adminCampaignBoard/campaignBoardDetail";
		});				   
		
		
	})// 최상위 펀션
	
	
	</script>
	
</head>


  <body>
  

  
  <!--detail페이지를 위한 form 태그 -->
  <form id="detailForm">
  	<input type="hidden" id="c_no" name="c_no">
  </form>
 
  <!-- 카테고리 시작 -->
 <div class="container text-center">
  <h3>카테고리</h3>
  <br>
  <div class="row">
    <div class="col-sm-3">     
      <img src="/resources/images/cmapaignBoardimage/pictogram/allpick.png" class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>전체</strong></p><br>
    </div>
    <div class="col-sm-3">      
      <img src="/resources/images/cmapaignBoardimage/pictogram/environment.png" class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>환경</strong></p><br>
    </div>
    <div class="col-sm-3">     
      <img src="/resources/images/cmapaignBoardimage/pictogram/pet-house.png" class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>동물</strong></p><br>
    </div>
    <div class="col-sm-3">      
      <img src="/resources/images/cmapaignBoardimage/pictogram/home.png" class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>가정</strong></p><br>
    </div>
  </div>
</div>
    
<!-- 카테고리 끝 -->
	
<!-- 보드 리스트 -->
<div id="tour" class="bg-1">
  <div class="container">
    <h3 class="text-center">캠페인 목록</h3>
    <p class="text-center" style="margin-bottom: 40px;">작은 실천으로,<br> 힘을 모아요!</p>
		
		

  <button type="button" class="btn btn-primary btn-lg btn-block" id="insertFormBtn" style="margin-bottom: 40px;">캠페인 등록</button>

    
    <div class="row text-left">
      <!-- 리스트를 위한 반복문시작 -->
      
      <c:forEach items="${campaignBoardList }" var="campaignBoard">
      <div class="col-xs-6 col-sm-4" style="border: solid 0.5px #000;">
        <div class="thumbnail" >
        <!-- 데이터 리스트 시작  -->
        <c:if test='${campaignBoard.c_file == ""}'>
          <img src="/resources/images/cmapaignBoardimage/images/main_01.jpg" alt="캠페인 이미지" width="400" height="300">
          </c:if>
           <c:if test='${campaignBoard.c_file != ""}'>
          <img src="/uploadStorage/campaign/${campaignBoard.c_file}" alt="캠페인 이미지" width="400" height="300">
           </c:if>
          <p><strong>${campaignBoard.c_title}</strong></p>
          <p>${campaignBoard.c_content}</p>
          
        <!-- 데이터 리스트 끝 -->
        
          <div class="text-center"  data-num="${campaignBoard.c_no}" >
          	<button class="goDetail" id="btn" data-target="#myModal" style="margin-bottom: 15px;" >바로가기</button>
          	<div class="text-left">
					<img alt="눈동자 아이콘"  class="board_icon" src="/resources/images/cmapaignBoardimage/pictogram/view.png"> 99
					<img alt="말풍선 아이콘" class="board_icon" src="/resources/images/cmapaignBoardimage/pictogram/comment.png"> 99
			</div>
          </div>
        </div>
      </div>
     
      </c:forEach>
      
      <!-- 리스트를 위한 반복문 끝 -->
      
      <button type="button" id="exam">disis</button>
    
      
    
      
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
