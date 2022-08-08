<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 미션인증게시판리스트 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<!-- 브라우저의 호환성 보기 모드를 막고, 해당 브라우저에서 지원하는 가장 최신 버전의 방식으로 HTML 보여주도록 설정.-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<!--viewport : 화면에 보이는 영역을 제어하는 기술. width는 device-width로 설정(브라우저 너비를 장치 너비에 맞추어 표시). initial-scale는 초기비율(보이는 영역과 웹 페이지를 맞춤). user-scalable는 사용자가 화면축소를 하지 못하도록 설정.-->

<title>미션인증게시판</title>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="/resources/images/common/icon.png" />
<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
<!-- 모바일 웹 페이지 설정 끝 -->

<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->

<link rel="stylesheet" type="text/css"
	href="/resources/include/dist/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/include/dist/css/bootstrap-theme.min.css" />

<link rel="stylesheet" type="text/css"
	href="/resources/include/dist/css/default.css" />
<!-- jQuery framework 참조하기 -->
<script type="text/javascript"
	src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript"
	src="/resources/include/dist/js/bootstrap.min.js"></script>

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
							<button class="btn btn-sm btn-primary" name="searchButton"
								id="searchButton">검색</button>
						</div>
					</form>
				</div>
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