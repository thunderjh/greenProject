<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    </head>
		<body>
			<div class="container">
			<form>
		   	<br>
			  <div class="form-group ">
			    <label for="exampleInputFile">게시판 대표이미지</label>
			    <input type="file" id="exampleInputFile">
			  </div>
			  <div class="form-group ">
			    <label for="exampleInputEmail1">게시판 제목</label>
			    <input type="text" class="form-control input-lg" id="exampleInputEmail1" placeholder="리스트 제목을 입력하세요">
			  </div>
			  
			  <div class="form-group ">
			    <label for="exampleInputPassword1">게시판 소개</label>
			    <input type="text" class="form-control input-lg" id="exampleInputPassword1" placeholder="리스트 소개를 입력하세요.">
			  </div>
			  
			  
			  <div class="form-group ">
			    <label for="exampleInputPassword1">게시판 디테일 소제목</label>
			    <input type="text" class="form-control input-lg" id="exampleInputPassword1" placeholder="게시판 디테일 소제목을 입력하세요.">
			  </div>
			  <br>
			  
			  <div class="form-group ">
			    <label for="exampleInputPassword1">게시판 디테일 내용</label>
			    <textarea class="form-control" id="exampleInputPassword1" placeholder="게시판 디테일 내용을 입력하세요." 
			    rows="20"></textarea>
			  </div>
			  <br>
			  
			  <div class="form-group ">
			    <label for="exampleInputPassword1">유튜브 링크</label>
			    <input type="text" class="form-control input-lg" id="exampleInputPassword1" placeholder="https://youtu.be/ 제외한 URL 값을 입력해주세요.">
			  </div>
			  <br>	
			
			  
			  <button type="submit" class="btn btn-default">작성하기</button>
			  <button type="reset" class="btn btn-default">다시작성</button>
			  
			  <button type="button" class="btn btn-default">목록</button>
			   
			</form>
			</div>
		</body>
</html>