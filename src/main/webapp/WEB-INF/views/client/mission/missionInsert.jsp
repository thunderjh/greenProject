<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/MissionCommon.jspf"%>
<!-- 미션인증게시판 글쓰기 -->
<script type="text/javascript">
	$(function() {
		$("#btnSave").click(function() {
			if (!chkData("#m_c_name", "카테고리를"))
				return;
			else if (!chkData("#m_title", "제목을"))
				return;
			else if (!chkData("#m_content", "내용을"))
				return;
			else {
				if($("#file").val()!=""){
					if(!chkFile($("#file"))) return;
				}
				$("#missionWriteForm").attr({
					"method" : "post",
					"action" : "/client/mission/missionInsert",
					"enctype" : "multipart/form-data"
				});
				$("#missionWriteForm").submit();
			}
		});

		$("#btnCancle").click(function() {
			$("#missionWriteForm").each(function() {
				this.reset();
			});
		});

		$("#btnList").click(function() {
			location.href = "/client/mission/missionList";
		});
	});
</script>
</head>
<body>
	<article>
		<div class="container">
			<h2>글쓰기</h2>
			<br>
			<br>
			<form name="form" id="missionWriteForm">
				<div class="mb-3">
					<label class="form-label">카테고리 선택</label><br> <select
						id="m_c_name" name="m_c_name" class="form-control">
						<option value="">카테고리 선택</option>
						<option value="환경">환경</option>
						<option value="사람">사람</option>
						<option value="번영">번영</option>
					</select>
				</div>
				<br>
				<div class="mb-3">
					<label class="form-label">제목</label> <input type="text"
						class="form-control" name="m_title" id="m_title"
						placeholder="내용을 입력해주세요">
				</div>
				<br>
				<div class="mb-3">
					<label class="form-label">내용</label>
					<input type="file"
						class="form-control" name="file" id="file" />
					<textarea class="form-control" rows="5" name="m_content"
						id="m_content" placeholder="내용을 입력해 주세요"></textarea>
				</div>

			</form>
			<br>
			<div class="contentBtn text-right">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-danger" id="btnCancle">취소</button>
				<button type="button" class="btn btn-sm btn-secondary" id="btnList">목록</button>
			</div>
		</div>
	</article>


</body>
</html>