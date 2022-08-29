<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		$(function(){
			//수정 버튼 클릭시 처리 이벤트
			$("#boardUpdateBtn").click(function(){
				//입력값 체크
				if(!chkData("#q_title","제목을")) return;
				else if(!chkData("#q_content", "작성할 내용을")) return;
				else{
					if($("#file").val()!=""){
						if(!chkFile($("#file"))) return;
					}
					$("#f_updateForm").attr({
						"method" : "post",
						"enctype" : "multipart/form-data",
						"action" : "/question/questionUpdate"
					});
					$("#f_updateForm").submit();
				}
			});
			
			//취소 버튼 클릭시 처리 이벤트
			$("#boardCancelBtn").click(function(){
				$("#f_updateForm").each(function(){
					this.reset();
				});
			});
			
			//목록 버튼 클릭시 처리 이벤트
			$("#boardListBtn").click(function(){
				location.href="/question/questionList";
			});
		});
	</script>
	</head>
	<body>
		<div class="contentTB text-center">
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="q_num" name="q_num" value="${updateData.q_num}"/>
					
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">글번호</td>
								<td class="col-md-3 text-left">${updateData.q_num}</td>
								<td class="col-md-3">작성일</td>
								<td class="col-md-3 text-left">${updateData.q_date}</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" class="col-md-8 text-left">${updateData.q_name}</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="3" class="text-left">
									<input type="text" name="q_title" id="q_title" class="form-control" value="${updataData.q_title}">
								</td>
							</tr>
							<tr class="table-tr-height">
								<td>글내용</td>
								<td colspan="3" class="text-left">
									<textarea name="q_content" id="q_content" class="form-control" rows="8">${updateData.q_content}</textarea>
								</td>
							</tr>
							<tr class="form-inline">
								<td>비밀번호</td>
								<td colspan="3" class="text-left">
									<input type="password" name="q_pwd" id="q_pwd" class="form-control" maxlength="18" />
									<label>수정할 비밀번호를 입력해 주세요.</label>
								</td>
							</tr>
							<tr>
								<td>이미지파일첨부</td>
								<td colspan="3" class="text-left"><input type="file" name="file" id="file"/></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
			<div class="contentBtn text-right">
				<input type="button" value="수정" id="boardUpdateBtn" class="btn btn-success"/>
				<input type="button" value="취소" id="boardCancelBtn" class="btn btn-success"/>
				<input type="button" value="목록" id="boardListBtn" class="btn btn-success"/>	
			</div>
		</div>
	</body>
</html>