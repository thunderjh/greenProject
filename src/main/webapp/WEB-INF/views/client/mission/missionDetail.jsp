<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/MissionCommon.jspf"%>
<!-- 미션이증게시판 상세보기 -->
<script type="text/javascript">
	$(function() {
		$("#btnModify").click(
				function() {
					$("#missionUpdateForm").attr("action",
							"/client/mission/missionUpdateForm");
					$("#missionUpdateForm").submit();
				});

		$("#btnCancle").click(
				function() {
					if (confirm("정말 삭제하시겠습니까?")) {
						$("#missionUpdateForm").attr("action",
								"/client/mission/missionDelete");
						$("#missionUpdateForm").submit();
					}
				});

		$("#btnList").click(function() {
			location.href = "/client/mission/missionList";
		});
	});
</script>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>상세페이지</h2>
			<br><br>
			<form id="missionUpdateForm" name="missionUpdateForm" method="post">
				<input type="hidden" name="m_no" value="${detail.m_no}" /> <input
					type="hidden" name="m_file" value="${detail.m_file}" /> <input
					type="hidden" name="m_thumb" value="${detail.m_thumb}" />
			</form>
			<form name="form" id="missionWriteForm">
				<div data-num="${detail.m_no}">
					<div class="mb-3">
						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="firstName">작성자(조회수 : ${detail.m_views})</label> <input
									class="form-control" type="text" value="${detail.id}"
									aria-label="readonly input example" readonly>
							</div>
							<div class="col-md-6 mb-3">
								<label for="lastName">작성일</label> <input class="form-control"
									type="text" value="${detail.m_date}"
									aria-label="readonly input example" readonly>

							</div>
						</div>
					</div>
					<br>
					<div class="mb-3">
						<label for="reg_id">제목</label> <input class="form-control"
							type="text" value="[${detail.m_c_name}]${detail.m_title}"
							aria-label="readonly input example" readonly>
					</div>
					<br>
					<div class="mb-3">
						<label for="reg_id">인증사진</label>
						<br><img
							src="/uploadStorage/mission/thumbnail/${detail.m_thumb}"
							class="img-thumbnail">
					</div>
					<br>
					<div class="mb-3">
						<label for="content">내용</label>
						<div class="form-floating" style="text-align: left">
							<textarea readonly class="form-control" id="floatingTextarea2"
								style="width: 100%; height: 200px;">${detail.m_content}</textarea>

						</div>
					</div>
				</div>
			</form>
			<br>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnModify">수정</button>
				<button type="button" class="btn btn-sm btn-danger" id="btnCancle">삭제</button>
				<button type="button" class="btn btn-sm btn-secondary" id="btnList">목록</button>
			</div>
		<jsp:include page="missionReply.jsp" />
		</div>
		
	</article>


</body>
</html>