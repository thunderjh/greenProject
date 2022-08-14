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
				"action" : "/admin/board/pointApproval"
			});
			$("#f_search").submit();
		});

		//검색 데이터 유지
		let word = "<c:out value='${data.keyword}' />";
		if (word != "") {
			$("#keyword").val("<c:out value='${data.keyword}' />");
			$("#search").val("<c:out value='${data.search}' />");
		}
		
		//포인트 부여
		$(".pointPlus").click(function(){
			let m_no =$(this).parents("tr").attr("data-num");
			$("#m_no").val(m_no);
			
			if(confirm("포인트 적립을 승인하시겠습니까?")){
			$("#PointlMissionForm").attr({
				"method" : "post",
				"action" : "/admin/board/pointPlus"
			});
			$("#PointlMissionForm").submit();
			}
		});
		
		//포인트 취소
		$(".pointCancle").click(function(){
			let m_no =$(this).parents("tr").attr("data-num");
			$("#m_no").val(m_no);
			
			if(confirm("포인트 승인을 취소하시겠습니까?")){
			$("#PointlMissionForm").attr({
				"method" : "post",
				"action" : "/admin/board/pointCancle"
			});
			$("#PointlMissionForm").submit();
			}
		});

	});
</script>
</head>
<body>
		<div class="container-fluid">
			<div class="table-responsive">
				<form id="PointlMissionForm">
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
						<col style="width: 10%;" />
						<col style="width: auto;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 15%;" />
						<col style="width: 5%;" />
						<col style="width: 5%;" />
					</colgroup>
					<thead>
						<tr class="">
							<th>NO</th>
							<th>카테고리</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>포인트승인여부</th>
							<th colspan=2></th>
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
										<td class="text-center">${list.m_p_approval}</td>
										<td><button type="button" class="btn btn-sm btn-primary pointPlus">승인</button></td>
										<td><button type="button" class="btn btn-sm btn-primary pointCancle">취소</button></td>
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
				<h4>총 지급 포인트: ${totalPoint}</h4>
			</div>
		</div>

</body>
</html>