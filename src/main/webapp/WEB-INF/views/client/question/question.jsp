<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

</head>
<body>
	<div class="subNav">
		<ul>
			<li><a href="/notice/noticeList">공지사항</a></li>
			<li><a href="/question/questionList">Q &amp; A</a></li>
		</ul>
	</div>
	<div class="container">
		<form id="detailForm">
			<input type="hidden" id="n_num" name="n_num"/>
		</form>
		
		<!-- 검색 기능 부분 -->
		<div class="text-right"	id="noticeSearch">
			<form	id="f_search" name="f_search"	class="form-inline">
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
			<table summary="공지사항" class="table table-striped">
				<thead>
					<tr>
						<th data-value="n_num" class="order text-center col-md-1">글 번호</th>
						<th class="text-center col-md-6">글 제목</th>
						<th data-value="n_date" class="order col-md-3">작성일</th>
						<th class="text-center col-md-2">조회수</th>
					</tr>
				</thead>
				<tbody id="list"	class="table-striped">
					<!-- 리스트 데이터 출력 부분 -->
					<c:choose>
						<c:when test="${not empty noticeList}">
							<c:forEach var="notice" items="${noticeList}" varStatus="status">
								<tr class="text-center" data-num="${notice.n_num}">
									<td>${notice.n_num }</td>
									<td class="detailPage text-left">${notice.n_title}</td>
									<td class="text-left">${notice.n_date}</td>
									<td class="text-center">${notice.views}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="teac text-center">등록된 게시물이 존재하지 않습니다.</td>
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
			</ul>
			
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
		</div>
		<!-- 페이징 출력 종료 -->
		
		<!-- 페이징 처리를 커스텀태그(pagination)를 정의 -->
		<tag:pagination pageNum="${pageMaker.cvo.pageNum}" amount="${pageMaker.cvo.amount}" 
		startPage="${pageMaker.startPage}" endPage="${pageMaker.endPage}" prev="${pageMaker.prev}" next="${pageMaker.next}"/>
			
		
		<!-- 글쓰기 버튼 시작 부분
		<div class="contentBtn text-right">
			<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-success">
		</div>
		<!-- 글쓰기 버튼 끝 부분  -->
	</div>
</body>