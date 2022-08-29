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
 	console.log("videoId = " + youtubeVideoId);
 	
 	
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
    
    
    $(function() {
    	//수정하기 버튼 클 릭 
		$("#campaignBoardUpdateBtn").click(function () {
			location.href="/admin/adminCampaignBoard/campaignBoardUpdateForm?c_no="+${campaignBoardDetail.c_no};
			
		});
    	
    	
    	//삭제
    	$("#campaignBoardDeleteBtn").click(function () {
				if(confirm("삭제하시겠습니까?")){
					$("#campaignBoardUpdateForm").attr({
						"action" : "/admin/adminCampaignBoard/campaignBoardDelete"						
					});
					$("#campaignBoardUpdateForm").submit();
				}
			
		});
    	
    	$("#f_writeForm").attr({
			"method" : "post",
			"enctype": "multipart/form-data",
			"action" : "/board/boardInsert"
		});
    	
	});// $
    
	</script>
    <style type="text/css">
    /* 	.btnArea{
    	margin-top: 20px;
    	margin-bottom: 20px;
    	text-align: center;
    	width: 100%;
    	}
    .detail-mainwrapper{
   	width: 100%;
    }
    .detail-mainimage{
    	max-width: 100%;
    	height: auto;
    	} */
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
	
	
				<table class="table table-striped table-sm">
					<tbody>
						<tr>
							<td class="col-md-3">작성자</td>
							<td class="col-md-3 text-left">${campaignBoardDetail.a_id} (조회수: ${campaignBoardDetail.c_views})</td>
							<td class="col-md-3">작성일</td>
							<td class="col-md-3 text-left">${campaignBoardDetail.c_date}</td>
						</tr>
						<tr>
							<td class="col-md-4">카테고리</td>
							<td colspan="3" class="col-md-8 text-left">${campaignBoardDetail.cat_title}</td>
						</tr>
						<tr>
							<td class="col-md-4">글제목</td>
							<td colspan="3" class="col-md-8 text-left">${campaignBoardDetail.c_title}</td>
						</tr>
						<tr class="table-tr-height">
							<td class="col-md-4">글내용</td>
							<td colspan="3" class="col-md-8 text-left">${campaignBoardDetail.c_content}</td>
						</tr>
						<c:if test="${not empty campaignBoardDetail.c_file }">
						
						<tr>
							<td class="col-md-4">이미지</td>
							<td colspan="3" class="col-md-8 text-left">
								<img src="/uploadStorage/campaign/${campaignBoardDetail.c_file}"/>
							</td>
						</tr>
						</c:if>
					</tbody>
				</table>
				
				      	<button type="button" id="campaignBoardUpdateBtn" class="btn btn-success">수정하기</button>
      	<button type="button" id="campaignBoardDeleteBtn" class="btn btn-success">삭제하기</button>

				<jsp:include page="campaignBoardReply.jsp" />




    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
