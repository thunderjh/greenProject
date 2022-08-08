<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/MissionCommon.jspf"%>

<script type="text/javascript">
	$(function() {
		//엔터 제거
		$("#keyword").bind("keydown", function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
			}
		});

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
			if ($("#search").val() == "all") {
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method" : "get",
				"action" : "/client/mission/missionList"
			});
			$("#f_search").submit();
		});

		//검색 데이터 유지
		let word = "<c:out value='${data.keyword}' />";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
		}

		//글쓰기폼으로 이동
		$("#missionInsertFormBtn").click(function() {
			location.href = "/client/mission/missionForm";
		});

		//상세페이지 이동
		$(".goDetail").click(function() {
			let m_no = $(this).parents("tr").attr("data-num");
			$("#m_no").val(m_no);
			$("#detailMissionForm").attr({
				"method" : "get",
				"action" : "/client/mission/missionDetail"
			});
			$("#detailMissionForm").submit();
		});
		

	});
</script>
</head>
<body>
	<article>
		<div class="container">
			<div class="table-responsive">
				<h2>미션인증게시판</h2>
				<br><br>
				<form id="detailMissionForm">
					<input type="hidden" id="m_no" name="m_no" />
				</form>
				<div id="missionSearch" class="text-right">
					<form id="f_search" name="f_search" class="form-inline">
						<%--페이징 처리 위한 파라미터 --%>
						<div class="form-group">
							<label>검색조건</label> <select id="search" name="search"
								class="form-control form-control-sm">
								<option value="all">전체</option>
								<option value="m_title">제목</option>
								<option value="m_content">내용</option>
								<option value="id">작성자</option>
							</select> <input type="text" name="keyword" id="keyword"
								class="form-control form-control-sm" />
							<button type="button" class="btn btn-sm btn-primary" name="searchButton"
								id="searchButton">검색</button>
						</div>
					</form>
				</div>
				<br>
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: 15%;" />
						<col style="width: auto;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>카테고리</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<c:when test="${not empty missionList}">
								<c:forEach var="list" items="${missionList}" varStatus="status">
									<tr data-num="${list.m_no}">
										<td>${list.m_no}</td>
										<td>${list.m_c_name}</td>
										<td class="goDetail">${list.m_title}</td>
										<td class="id">${list.id}</td>
										<td>${list.m_date}</td>
										<td>${list.m_views}</td>
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
			</div>
			<div class="contentBtn text-right">
				<button type="button" class="btn btn-sm btn-primary"
					id="missionInsertFormBtn">글쓰기</button>
			</div>




		</div>
	</article>
</body>
</html>