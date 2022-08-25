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
/* 	  .thumbnail {
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
  } */
	</style>
	
	<script type="text/javascript">
	$(function () {
		
		
		
		//글 쓰기 버튼 클 릭 
		$("#insertFormBtn").click(function () {
			location.href="/admin/adminCampaignBoard/campaignBoardInsertForm";
		});
		
		//상세페이지 이동
		$(".goDetail").click(function() {
			
			let c_no = $(this).parents("tr").attr("data-num");
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
  
 	<div class="row">
  		<div class="col-xs-6 col-md-10"><button type="button" class="btn btn-primary btn-lg btn-block" id="insertFormBtn" style="margin-bottom: 40px;">캠페인 등록</button></div>
	</div>
 	
 	<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 10%;" />
						<col style="width: auto;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 5%;" />
						<col style="width: 5%;" />
						<col style="width: 5%;" />
					</colgroup>
					<thead>
						<tr class="">
							<th>NO</th>
							<th>관리자 ID</th>
							<th>글제목</th>
							<th>카테고리</th>
							 <th>조회수</th>
							 <th>댓글</th>
							<th>작성일</th>
							<!--
							
							<th colspan=2></th> 
							<th></th>-->
						</tr>
					</thead>
					<tbody id="list">
					
						<c:choose>
							<c:when test="${not empty campaignBoardList}">
								<c:forEach var="campaignBoard" items="${campaignBoardList}" varStatus="status">
									<tr data-num="${campaignBoard.c_no}">
										<td>${campaignBoard.c_no}</td>
										<td>${campaignBoard.a_id}</td>
										<td class="goDetail">${campaignBoard.c_title}</td>
										<td>${campaignBoard.cat_title}</td>
										 <td class="id">${campaignBoard.c_views}</td>
										 <td class="text-center">${campaignBoard.comment_cnt}</td>
										<td>${campaignBoard.c_date}</td>
										<%--<td>${list.m_views}</td>
										
										<td style="display: none;" class="text-center file">${list.m_file}</td>
										<td style="display: none;" class="text-center thumb">${list.m_thumb}</td>
										<td><button type="button" class="btn btn-sm btn-primary pointPlus">승인</button></td>
										<td><button type="button" class="btn btn-sm btn-primary pointCancle">취소</button></td>
										<td><button type="button" class="btn btn-sm btn-danger PostDelete">삭제</button></td> --%>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" align="center">데이터가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>


	


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
