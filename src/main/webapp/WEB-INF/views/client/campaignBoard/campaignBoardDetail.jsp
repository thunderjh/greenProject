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
    

    <title>캠페인보드 디테일</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- Custom styles for this template -->
    <link href="/resources/include/css/campaignBoardDetail.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
      
    <script type="text/javascript">
	
    //body에 있는 유튜브를 실행하기 위한 것 DB에 담긴 값을 가져온다
 	var youtubeVideoId = '<c:out value="${campaignBoardDetail.c_detail_videoid}"/>';
 	//console.log("videoId = " + youtubeVideoId);
 	
 	
    // Load the IFrame Player API code asynchronously.
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/player_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    // Replace the 'ytplayer' element with an <iframe> and
    // YouTube player after the API code downloads.
    var player;
    function onYouTubePlayerAPIReady() {
      player = new YT.Player('ytplayer', {
        videoId: youtubeVideoId
      });
    }
    

    
	</script>
    <style type="text/css">
    	.btnArea{
    	margin-top: 20px;
    	margin-bottom: 20px;
    	text-align: center;
    	width: 100%;
    	}
/*     .detail-mainwrapper{
   	width: 100%;
    }
    .detail-mainimage{
    	max-width:200%;
    	height: auto;
    	} */
    	 
    .jumbotron{
    	background-color: #ffffff;
    }	
    </style>
  </head> 
   
  <body> 
	
	
	<form id="youtubesrcForm">
  	<input type="hidden" id="c_detail_videoid" name="c_detail_videoid">
 	</form>
	<form id="campaignBoardUpdateForm" name="campaignBoardUpdateForm" method="post">
		<input type="hidden" name="c_no" value="${campaignBoardDetail.c_no}" /> 
		<input type="hidden" name="c_file" value="${campaignBoardDetail.c_file}" /> 
		<input type="hidden" name="c_thumb" value="${campaignBoardDetail.c_thumb}" />
	</form>
	
	
    <div class="container">
      <div class="jumbotron detail-mainwrapper">

 		<c:if test='${campaignBoardDetail.c_file == ""}'>
          <img src="/resources/images/cmapaignBoardimage/images/logo.png" alt="캠페인 이미지" style="width:600px; height:100%; object-fit: cover;">
          </c:if>
           <c:if test='${campaignBoardDetail.c_file != ""}'>
          <img src="/uploadStorage/campaign/${campaignBoardDetail.c_file}" alt="캠페인 이미지" style="width:600px; height:100%; object-fit: cover;">
           </c:if>

      </div>
 
      <div class="row marketing">
        <div class="col-xs-9"><h2 class="page-header">${campaignBoardDetail.c_detail_title }</h2></div>
 		 <div class="col-xs-12" style="white-space:pre;"><p>${campaignBoardDetail.c_detail_content}
 		  </p></div>   
      </div>
      
      	
      	<c:if test='${campaignBoardDetail.c_detail_videoid == ""}'>
          
          </c:if>
           <c:if test='${campaignBoardDetail.c_detail_videoid != ""}'>
       		<!-- 16:9 aspect ratio -->
		      	<div class="embed-responsive embed-responsive-16by9">
			      	<div id="ytplayer"></div>   	
		      	</div>
	        <!-- 16:9 aspect ratio -->	
           </c:if>
	
    <!--   <div class="btnArea col-md-2">
      	<button type="button" class="btn btn-default" onclick="history.back()">목록으로</button>
    </div> -->   
    <br>
    <div>	 
    <jsp:include page="campaignBoardReply.jsp" />
    </div>
    </div><!-- /container -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
