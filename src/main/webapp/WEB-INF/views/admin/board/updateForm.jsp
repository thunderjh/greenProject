<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		$(function(){
			//수정 버튼 클릭시 처리 이벤트
			$("#boardUpdateBtn").click(function(){
				//입력값 체크
				if(!chkData("#n_title","제목을")) return;
				else if(!chkData("#n_content", "작성할 내용을")) return;
				else{
					if($("#file").val()!=""){
						if(!chkFile($("#file"))) return;
					}
					$("#f_updateForm").attr({
						"method" : "post",
						"enctype" : "multipart/form-data",
						"action" : "/admin/board/noticeUpdate"
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
				location.href="/admin/board/adminNoticeList";
			});
		});
	</script>
	</head>
	<body>
		<div class="contentTB text-center">
			<div class="contentTB text-center">
				<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="n_num" name="n_num" value="${updateData.n_num}"/>
					<input type="hidden" id="n_img_file" name="n_img_file" value="${updateData.n_img_file}"/>
										
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">글번호</td>
								<td class="col-md-3 text-left">${updateData.n_num}</td>
								<td class="col-md-3">작성일</td>
								<td class="col-md-3 text-left">${updateData.n_date}</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td colspan="3" class="col-md-8 text-left">${updateData.a_id}</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td colspan="3" class="text-left">
									<input type="text" name="n_title" id="n_title" class="form-control" value="${updataData.n_title}">
								</td>
							</tr>
							<tr class="table-tr-height">
								<td>글내용</td>
								<td colspan="3" class="text-left">
									<textarea name="n_content" id="n_content" class="form-control" rows="8">${updateData.n_content}</textarea>
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
				<input type="button" value="수정" id="boardUpdateBtn" class="btn btn-sm btn-primary"/>
				<input type="button" value="취소" id="boardCancelBtn" class="btn btn-sm btn-primary"/>
				<input type="button" value="목록" id="boardListBtn" class="btn btn-sm btn-primary"/>	
			</div>
		</div>
	</body>
</html>