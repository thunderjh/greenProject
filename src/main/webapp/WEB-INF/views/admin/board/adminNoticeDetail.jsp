<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<link rel="stylesheet" type="text/css" href="/resources/include/css/noticeDetail.css"/>
	
<script type="text/javascript">
	let buttonCheck=0;	//수정버튼과 삭제버튼을 구별하기 위한 변수
	$(function(){
		
		//수정 버튼 클릭시 처리 이벤트
		$("#updateBtn").click(function(){
			$("#f_data").attr({
				"action" : "/admin/board/updateForm"
			});
			
			$("#f_data").submit();
		});
		
		//삭제 버튼 클릭시 처리 이벤트
		$("#removeBtn").click(function(){
			var result = confirm("삭제 하시겠습니까?");
			
			if(result){
				$("#f_data").attr({
					"action" : "/admin/board/noticeDelete"
				});
				
				$("#f_data").submit();
			} else{
				
			}
			
		});
		
		//글쓰기 버튼 클릭시 처리 이벤트
		$("#writeBtn").click(function(){
			location.href = "/admin/board/writeForm"
		});
		
		//목록
		$("#listBtn").click(function(){
			location.href="/admin/board/adminNoticeList"
		});
		
		$("#nextNotice").click(function(){
			let n_num = $(this).attr("data-num");
			$("#n_num").val(n_num+1);
			$("#nextNum").attr({
				"method" : "get",
				"action" : "/admin/board/adminNoticeList"
			});
			$("#nextNotice").submit();
		});
	}); //$(function() 종료)
</script>
</head>
<body>
	<div class="contentContainer container">
		
		<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="n_num" value="${detail.n_num}"/>
				<input type="hidden" name="n_img_file" value="${detail.n_img_file}"/>
			</form>
		
		<!-- 글수정, 삭제, 글쓰기, 목록 버튼 -->
		<div class="text-right">
			<input type="button"	value="글수정" id="updateBtn"	 class="btn btn-sm btn-primary">
			<input type="button"	value="글삭제" id="removeBtn"	 class="btn btn-sm btn-primary">
			<input type="button"	value="글쓰기" id="writeBtn"	 class="btn btn-sm btn-primary">
			<input type="button"	value="목록" id="listBtn"	 class="btn btn-sm btn-primary">			
		</div>
		<br/>
		
		<!-- 공지사항 글 상세보기 시작 -->
		<div class="contentTB text-center">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="col-md-12" >
							<span class="span_left">${detail.n_title}</span>
							<span class="span_right"><em>등록일</em>${detail.n_date}</span>
						</td>
					</tr>
					<tr class="table-tr-height" >
						<td class="col-md-12 text-center">
							<br/>
							${detail.n_content}
							<c:if test="${not empty detail.n_img_file}">
								<img src="/uploadStorage/notice/${detail.n_img_file}"/>
							</c:if> 
							<br/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>