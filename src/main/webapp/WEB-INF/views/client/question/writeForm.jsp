<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
	$(function(){
		
		//저장 버튼 클릭시 발생 이벤트
		$("#saveBtn").click(function(){
			//입력값 체크
			//입력값 체크
				if(!chkData("#q_title","제목을")) return;
				else if(!chkData("#q_content","작성할 내용을")) return;
				else if(!chkData("#q_pwd","비밀번호를")) return;
				else{
					if($("#file").val()!="") {
						if(!chkFile($("#file"))) return;
					}
					$("#f_writeForm").attr({
						"method" : "post",
						"enctype" : "multipart/form-data",
						"action" : "/question/questionInsert"
					});
					$("#f_writeForm").submit();
				};
		});
				
		//취소 버튼 클릭시 발생 이벤트
		$("#cancelBtn").click(function(){
			$("#f_writeForm").each(function(){
				this.reset();
			});
		});
		
		//목록 버튼 클릭시 발생 이벤트
		$("#listBtn").click(function(){
			location.href = "/question/questionList";
		});
	});
</script>

<body>
		<div class="container">
			<!-- <div class="contentTit page-header"><h2 class="text-center">게시판 글작성</h2></div> -->
				<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
				<table class="table table-bordered">
					<colgroup>
						<col width="20%"/>
						<col width="80%"/>
					</colgroup>
					<tr>
						<td>글제목</td>
						<td class="text-left"><input type="text"  name="q_title" id="q_title" class="form-control"></td>
					</tr>
					<tr>
						<td>글내용</td>
						<td class="text-left"><textarea rows="8" name="q_content"	 id="q_content" class="form-control" class="form-control"></textarea></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td class="text-left"><input type="password" name="q_pwd" id="q_pwd" class="form-control"></td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td class="text-left"><input type="file" name="file" id="file"></td>
					</tr>
				</table>
				
				<div class="contentBtn text-right">
					<input type="button"	value="저장" id="saveBtn" class="btn btn-success">
					<input type="button"	value="취소" id="cancelBtn" class="btn btn-success">
					<input type="button"	value="목록" id="listBtn" class="btn btn-success">
				</div>
			</form>
		</div>
</body>