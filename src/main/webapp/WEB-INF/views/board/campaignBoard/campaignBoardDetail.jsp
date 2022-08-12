<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

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
        videoId: '2VwaH8SPgsc'
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
    
    </style>
  </head>

  <body>

    <div class="container" style="border: solid 1px #000;">
      <div class="jumbotron">
        <h1>게시판 리스트에 첨부한 파일 영역입니다.</h1> 
      </div>

      <div class="row marketing">
        <div class="col-xs-9"><h2 class="page-header">빨간 대야 소녀, 보명이</h2></div>
 		 <div class="col-xs-12"><p>읍내에서도 30km 넘게 떨어진 땅끝 해남의 한 마을. 세 살 때부터 이곳에서 자라온 열네 살 보명이에겐 소중한 친구가 있습니다. 바로 빨간 대야입니다. 어릴 때부터 놀이터 삼아 뛰어놀던 바닷가나 밭을 갈 때면 보명이는 빨간 대야와 한 몸처럼 붙어 지냈습니다. 초등학교 1학년 때부터 몸집보다 큰 이불 빨래를 할 때도 농사일을 거들 때도, 새참을 나를 때도, 갯벌의 생물을 채취할 때도 그만큼 쓰임새 좋은 물건도 없기 때문입니다. 한창 외모에 신경 쓸 나이지만, 보명이가 투박하고 색바랜 빨간 대야를 들고 다닌 건, 하나뿐인 가족인 아빠의 일을 거들어주고 싶은 마음에서였습니다. 혼자서 자신을 키우느라 새벽부터 늦은 밤까지, 작은 체구로 바지런하게 일하는 아빠를 볼 때면 항상 미안하다는 보명이.
 		  오랜 시간 빨간 대야가 보명이의 친구가 돼줬듯, 
 		  보명인 아빠의 짐을 빨간 대야에 나눠지는 아빠에게 
 		  든든한 딸이 되고 싶습니다.</p></div>   
      </div>
      
      <!-- 16:9 aspect ratio -->
      	<div class="embed-responsive embed-responsive-16by9">
	      	<div id="ytplayer">
	      	</div>
      	</div>
      	
   
	





    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
