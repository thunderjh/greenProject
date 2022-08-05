<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/common/MissionCommon.jspf"%>

<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function(){
		if (!chkData("#m_c_name", "카테고리를"))
			return;
		else if (!chkData("#m_title", "제목을"))
			return;
		else if (!chkData("#m_content", "내용을"))
			return;
		else{
			if($("#file").val()!=""){
				if(!chkFile($("#file"))) return;
			}
			$("#missionUpdate").attr({
				"method" : "post",
				"action" : "/client/mission/missionUpdate",
				"enctype" : "multipart/form-data"
			});
			$("#missionUpdate").submit();
			
		}
	});
	
	$("#btnCancle").click(function(){
		$("#missionUpdate").each(function(){
			this.reset();
		});
	});
	
	$("#btnList").click(function(){
		location.href ="/client/mission/missionList";
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
			<form name="form" id="missionUpdate" name="missionUpdate">
			<input type="hidden" id="m_no" name="m_no" value="${data.m_no}">
			<input type="hidden" id="m_file" name="m_file" value="${updateData.m_file}">
			<input type="hidden" id="m_thumb" name="m_thumb" value="${updateData.m_thumb}">
				<div class="mb-3">
					<label class="form-label">카테고리 선택</label><br> <select
						id="m_c_name" name="m_c_name" class="form-control">
						<option selected value="${updateData.m_c_name}">${updateData.m_c_name}</option>
						<option value="환경">환경</option>
						<option value="사람">사람</option>
						<option value="번영">번영</option>
					</select>
				</div>
				<br>
				<div class="mb-3">
					<label class="form-label">제목</label> <input type="text"
						class="form-control" name="m_title" id="m_title"
						value="${updateData.m_title}">
				</div>
				<br>
				<div class="mb-3">
					<label class="form-label">내용</label>
					<input type="file"
						class="form-control" name="file" id="file" />
					<textarea class="form-control" rows="5" name="m_content"
						id="m_content">${updateData.m_content}</textarea>
				</div>

			</form>
			<br>
			<div class="contentBtn text-right">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-danger" id="btnCancle">취소</button>
				<button type="button" class="btn btn-sm btn-secondary" id="btnList">목록</button>
			</div>
		</div>
	</article>


</body>
</html>