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

    <title>about</title>
	
    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/include/css/about.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    
    <link rel="styleSheet" href="/resources/include/css/greenProject.css">
    
	
	
    <style type="text/css">
  .jumbotron {
    background-color: MediumSeaGreen;
    color: #fff;
  }
	
  .container-fluid {
    padding: 60px 50px;
  }
  #aboutTitle{
  	margin: 20px 0px 30px 0px;
  }
  
  #aboutGreen{filter : grayscale(90%);}
  
  * {
  box-sizing:border-box;
}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.container {
  padding: 64px;
}

.row:after {
  content: "";
  display: table;
  clear: both
}

.column-66 {
  float: left;
  width: 66.66666%;
  padding: 20px;
}

.column-33 {
  float: left;
  width: 33.33333%;
  padding: 20px;
}

.large-font {
  font-size: 48px;
}

.xlarge-font {
  font-size: 64px
}

.moveButton {
  border: none;
  color: #000;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  background-color: #fff;
}
.moveButton:hover{
	text-decoration: underline;
}

img {
  display: block;
  height: auto;
  max-width: 100%;
}

@media screen and (max-width: 1000px) {
  .column-66,
  .column-33 {
    width: 100%;
    text-align: center;
  }
  img {
    margin: auto;
  }
}

#navbar{
margin: 0 0;
padding: 0 0;  
}

.header{
	margin-top: 0px;
	margin-bottom: 0px;
}
    </style>
    
    
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
        videoId: "0R-KNBdVa-g"
      });
    }
    
    
    
    </script>
  </head>
 
  <body>
    
<!-- <img alt="ss" src="/resources/images/cmapaignBoardimage/images/main_01.jpg"> -->
	<div class="jumbotron text-center">
	  <h1>STORY</h1> 
	  <p>'모든 사람이 살아 갈 수 있는 환경을 만드는 것'<br>
	  GreenProject는 사회의 그림자를 빛으로 비추는 마음으로 만들어졌습니다.
	  </p> 
	</div>
    

	<!-- 어바웃 메인 이미지 -->

    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">
       
     	<!-- (About Section) -->
		<div class="container-fluid bg-grey">
		  <div class="row">
		    <div class="col-sm-8">
		      <h1 id="aboutTitle">Our Story</h1>
		      <h4><strong >GreenProject는 한 가지 질문에서 시작하였습니다.</strong></h4>      
		       <p>'가장 이루고 싶은 소원이 무엇일까?'<br>
		      	  그림자 속에 가려진 아이들에게 소원에 대하여 질문을 하면, 이루고 싶은 미래나 혹은 가지고 싶은 장난감보다 가장 먼저 이루고싶은 소원은 아픈 부모님 혹은 할머니와 할아버지 동생의 관한 이야기였습니다.
		       </p><br>
		      <p>
		      		GreenProject는 학교수업이 진행중인 어느 날, 한 골목길에 앉아있는 어린친구를 통해 이런 문제를 알게 되었습니다. 위기가정에 놓여져있는 아이들을 통하여 그들이 원하는 것은
		      		아이들만의 순수한 욕심이 아니라 다른 가정의 아이들처럼 그저 가족들과 함께 평범하게  살고 싶다는 사실을 깨달았습니다. 
		      		그 이후, 사회를 돕고있는 소수의 사람들과 협력하여 아이들의문제와 더불어 각종 사회 문제를 알게 되었고 
		      		간단한 활동으로 누구나 참여할 수 있는 GreenProject를 만들었습니다.
		      </p><br>	
		    </div>
		  </div>
		</div>
    <hr class="featurette-divider">
       
   
   
      <!-- 시작 계기 -->
   <div class="container-fluid text-left">	
      <div class="row featurette">
        <div class="col-md-5">
          <img class="featurette-image img-responsive" id="aboutGreen" data-src="holder.js/600x300/auto" src="/resources/images/cmapaignBoardimage/images/aboutImg01.jpg" alt="Generic placeholder image"  >
        </div> 
        <div class="col-md-7">
          <h2 class="featurette-heading">아이들로부터 시작된 Green</h2>
          <p>
          GreenProject는 그림자 속 아이들로부터 시작되었습니다. 
          </p>
           
          <p>
          GreenProject는 아이들의 주거 환경을 개선하기위하여 봉사를 하고 그 과정에서
          아이들을 위협하는 세상을 알게되었습니다. 비위생적인 환경에 버려져 각종 병균을 보유한 반려동물들이 아이들을 위협하고 있었으며
          쓰레기를 처리 할 장소가 없어 방치되어 쌓여있는 쓰레기들을 통하여 제대로 수거되지 않은 쓰레기들로 생기로
          다양한 환경문제를 알게되었습니다.         
        </div> 
      </div>
   </div> 
      <hr class="featurette-divider">
      <!-- 시작 계기 끝 -->

