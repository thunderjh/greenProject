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
		
		    <title>캠페인 댓글</title>
	
			<!-- jquery -->
			<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
			<script src="/resources/include/js/jquery-3.6.0.min.js"></script>
			
			 <!-- Bootstrap core CSS -->
		    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
			<!-- Bootstrap  JS -->
			<script src="/resources/include/dist/js/bootstrap.min.js"></script>
			
			
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
		    .board_icon{
					width: 20px;
					height: 20px;
				}
			textarea{resize: none;}
			
			
		    </style>
			<script type="text/javascript">
			function adjustHeight() {
				  var textEle = $('textarea');
				  textEle[0].style.height = 'auto';
				  var textEleHeight = textEle.prop('scrollHeight');
				  textEle.css('height', textEleHeight);
				};
			</script>
		</head>
		<body>		
			<div class="container">
				<div class="text-left">
				<h3>댓글 <img alt="말풍선 아이콘" class="board_icon" src="/resources/images/cmapaignBoardimage/pictogram/comment.png"> 99 </h3>
				</div>
			  <div class="panel panel-default">
			    <div class="panel-heading">사용자ID <button type="button" class="btn btn-default " style="margin-left: 20px;">등록</button></div>
			    <textarea class="form-control" id="reply-text" rows="3" maxlength="999"></textarea>
			  </div>
			
			<hr>
			
 	 <!-- 댓글 리스트 시작 -->
			  <div class="media">
			    <div class="media-body">
			      <h4 class="media-heading">사용자ID<button type="button" class="btn btn-default" style="margin-left: 20px;">수정</button>
			       								  <button type="button" class="btn btn-default">삭제</button></h4>
			      
			      <p>덩기덕쿵더러러</p>
			    </div>
			  </div>
			  <hr>
	<!-- 댓글 리스트 끝 -->			
			</div>
	
		</body>
</html>