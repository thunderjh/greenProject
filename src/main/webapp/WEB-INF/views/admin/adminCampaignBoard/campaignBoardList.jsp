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
	.content{
 display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  line-height: 2;
  overflow: hidden;
}
	</style>
	
	<script type="text/javascript">
	$(function () {
		//검색 처리 이벤트
		$("#search").change(function() {
			if ($("#search").val() != "all") {
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});

		$("#searchButton").click(function() {
			if ($("#search").val() != "all") {
				if (!chkData("#keyword", "검색어를"))
					return;
			}
			goPage();
		});

		//검색 데이터 유지
		let word = "<c:out value='${data.keyword}' />";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
		}
		
		
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
			   
		
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			
			goPage();
		});
		
	})// 최상위 펀션
		
	function goPage(){
		if ($("#search").val() == "all") {
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method" : "get",
			"action" : "/admin/adminCampaignBoard/campaignBoardList"
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
 
  
  
 	
 	 <div id="campaignSearch" class="text-right">
 	 <div class="text-left">
  		<div class="col-xs-2 col-md-2"><button type="button" class="btn btn-primary btn-lg btn-block" id="insertFormBtn" >캠페인 등록</button></div>
	</div>
					<form id="f_search" name="f_search" class="form-inline">
						<%--페이징 처리 위한 파라미터 --%>
						<div class="form-group">
						<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
							<label>게시판검색</label> <select id="search" name="search"
								class="form-control form-control-sm">
								<option value="all">전체</option>
								<option value="c_title">제목</option>
								<option value="c_content">내용</option>
								<option value="a_id">작성자</option>
								<option value="cat_title">카테고리</option>
							</select> <input type="text" name="keyword" id="keyword"
								class="form-control form-control-sm" />
							<button type="button" class="btn btn-sm btn-primary" name="searchButton"
								id="searchButton">검색</button>
						</div>
					</form>
				</div>
 	<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 6%;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: 5%;" />
						<col style="width: 5%;" />
						<col style="width: 5%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr class="">
							<th>NO</th>
							<th>관리자 ID</th>
							<th>글제목</th>
							<th>글설명</th>
							<th>카테고리</th>
							 <th>조회수</th>
							 <th>댓글</th>
							<th>작성일</th>
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
										<td class="content">${campaignBoard.c_content}</td> 
										<td>${campaignBoard.cat_title}</td>
										 <td class="id">${campaignBoard.c_views}</td>
										 <td >${campaignBoard.comment_cnt}</td>
										<td>${campaignBoard.c_date}</td>
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