<!-- 활동 소개 --> 
<!-- 캠페인 활동 -->
<div class="container" style="background-color:MediumSeaGreen; color:#fff;">
  <div class="row">
    <div class="column-33">
      <img src="/resources/images/cmapaignBoardimage/images/recycling.jpg" alt="recycling" width="335" height="471">
    </div>
    <div class="column-66">
      <h1 class="xlarge-font"><b>GreenProjectCampaign</b></h1>
      <h1 class="large-font"><b>함께하는 캠페인</b></h1>
      <p><span style="font-size:24px">GreenProject는 각종 캠페인 활동이 있습니다.</span> </p>
      <p>캠페인 활동을 통하여 미션 포인트를 쌓고 후원을 할 수 있습니다. 
      	우리들의 작은 행동으로 시작하여 세상을 움직일 때 까지 GreenProject는 계속 존재합니다.
      </p>
  	  
     <button class="moveButton" onclick = "location.href = 'campaignBoardList' ">더 알아보기</button> 
    </div>
  </div> 
</div>
       
<!-- 후원 활동 -->
<div class="container">
  <div class="row">
    <div class="column-66">
      <h1 class="xlarge-font"style="color:MediumSeaGreen;"><b>GIVING BACK</b></h1>
      <p><span style="font-size:36px">GreenProject는 후원금을 직접 관련된 기관에 기부하여 여러 계층들을 지원하고 있습니다.</span> 
      
      </p>
      <button class="moveButton" style="border: solid #000 0.5px;">더 알아보기</button>
    </div>
    <div class="column-33">
        <img src="/resources/images/cmapaignBoardimage/images/child.jpg" width="335" height="471" >
    </div>
  </div>
</div>
 



<!-- 활동소개 끝 -->	



		    <!-- 16:9 aspect ratio -->
		      	<div class="embed-responsive embed-responsive-16by9">
			      	<div id="ytplayer"></div>   	
		      	</div>
	        <!-- 16:9 aspect ratio -->	

		

		<!-- 캠페인 섹션 시작 -->
		
		
		
		
		<!-- 캠페인 섹션 끝 -->
		
		<!-- 진행 중인 후원 섹션 시작 -->
<!-- 		<div class="album py-5 bg-light">
			<div class="container">
				<h3 class="h3Title"><a href="#">진행 중인 후원 ></a></h3>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span class="left">25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span>25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
					
					<div class="col">
						<div class="card shadow-sm">
							<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
								<title>Placeholder</title><rect width="100%" height="100%" fill="#55595c" />
								<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
							<div class="card-body">
								<h4>복날, 삼계탕으로 어르신의 기력을 회복시켜요!</h4>
								<p class="card-text">꽃밭정이노인복지관</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
								</div>
								<span>25%</span><span class="right">2,053,800원</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->
		<!-- 진행 중인 후원 섹션끝 -->
	
	
	
	
	
	
	
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
