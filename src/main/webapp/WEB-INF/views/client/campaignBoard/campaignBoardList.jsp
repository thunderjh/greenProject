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
	
 	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	
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
	/*   .thumbnail {
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
  
  .person{cursor: pointer;}
  
  .listContent{
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  line-height: 2;
  overflow: hidden;
} */

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.containerList {
  padding: 0 16px;
}

.containerList::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.listContent {
  color: grey;
}

.goDetail {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: #000;
  background-color: #fff;
  text-align: center;
  cursor: pointer;
  width: 100%;

  border: solid #505050 0.2px;
  
}  

.goDetail:hover {
  background-color: #32CD32	;
  color: #fff;
}  
  .board_icon{
  	height: 20px;
  	width: 20px;
  }
  .boardIcondiv{
  	margin-top: 5px;
  	margin-bottom: 8px;
  } 
  .listContent{
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  line-height: 2;
  overflow: hidden;
}
	</style>
	
	<script type="text/javascript">
	$(function () {
		//상세페이지 이동
		$(".goDetail").click(function() {
			
			let c_no = $(this).parents("div").attr("data-num");
			$("#c_no").val(c_no);
			console.log("c_no = " + c_no);
			/*상세페이지 이동하기 위한 폼*/
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/client/campaignBoard/campaignBoardDetail"
			});
			$("#detailForm").submit();
		
		});
		
		/**/
		$(".person").click(function() {
			
			let cat_title = $(this).parents("div.cat").find("strong").html();
			console.log("cat_title :" + cat_title);
			
			if(cat_title!="전체"){
				$("#cat_title").val(cat_title);
				$("#pageNum").val(1);
			}
		//	console.log("c_no = " + c_no);
			/*상세페이지 이동하기 위한 폼*/
		//	$("#detailForm").attr({
		//		"method" : "get",
		//		"action" : "/client/campaignBoard/campaignBoardDetail"
		//	});
		//	$("#detailForm").submit();
			goPage();
		});
		
		 /**/ 
		 
		 
		 
		 
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			
			goPage();
		});
		
	})// 최상위 펀션
	function goPage(){
		//if ($("#search").val() == "all") {
		//	$("#keyword").val("");
		//}
		$("#f_search").attr({
			"method" : "get",
			"action" : "/client/campaignBoard/campaignBoardList"
		});
		$("#f_search").submit();
	}
	
	</script>
	
</head>


  <body>
  

  
  <!--detail페이지를 위한 form 태그 -->
  <form id="detailForm">
  	<input type="hidden" id="c_no" name="c_no">
  </form>
 
  <!-- 카테고리 시작 -->
  
 <div class="container text-center">
 <form id="f_search" name="f_search" class="form-inline">
	<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
	<input type="hidden" name="cat_title" id="cat_title">
	<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
	  </form>
  <h3>카테고리</h3>
  <br>
  <div class="row">
    <div class="col-sm-3 cat">     
      <img src="/resources/images/cmapaignBoardimage/pictogram/allpick.png" class="img-circle person" alt="Random Name" width="100" height="100"> 
     <p class="text-center"><strong>전체</strong></p><br>
    </div>
    
    <div class="col-sm-3 cat">      
      <!--  <a href="/client/campaignBoard/campaignBoardList?cat_title=환경">--> 
       <img src="/resources/images/cmapaignBoardimage/pictogram/environment.png" class="img-circle person" alt="Random Name" width="100" height="100">
       <!-- </a> --><p class="text-center"><strong>환경</strong></p><br>
    </div>
    
    <div class="col-sm-3 cat">     
       <img src="/resources/images/cmapaignBoardimage/pictogram/pet-house.png" class="img-circle person" alt="Random Name" width="100" height="100">
       <p class="text-center"><strong>동물</strong></p><br>
    </div>
    
    <div class="col-sm-3 cat">      
      <img 
      src="/resources/images/cmapaignBoardimage/pictogram/home.png" 
      class="img-circle person" alt="Random Name" width="100" height="100">
      <p class="text-center"><strong>가정</strong></p><br>
    </div>
  </div>   
</div>
<!-- 카테고리 끝 -->
	
	

<div id="tour" class="bg-1">
  <div class="container">
    <h3 class="text-center">캠페인 목록</h3>
    <p class="text-center" style="margin-bottom: 40px;">작은 실천으로,<br> 힘을 모아요!</p>
</div>		
		


<!-- 보드 리스트 -->
<div class="container">    
 <div class="row">
 
 <!-- 반복문 시작 -->
 <c:forEach items="${campaignBoardList }" var="campaignBoard">
		 <div class="column">
		    <div class="card">
			     <c:if test='${campaignBoard.c_file == ""}'>
	         		 <img src="/resources/images/cmapaignBoardimage/images/logo.png" alt="캠페인 이미지" style="width:100%; height:200px; object-fit: cover;">
	          	 </c:if>
	          	 <c:if test='${campaignBoard.c_file != ""}'> 
	          		 <img src="/uploadStorage/campaign/${campaignBoard.c_file}" alt="캠페인 이미지" 	  style="width:100%; height:200px; object-fit: cover;"> 
	          	 </c:if>	           
			      <div class="containerList"> 
			       		<h4>${campaignBoard.c_title}</h4>
				        <p class="listContent">${campaignBoard.c_content}</p>
				        <div class="text-left boardIcondiv">
							<img alt="눈동자 아이콘"  class="board_icon" src="/resources/images/cmapaignBoardimage/pictogram/view.png"> ${campaignBoard.c_views}
							<img alt="말풍선 아이콘" class="board_icon" src="/resources/images/cmapaignBoardimage/pictogram/comment.png">  ${campaignBoard.comment_cnt}
						</div>
				        <div class="text-center"  data-num="${campaignBoard.c_no}" >
				        	<p><button class="goDetail"id="btn" data-target="#myModal">바로가기</button></p>	
				        </div>		       
			      </div>
		    </div>
		 </div>
 </c:forEach>
 <!-- 반복문 끝 -->
</div>
  </div>
  
</div>	
<!-- 보드 리스트 끝-->


<!-- 페이징 -->
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous">
						<a href="${pageMaker.startPage -1}">Previous</a>
						</li>
					</c:if>
				
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
						<a href="${num}">${num}</a>
						</li>
					</c:forEach>
				
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
						<a href="${pageMaker.endPage +1}">Next</a>
						</li>
					</c:if>
				</ul>
			</div>

	


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
