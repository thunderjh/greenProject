<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<style type="text/css">
	#noticeTable{
		border-collapse: collapse;
	}

	#noticeTable tr td, th{
		border-bottom: 1px solid #444444;
		padding: 10px;
	}
	
</style>

<script type="text/javascript">
	$(function(){
		
		//입력 양식 enter 제거
		$("#keyword").bind("keydown", function(event){
			if(event.keyCode == 13){
				event.preventDefault();	
			}
		});
		
		//제목 클릭시 상세페이지 이동 
		$(".detailPage").click(function(){
			let n_num = $(this).parents("tr").attr("data-num");
			$("#n_num").val(n_num);
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/notice/noticeDetail"
			});
			$("#detailForm").submit();
		});
		
		//페이징 부분
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		});
	});
	
	//검색을 위한 실질적인 처리 함수
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method" : "get",
			"action" : "/notice/noticeList"
		});
		$("#f_search").submit();
	}
</script>
</head>
<body>

	<div class="container">
		<form id="detailForm">
			<input type="hidden" id="n_num" name="n_num"/>
		</form>
		
		<!-- 검색 기능 부분 -->
		<div class="text-right"	id="noticeSearch">
			<form	id="f_search" name="f_search"	class="form-inline">
			<!-- 페이징 처리를 위한 파라미터 -->
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
				<div class="form-group">
					<select id="search" name="search"	 class="form-select-sm">
						<option value="all">전체</option>
						<option value="n_title">제목</option>
						<option value="n_content">내용</option>
					</select>
					<input type="text" name="keyword" id="keyword" class="form-control-sm" placeholder="검색어를 입력하세요"/>
					<button type="button"  id="searchData" class="btn btn-success">검색</button>
				</div>
			</form>
		</div>
		
		<!-- 공지사항 리스트 시작 부분 -->
		<div id="noticeList" class="table-height">
			<table summary="공지사항" class="table table-bordered" id="noticeTable">
				<thead>
					<tr>
						<th data-value="n_num" class="order text-center col-md-1">글 번호</th>
						<th class="text-center col-md-6">글 제목</th>
						<th data-value="n_date" class="order col-md-2">작성일</th>
						<th class="text-center col-md-1">조회수</th>
					</tr>
				</thead>
				<tbody id="list"	class="table-striped">
					<!-- 리스트 데이터 출력 부분 -->
					<c:choose>
						<c:when test="${not empty noticeList}">
							<c:forEach var="notice" items="${noticeList}" varStatus="status">
								<tr class="text-center" data-num="${notice.n_num}">
									<td>${notice.n_num }</td>
									<td class="detailPage text-center">${notice.n_title}</td>
									<td class="text-left">${notice.n_date}</td>
									<td class="text-center">${notice.views}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4" class="teac text-center">등록된 게시물이 존재하지 않습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<!-- 공지사항 리스트 끝 부분 -->
		
		<!-- 페이징 출력 시작 -->
		<div class="text-center">
			<ul class="pagination">
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
					<a href="${pageMaker.startPage-1}">Previous</a>
				</li>
			</c:if>
			
			
			<!-- 바로가기 번호 출력 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active' : ''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			
			<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next">
					<a href="${pageMaker.endPage+1}">Next</a>
				</li>
			</c:if>
			</ul>
		</div>
		<!-- 페이징 출력 종료 -->
		
		<!-- 페이징 처리를 커스텀태그(pagination)를 정의 -->
		<%-- <tag:pagination pageNum="${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}" 
		startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}" prev="${pageMaker.prev}" next="${pageMaker.next}"/> --%>

	</div>
</body>