



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="images/common/logo.png">

    <title>greenProject</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <!-- <link href="include/dist/css/jumbotron.css" rel="stylesheet"> -->
    
    <style type="text/css">
    
  
   .bg-1 {
    background-color: MediumSeaGreen;
    color: #fff;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
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
    padding: 10px 20px;
    background-color: MediumSeaGreen;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  footer {
    background-color: #e6e6e6;
    color: #4a4a4a;
    padding: 32px;
  }
  footer a {
    color: #f5f5f5;
  }
  footer a:hover {
    color: #fff;
    text-decoration: none;
  }  
    </style>
  </head>
 <body>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top"  style="background-color: #fff;">
      <div class="container">
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active">
            	<a href="greenProject" style="width:60px; height:50px; padding:0px;">
            		<img src="/resources/images/cmapaignBoardimage/images/logo.png" style="width:100%; height:100%">
            	</a>
            </li>
            <li><a href="/client/campaignBoard/about">??????</a></li>
            <li><a href="/client/campaignBoard/campaignBoardList">?????????</a></li>
            <li><a href="/client/mission/missionList">??????</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">????????????<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">????????????</a></li>
                <li><a href="#">Q & A</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="/profile/mainMypage"><img alt="???????????????" src="/resources/images/common/myPage.png" style="width: 20px;height: 20px"></a></li>
            
					<c:if test="${pvo == null}">
						<li><a href="/profile/login"><img src="/resources/images/common/signIn.png" style="width: 20px;height: 20px" ></a></li> 
						<li><a href="/profile/memberJoinForm"><img src="/resources/images/common/singUp.png" style="width: 20px;height: 20px"></a></li>
					</c:if>
					
					<c:if test="${pvo != null}">
						<li><a href="/profile/logout"><img src="/resources/images/common/signIn.png" style="width: 20px;height: 20px"></a> </li>
						<li><a href="/profile/mainMypage"><img src="/resources/images/common/singUp.png" ></a></li>
					</c:if>
          </ul>
        </div><!--/.nav-collapse -->
      </div> 
    </nav>
 
   <!-- Main jumbotron for a primary marketing message or call to action -->
   
   
  <div class="container text-center" id="gotop">
    <img src="/resources/images/cmapaignBoardimage/images/main_01.jpg"  alt="mainimg" width="100%" height="400px" style="object-fit: cover;">
</div> 
       
   
   <div class="container text-center">
  <h2>THE GREEN</h2>
  <p><em>????????? ????????? ???????????????.</em></p>
  <p>????????? ????????? ?????????!</p> 
</div>
 
<div class="container-fluid bg-2 text-center">
  <a href="#" class="btn btn-default btn-lg" onclick = "location.href = '/client/campaignBoard/about' ">????????????</a>
</div>
   
    
<div class="bg-1"> 
  <div class="container" style="margin-top: 15px;">
    <h2 class="text-center" style="margin-bottom: 20px;">GreenProject</h2>
     
    <div class="row text-center">
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/resources/images/mainPage/mainCampaign.jpg" alt="Campaign" width="400" height="300">
          <p><strong>CAMPAIGN</strong></p>
          <p>????????? ???????????? ?????? ??? ?????????.</p>
          <button class="btn" onclick = "location.href = '/client/campaignBoard/campaignBoardList' ">????????????</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/resources/images/mainPage/mainSponsor.jpg" alt="SPONSOR" width="400" height="300">
          <p><strong>SPONSOR</strong></p>
          <p>????????? ????????? ????????? ??????????????????.</p>
          <button class="btn" >????????????</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="/resources/images/mainPage/mainCoin.jpg" alt="MISSION" width="400" height="300">
          <p><strong>MISSION</strong></p>
          <p>???????????? ????????? ?????????????????? ???????????????.</p>
          <button class="btn" onclick = "location.href = '/client/mission/missionList' ">????????????</button>
   
        </div>
      </div>
    </div>
  </div>
</div>

  
    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->



<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#gotop" data-toggle="????????????" title="????????????" style="color: #777;"> 
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>(C) GreenProject 4Team</p> 
</footer>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="/resources/include/dist/assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

